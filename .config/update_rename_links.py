"""
A script to update links in a repository after files have been renamed.
"""

import os
import re
import subprocess
import sys
import pathlib
import yaml


def get_git_diff():
    """
    Get the git diff between base_ref and head_ref branches.
    """
    base_ref = sys.argv[1]
    head_ref = sys.argv[2]
    command = f"git diff --name-status {base_ref}..{head_ref}"
    result = subprocess.run(
        command, stdout=subprocess.PIPE, shell=True, text=True, check=True
    )
    return result.stdout.splitlines()


def get_renames_and_deletions(lines):
    """
    Extract renames and deletions from the git diff lines.
    """
    renames = []
    deletions = 0
    additions = 0
    mkdocs_mod = False
    redirects_mod = False
    for line in lines:
        _, *files = line.split()
        if line.startswith("R"):
            renames.append((files[0], files[1]))
        elif line.startswith("D") and line.endswith(".md"):
            deletions += 1
        elif line.startswith("A") and line.endswith(".md"):
            additions += 1

        if ".config/mkdocs.yml" in files:
            mkdocs_mod = True
        if ".config/redirects.yml" in files:
            redirects_mod = True

    return (
        renames,
        deletions,
        additions,
        mkdocs_mod,
        redirects_mod,
    )


def get_all_markdown_files(path="."):
    """
    Get a list of all markdown files in the specified path.
    """
    path = pathlib.Path(path)
    markdown_files = [
        str(p)
        for p in path.rglob("*.md")
        if not any(part.startswith(".") for part in p.parts)
    ]
    return markdown_files


def calculate_relative_paths(old, new, md_file):
    """
    Calculate the relative paths between the old and new locations and base markdown file.
    """
    old_relative = pathlib.Path(old).name
    new_relative = pathlib.Path(new).name
    md_file_dir = pathlib.Path(md_file).parent

    old_relative_path = os.path.relpath(pathlib.Path(old).parent, md_file_dir)
    new_relative_path = os.path.relpath(pathlib.Path(new).parent, md_file_dir)

    old_full_relative = os.path.join(old_relative_path, old_relative).removeprefix("./")
    new_full_relative = os.path.join(new_relative_path, new_relative).removeprefix("./")

    return old_full_relative, new_full_relative


def replace_link(content, old, new):
    """Relace a link in the content, preserving anchors."""
    return re.sub(
                rf"\]\({re.escape(old)}(#[^)]+)?\)",
                f"]({new}\\1)",
                content,
            )

def update_links_to_renamed_files(renames):
    """
    Update the links to renamed files in all markdown files.
    """
    markdown_files = get_all_markdown_files()
    for old, new in renames:
        for md_file in markdown_files:
            with open(md_file, "r", encoding="utf-8") as file:
                content = file.read()

            old_relative, new_relative = calculate_relative_paths(
                old, new, md_file
            )
            new_content = replace_link(content, old_relative, new_relative)

            if content != new_content:
                print(
                    f"Updated links from {old_relative} to {new_relative} in {md_file}"
                )
                with open(md_file, "w", encoding="utf-8") as file:
                    file.write(new_content)


def update_links_between_renamed_files(renames):
    """
    Update any links between renamed files.

    This is a special case because old links will point to the old file
    location relative to the old link location, not the current locations.
    """
    for old, new in renames:
        with open(new, "r", encoding="utf-8") as file:
            content = file.read()

        new_content = content
        for old_link, new_link in renames:
            # Use the original path before the rename
            old_relative, new_relative = calculate_relative_paths(
                old_link, new_link, old
            )
            new_content = replace_link(content, old_relative, new_relative)

        if content != new_content:
            print(f"Updated links between renamed files in {new}")
            with open(new, "w", encoding="utf-8") as file:
                file.write(new_content)


def update_renamed_file_links(renames):
    """
    Update the links within the renamed files to account for directory changes.
    """
    for old, new in renames:
        with open(new, "r", encoding="utf-8") as file:
            content = file.read()

        old_dir = pathlib.Path(old).parent
        new_dir = pathlib.Path(new).parent

        relative_path = os.path.relpath(old_dir, new_dir)

        # Find all relative markdown links
        links = re.findall(r"\]\(([^)]+)\)", content)
        new_content = content
        for link in links:
            link_without_anchor = link.split("#")[0]
            if not link_without_anchor.startswith(
                "http"
            ) and not link_without_anchor.startswith("mailto"):
                old_link_path = pathlib.Path(link_without_anchor)
                if not old_link_path.is_absolute():
                    updated_link = os.path.normpath(
                        os.path.join(relative_path, link_without_anchor)
                    )

                    # Check if the link points to an existing file before updating
                    # This is to avoid applying the path transforms twice if running
                    # the script multiple times
                    updated_link_path = pathlib.Path(new).parent / updated_link
                    if updated_link_path.exists():
                        new_content = new_content.replace(
                            f"]({link})", f"]({updated_link})"
                        )

        if content != new_content:
            print(f"Updated links in renamed file {new}")
            with open(new, "w", encoding="utf-8") as file:
                file.write(new_content)


def update_mkdocs_nav(renames):
    """
    Update the navigation in the mkdocs.yml file.
    """
    with open(".config/mkdocs.yml", "r", encoding="utf-8") as file:
        content = file.read()
    new_content = content
    for old, new in renames:
        new_content = new_content.replace(old, new)
    if content != new_content:
        print("Updated mkdocs.yml nav")
        with open(".config/mkdocs.yml", "w", encoding="utf-8") as file:
            file.write(new_content)


def update_redirects(renames):
    """
    Update the redirects in the redirects.yml file.
    """
    redirects_file = ".config/redirects.yml"

    with open(redirects_file, "r", encoding="utf-8") as file:
        redirects = yaml.safe_load(file)

    for old, new in renames:
        old_url = "/" + old.removesuffix(".md").removesuffix("/README") + "/"
        new_url = "/" + new.removesuffix(".md").removesuffix("/README") + "/"

        existing_redirect = None
        for redirect in redirects:
            if redirect["from_url"] == old_url:
                # Update any existing redirects
                existing_redirect = redirect
            if redirect["from_url"] == new_url:
                # Remove potential redirect loop
                redirects.remove(redirect)

        if existing_redirect:
            existing_redirect["to_url"] = new_url
        elif old_url != new_url:
            new_redirect = {
                "type": "page",
                "from_url": old_url,
                "to_url": new_url,
            }
            redirects.append(new_redirect)

    with open(redirects_file, "w", encoding="utf-8") as file:
        print("Updated redirects.yml")
        yaml.safe_dump(redirects, file)


def main():
    """Main entry point"""
    if len(sys.argv) < 3:
        print(
            "Usage: python update_rename_links.py <base_ref> <head_ref> [<github_env>]"
        )
        sys.exit(1)

    git_diff_lines = get_git_diff()
    (
        renames,
        deletions,
        additions,
        mkdocs_mod,
        redirects_mod,
    ) = get_renames_and_deletions(git_diff_lines)

    # Process various updates given detected renames.
    if renames:
        update_links_to_renamed_files(renames)
        update_links_between_renamed_files(renames)
        update_renamed_file_links(renames)
        update_mkdocs_nav(renames)
        update_redirects(renames)

    # Set flag so we can post a reminder for the user to update files if
    # it looks like they may have forgotten.
    reminder = False
    if deletions and additions and not (mkdocs_mod or redirects_mod):
        # In this case we don't know if it is for sure a rename, but it is
        # likely a rename with significant changes also.
        reminder = "POTENTIAL_RENAME"
    elif deletions and not (mkdocs_mod or redirects_mod):
        reminder = "DELETION"
    elif additions and not mkdocs_mod:
        # Additions do not require redirects, but they do normally need a nav update.
        reminder = "ADDITION"
    if reminder and len(sys.argv) > 3:
        github_env = sys.argv[3]
        with open(github_env, "a", encoding="utf-8") as file:
            file.write(f"REMINDER={reminder}\n")


if __name__ == "__main__":
    main()
