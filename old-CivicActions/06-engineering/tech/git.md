# Git

## Git Overview

As you probably already know, Git is a source code versioning system that lets you locally track changes and push or pull changes from remote resources. All projects use Git.

Here are some references to review if you are unfamiliar with it.

- [Pro Git book](https://git-scm.com/)
- [Github resources](https://help.github.com/articles/git-and-github-learning-resources/)
- [Getting Git Right](https://www.atlassian.com/git/)
- [Version Control with Git book](http://www.amazon.com/Version-Control-Git-collaborative-development/dp/1449316387)

More advanced resources to learn "how git works" at a lower level, which is helpful for building your mental model for using rebasing, reflog, etc.

- <https://www.youtube.com/watch?v=MYP56QJpDr4>
- [Non-video companion to the first half](http://git-scm.com/book/en/v2/Git-Internals-Git-Objects)

## Git best practices

_Note: your project may include other code review practices. Please review your project developer/contributor documentation!_

- Atomic commits:
  - Generally commits should be as small as possible.
  - The code should be in a functional state after each commit (even if incomplete) - avoid committing code which will won't run at all.
- Write good commit messages. A good commit message should:
  - Reference the associated ticket ID using a prefix, e.g. `ABC-123:`. This makes it easier to locate tickets from git log/blame output as well as helping make sure all work is associated with a ticket.
  - Have a one line (max 80 char) title/summary of the change, followed by a blank line and then further detail which should:
    - Explain the reason(s) for the change.
    - Detail what changed and any consequences of this (on code, data, users, security etc) - include any key terms that would help a future person searching commits.
    - Often this will include the same detail that you might include in code comments.
- Feature branches, pull requests (PR) & merge requests (MR):
  - These should contain a closely related series of commits that solves a single problem - avoid including changes that are unrelated.
  - Most often a single (well scoped) ticket will be resolved in a single PR/MR.
    - However, it is good to break larger changes over multiple PRs/MRs that each addresses a logical piece of the whole - this can make the code easier to review.
  - When merging PRs and MRs we prefer a rebase workflow with fast-forward merges (rather than a merge commit) since this retains a clean and linear commit history which can be helpful for future engineers.
    - For small PRs/MRs where there isn't much commit detail using a squash merge approach can also be fine.
- Rebasing commits on a feature branch - we do this for 2 reasons:
  - To update the feature branch on top of more recent changes in master so that it can be easily merged when ready.
  - To adjust the commits on the branch with an interactive rebase - for example:
    - Squashing 2 together that make more sense as one change.
    - Splitting a large commit into 2+ smaller ones.
    - Adjusting the wording of commit messages (see above).
    - Dropping any temporary/scratch commits.
  - When rebasing a feature branch, it's encouraged to leave commits showing earlier attempts, even if you later found a better approach.
    - This helps "tell the story" of the change - someone digging though the history may wonder why the first approach didn't work.
    - It also leaves the code available in the history in case you later find a use for that work.

### Git best practice resources

- <https://blog.mocoso.co.uk/talks/2015/01/12/telling-stories-through-your-commits/>
- <https://about.gitlab.com/blog/2018/06/07/keeping-git-commit-history-clean/>

## Code review

_Note: your project may include other code review practices. Please review your project developer/contributor documentation!_

- Code reviews are shared between all developers - if you finish a ticket (or just want a break) check for outstanding PRs/MRs before picking up a new ticket.
  - This is because getting shared awareness of the code others are working on helps the team learn and become more able to work across all areas of the codebase.
  - If reviewing code that is outside your area of expertese you can always ask for a second set of eyes.
  - On most projects, code review is done at the same time as some level of functional testing using a review environment specific to the PR/MR.
- Review using a [phased process](https://sage.thesharps.us/2014/09/01/the-gentle-art-of-patch-review/) that starts at the big picture, giving feedback (as needed) and getting alignment (as needed) on one phase before moving on. This avoids excessive detail early on and is more helpful to the developer.
  1. Is the idea behind the PR/MR sound?
  2. Is the PR/MR architected correctly?
  3. Is the PR/MR polished?
- For code that touches complex or risky areas (e.g. security or performance implications), it's great to have 2 or even 3 reviewers take a look before merging.
- Most coding standards should generally be applied automatically using code auto-formatting tools and/or reviewed automatically using code linting and code quality checking tools.
  - If this is not the case on your project, add this in your CI pipeline!
- Quality code is human friendly (self documenting, maintainable, adaptable)
- Try to make at least one point for improvement: encourage conversation
- Call out good code: praise is valuable feedback
- Put feedback in the form of questions: encourage collaboration

### Core review resources

- <https://sage.thesharps.us/2014/09/01/the-gentle-art-of-patch-review/>
- <https://mtlynch.io/human-code-reviews-1/>
- <https://mtlynch.io/human-code-reviews-2/>
- <https://martinfowler.com/books/refactoring.html>
- <https://www.pearson.com/us/higher-education/program/Martin-Clean-Code-A-Handbook-of-Agile-Software-Craftsmanship/PGM63937.html>

## Standard git workflow

_Note: your project may include other git workflows. Please review your project developer/contributor documentation!_

- Our standard workflow uses:
  - Trunk based development with a single `master` branch - i.e. no additional long lived branches (e.g. `stable`) that get repeated merges
  - Short lived feature branches living in developer forks with PRs/MRs for all work
  - Feature branches should be prefixed with the related ticket ID (i.e. `abc-123-my-feature`).
  - We often rebase feature branches and use fast-forward merges
- We follow an [upstream first](https://www.chromium.org/chromium-os/chromiumos-design-docs/upstream-first) practice for all development - this means:
  - If the code you want to change is in an external library or module, contribute the change to that library first before bringing it into your actual project (e.g. by adding the patch to a build tool or adjusting the source to point to an upstream that includes the change)
  - If you need to make a hotfix make a PR/MR to the main `master` branch first before creating/patching a hotfix branch.
- Feature branches undergo both automatic and manual testing before being merged - this makes sure that master always passes tests.
  - Testing often includes linting, unit and functional tests as well as specialised tests such as security and accessibility scans.
  - On most projects a dedicated review environment for each feature branch or PR/MR is created automatically and can be used for manual testing as well as stakeholder demos and user testing as needed to validate functionality before the branch is merged.

Compared to other documented workflows:

- [Gitlab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html) - similar, although we prefer tags over environment branches
- [GitHub Flow](https://guides.github.com/introduction/flow/) - similar, although we prefer rebase/fast-foward merges and don't deploy feature branches into production (but to review environments instead)
- [Git flow](https://nvie.com/posts/a-successful-git-branching-model/) - not very similar - ours is much simpler, avoids long lived branches and repeated merges

## Versioning releases

_Note: your project may include other versioning practices. Please review your project developer/contributor documentation!_

For libraries, we use [semantic versioning](https://semver.org/).

For web sites or applications we use an `vX.Y.Z` syntax with the following meaning:

- X: The sprint number
- Y: A zero-based counter indicating the number of releases to the stage environment
- Z: A zero-based counter indicating the number of hotfix releases to the prod environment

So in the normal release flow:

- First sprint, pushes to stage has tag v1.0.0
- Further work and a v1.1.0 tag is created and pushed to stage
- Over the course of the sprint you might get v1.2.0, v1.3.0 etc
- Sprint 1 ends, v1.3.0 looks good, gets pushed to prod

In the case a subsiquent hotfix is required:

- In Sprint 2 work continues on master, v2.0.0 tag gets pushed to stage etc.
- Meanwhile, critical bugfix needed on prod, so the v1.3.0 is branched to v1.
  - There is no need for further suffixes in the branch name, since it's the only branch for sprint 1
  - We don't typically create these branches until they are needed, since it's hopefully rare to need critical hotfixes and we have a tag documenting the state of the release.
- Fix is pushed to master (i.e. upstream-first workflow), then cherry-picked to v1.
- Tag v1.3.1 is then created from the v1 branch, pushed to stage (or some dedicated hotfix stage environment) and then to prod.
- If another hotfix is needed, that commit would also be merged to master, cherry-picked into v1 and tagged v1.3.2 etc.

In a continuous deployment project these tags can be created automatically, or some other mechanism may be used to track releases.

## Git configuration

Here is a recommended Git configuration block that it is recommended to add to your `.

```
##
## These are standard CivicActions git settings for developers.
##
[core]
  # This is for MacOS or Linux. For Windows set to `true`.
  autocrlf = input
[merge]
  ff = only
[pull]
  ff = only
```

## GitLab, GitHub, and Bitbucket

GitLab, GitHub, and Bitbucket are services that provides remote access to Git repositories. In addition to hosting your code, these services provide additional features designed to help manage the software development lifecycle. These additional features include managing the sharing of code between different people, bug tracking, wiki space and other tools for "social coding".

- GitHub is a publicly available, free service which requires all code (unless you have a paid account) be made open. Anyone can see code you push to GitHub and offer suggestions for improvement. GitHub currently hosts the source code for tens of thousands of open source projects. CivicActions uses GitHub for all open source projects (except those which are better hosted on an open source community infrastructure), as well as internal, client or pro-bono projects that should be developed in public.

- GitLab is an open source GitHub like software that organizations can use to provide internal management of Git repositories. CivicActions has setup a GitLab server for internal and client projects that should not be developed in public. <https://git.civicactions.net>

### Can Code move between GitLab, GitHub, and Bitbucket?

Yes! All you have to do is point or rebase your local copy to the new remote source. Please note, only your source code will move. Any additional features you use (wiki, bug tracking, etc.) will need to be manually copied.

### When do we use GitLab vs. GitHub?

CivicActions uses GitHub for all open source projects (except those which are better hosted on an open source community infrastructure), as well as internal, client or pro-bono projects that should be developed in public.

Use GitLab for internal and client projects that should not be developed in public. (This is going to be most of them).

---

TODO: from Truss:

## Note on Default Branches

Where possible the documents here should refer to the Default Branch instead of using the word `master`.

Where this is not possible try to use the default branch name `main`. In links to repos in github please also attempt to get the reference to `main` and not to `master`.

- [Dangit, Git!](https://dangitgit.com) - A plain English guide to solving common Git issues

# [Source Control](./README.md) / Git Repos

This page provides guidance on how to set up and manage your Git repos.
For Truss, most of these will be kept in [GitHub](https://github.com),
so much of this advice will be geared specifically to managing GitHub
repositories.

## Setting Up Repositories

We try to manage our Git repositories with [Terraform](https://terraform.io)
as much as possible. However, we haven't had great luck creating repos with
Terraform, so what we do is create the repo manually in GitHub, then import
it into Terraform. For an example of how we've done that, and what Terraform
code for GitHub repositories looks like, you can look in the
[legendary-waddle repo](https://github.com/trussworks/legendary-waddle/tree/master/trussworks-prod/github-global).

## Repo Maintenance and Hygiene

- Avoid including files in source control that are specific to your development
  machine or process. For example, your editor or OS might generate files that are
  not pertinent to your project. Since those types of files will need to be
  [ignored](https://help.github.com/en/github/using-git/ignoring-files) from all
  the repos you work on, it's more convenient to set them once in a global
  `.gitignore` file (typically named `~/.gitignore_global`), as opposed to in each
  repo's `.gitignore`. Once you create your file and add rules to it, you can tell
  Git to use it:

  ```
  git config --global core.excludesfile ~/.gitignore_global
  ```

- Delete local and remote feature branches after merging. This allows us to
  reuse branch names, and makes it easier for you to differentiate between
  your branches that are done and those that are still being worked on. To turn
  this on in GitHub, check the "Automatically delete head branches" box under
  the "Merge button" heading in the Options settings for your repo. If you're
  maintaining the repo with our
  [terraform-github-repo](https://registry.terraform.io/modules/trussworks/repo/github)
  module, it will turn this on automatically.

Locally, you can add an alias to your `~/.gitconfig` file. Example:

```
[alias]
  fresh = "!git co main && git pull && git branch --merged | grep -v '\\*' | xargs -n 1 git branch -D"
```

Then instead of doing the typical `git checkout main && git pull`, you would
only run `git fresh`.

## GitHub Repo Settings

- [Protect the default branch](https://help.github.com/en/articles/configuring-protected-branches) by turning on the following settings at a minimum:

  - Require pull request reviews before merging
  - Require status checks to pass before merging
  - Include administrators

  If you're maintaining the repo with our [terraform-github-repo](https://registry.terraform.io/modules/trussworks/repo/github)
  module, it will turn this on automatically.

## Splitting Out Code to a New Repository

If you need to split out code from one of your repositories into its own
separate repo, you can follow these steps to make sure you're preserving
the commit history when doing so.

The `filter-branch` subcommand to `git` can be used to accomplish this, but the
[documentation](https://git-scm.com/docs/git-filter-branch) strongly
discourages its use. Instead, a third-party utility called
[git-filter-repo](https://github.com/newren/git-filter-repo) is recommended.

First, create a new repo using the GitHub UI as you would normally.

In your terminal, clone a copy of the original repo into a new folder:

```sh
git clone git@github.com:OWNER/REPONAME.git NEWREPO && cd NEWREPO
```

Filter out commits that change the specified directory:

```sh
git-filter-repo --subdirectory-filter DIRNAME
```

The `origin` remote will be removed in this process. Add it back with the new
repo URL, and push the filtered work tree:

```sh
git remote add origin git@github.com:OWNER/NEWREPO.git
git push --set-upstream origin <main>
```

Note: This repo should be public and properly licensed. Truss has a
:lock:[decision record][license_tdr] on what licenses should be applied to
which sorts of projects.

If your project is managing its GitHub repositories with Terraform as
we suggest, make sure you add the repo to the Terraform code and import
it from GitHub. Speak to your project's infrasec team if you need help
with this.

[license_tdr]: https://docs.google.com/document/d/12UYIN3XfRPdKQV87_0ILa9-z6eWRBcLqtwP9fCyR6Tg/edit

# [Source Control](./README.md) / Git Workflow

At Truss, we've tried to come up with some standardized workflows for
working with Git. This page hopes to capture them so that new Trussels
can work cleanly with other developers and minimize friction.

## Branching Strategy

There are several well-established branching strategies and workflows out there.
[This article](https://web.archive.org/web/20191115042322/https://medium.com/@patrickporto/4-branching-workflows-for-git-30d0aaee7bf) covers four leading types.

Each project will have its own requirements, and sometimes even individual
projects might need different approaches, but generally Truss recommends the
["GitHub Flow"](https://guides.github.com/introduction/flow/), for its
lightweight process and ease of use with [CI/CD](../cicd/README.md).

However, the "Git Flow" process is useful in scenarios where you have a
slower release process, e.g. for mobile apps that have a App Store as part
of its critical release path.

## Fork vs Clone

If it's a repo you have write and push access to, clone it. Otherwise, fork it.

## Cloning with SSH vs HTTPS

Use [HTTPS] for read-only repos (where you’re only ever going to clone and pull),
and use [SSH] for everything else. SSH supports certificates on security keys,
and HTTPS does not. Therefore, we should not use HTTPS for anything that requires
authentication. However, if you’re just pulling a public repo, HTTPS is more
convenient since you don’t need to authenticate anything (unlike SSH for
read-only repos).

[ssh]: https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[https]: https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository

## Working locally

Pick either `rebase` or `merge` to incorporate changes from the default branch onto your
local branch. Use the same method every time for consistency. Most people
use `rebase`.

## PR Size

Pull requests should be small and focused enough to be reviewable in under 15,
or ideally under 5, minutes. Small PRs have a better chance of being quickly
accepted. The longer the PR, the more an engineer has to keep in their head, and
the more contiguous time they need to schedule for the review. This might lead
to a less thorough and delayed review, which could block you from your other
work. Long-lived PRs also often require more frequent updates with the main
branch, which could result in mistakes when conflicts are present.

## After creating a PR in GitHub

Once a branch has been pushed to GitHub and a PR has been submitted for review,
any changes should be made via individual new commits. Never force push while
a PR is under review. This avoids issues such as merge conflicts or accidental
overwriting of code when others are using your branch.

## Merging an approved PR

The recommendations below are based on a survey we sent out both internally and
outside Truss, although we only received 41 responses.

### PR with multiple commits

Once a PR has been approved, we recommend squashing commits so that the only
ones that remain are meaningful ones that pertain to the overall goal of the PR.
For example, if a PR is focused on a small specific task, and along the way you
created commits that fixed typos or broken tests, those deserve to be squashed.
It's easier to understand a PR when there aren't distracting commmits.

We don't require any particular way to squash commits, but we recommend using
GitHub's `squash and merge` button as it's the safest option. We do not
encourage nor require force pushing, but if you have experience using force push
responsibly, and prefer using interactive rebase to squash locally, you may use
it.

Take time to write a good commit message (as described in the
[Commit messages](#commit-messages) section below), and add any relevant
information from the PR review.

#### Rationale

Although most survey respondents stated they don't typically squash commits, we
still recommend squashing because the consequences of **not** squashing are
more negative than those of squashing.

Below are the most common consequences of not squashing chosen by survey
respondents:

- hard to read the Git history
- hard to link individual commits back to the GitHub PR
- hard to understand the reason behind a change

Conversely, the most common (90%) consequence of squashing chosen was:

- It was hard to understand or work with big commits that had too many unrelated
  changes

And the most common reason for having big commits was:

- Keeping PRs small and focused was not enforced during code reviews

We feel this is much easier to address through team norms and communication, and
is one of the guidelines in this document. See [PR size](#pr-size) above.

Additional benefits of squashing mentioned by survey respondents include:

- Keeping a clean commit history with detailed commit messages serves as
  documentation for our future selves and for future folks who will work on the repo

- It makes it easier to revert commits or PRs

- It allows us to update the final commit message to incorporate any relevant
  discussion from the PR review

## Commit messages

For each meaningful commit, write a
[good commit message](https://chris.beams.io/posts/git-commit/) following these
seven rules:

1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the [imperative mood] in the subject line
6. Wrap the body at 72 characters
7. Use the body to explain what and why vs. how

Example:

```
Replace chromedriver-helper with webdrivers

`chromedriver-helper` says in bold on their README that they are no
longer maintaining it and that people should use `webdrivers` instead.

Additionally, `webdrivers` has a very useful feature that will
automatically use the right version of `chromedriver` based on the
version of Chrome that is installed on the machine. This was not
possible with `chromedriver-helper`, which made it harder to deal with
versioning locally and in Circle CI.

Resolves #123
```

[imperative mood]: https://en.wikipedia.org/wiki/Imperative_mood
