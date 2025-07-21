#!/usr/bin/env python3
"""
Script to run mdformat on changed files in the git repository.
"""

import subprocess
import sys
import os
from pathlib import Path


def get_git_root():
    """Get the root directory of the git repository."""
    try:
        result = subprocess.run(
            ["git", "rev-parse", "--show-toplevel"],
            capture_output=True,
            text=True,
            check=True
        )
        return Path(result.stdout.strip())
    except subprocess.CalledProcessError:
        print("Error: Not in a git repository")
        sys.exit(1)


def get_changed_files():
    """Get list of changed markdown files in the git repository."""
    try:
        # Get staged files
        staged_result = subprocess.run(
            ["git", "diff", "--cached", "--name-only", "--diff-filter=ACMR"],
            capture_output=True,
            text=True,
            check=True
        )

        # Get unstaged files
        unstaged_result = subprocess.run(
            ["git", "diff", "--name-only", "--diff-filter=ACMR"],
            capture_output=True,
            text=True,
            check=True
        )

        # Combine and deduplicate
        all_files = set(staged_result.stdout.strip().split('\n') +
                       unstaged_result.stdout.strip().split('\n'))

        # Filter for markdown files and remove empty strings
        md_files = [f for f in all_files
                   if f and (f.endswith('.md') or f.endswith('.markdown'))]

        return md_files
    except subprocess.CalledProcessError as e:
        print(f"Error getting changed files: {e}")
        sys.exit(1)


def run_mdformat(files, git_root):
    """Run mdformat on the specified files."""
    if not files:
        print("No changed markdown files found.")
        return

    # Convert relative paths to absolute paths from git root
    abs_files = [str(git_root / file) for file in files]

    # Filter out files that don't exist (might have been deleted)
    existing_files = [f for f in abs_files if os.path.exists(f)]

    if not existing_files:
        print("No existing markdown files to format.")
        return

    print(f"Formatting {len(existing_files)} markdown file(s):")
    for file in existing_files:
        print(f"  - {Path(file).relative_to(git_root)}")

    try:
        subprocess.run(["mdformat"] + existing_files, check=True)
        print("✓ mdformat completed successfully")
    except subprocess.CalledProcessError as e:
        print(f"Error running mdformat: {e}")
        sys.exit(1)


def main():
    """Main entry point for the format-changed command."""
    git_root = get_git_root()
    changed_files = get_changed_files()
    run_mdformat(changed_files, git_root)


if __name__ == "__main__":
    main()
