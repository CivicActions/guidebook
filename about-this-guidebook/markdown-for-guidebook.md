---
title: Markdown
---

# Markdown

The guidebook is written in markdown.

## The Commonmark spec

We use the [Commonmark](http://commonmark.org/) spec, which is somewhat more strict than the markdown parsers. For this reason, it's probably worth upping your Markdown game, even if you've been using it for years. The Markdown checking tool will complain if you use the wrong syntax, and your edits will not be merge-able.

There's a great tutorial [on the Commonmark website](http://commonmark.org/help/tutorial/).

## Common markdown errors to avoid

- You need a blank line before every "block" of text. "Blocks" include paragraphs, headings, lists, code blocks, blockquotes, etc.
- You need a blank line at the end of each file.
- Headings (#, ##, ###, etc.) must increment correctly. You can't go from # (h1) to ### (h3).

## Format auto-correct

- Many common Markdown formatting issues will be automatically corrected after you submit your Pull Request.
- This applies the FOSS tool [Mdformat](https://github.com/hukkin/mdformat) using the mkdocs plugin.

## Markdown checking (linter)

We use <http://remark.js.org/> for additional linting/checking our markdown syntax as well as making suggestions around common readability, language and grammar issues.

- The [remarkrc.problem file](https://github.com/CivicActions/guidebook/blob/master/.config/remark/remarkrc.problem) shows a list of all the rules being enforced.
- The [remarkrc.suggestion file](https://github.com/CivicActions/guidebook/blob/master/.config/remark/remarkrc.suggestion) shows a list of all rules used to give suggestions.

This linter is run by [GitHub Actions](automatic-checking.md) with each pull request and code merge, and will automatically post a pull request review indicating problems and suggestions. You can also access the log of problems and suggestions from the GitHub Actions check details link.

Finally, the mkdocs command may identify broken links or other issues in the pull request.

### Running auto-format locally

- Install python if you don't have it already: <https://www.python.org/downloads/>.
- Install poetry: <https://python-poetry.org/docs/#installation>.
- Open a terminal and `cd` to your Git root.
- Run `poetry -C .config/mkdocs installroot` to install the dependencies.
- Run `poetry -C .config/mkdocs run format-changed` to format all changed markdown files in your git repository.

### Running the linter locally

You can check that your markdown complies with the retext and remark locally:

- Install node.js if you don't have it already: <https://nodejs.org/en/download/> (or use a package manager).
- Install yarn: <https://yarnpkg.com/lang/en/docs/install/> (various options to install, could also use a package manager).
- Open a terminal and `cd` to your Git root.
- Run `yarn --cwd .config/remark/ install` to install the dependencies.
- Run `yarn --cwd .config/remark/ run remark-changed` to check all changed markdown files in your git repository.

## Editors

Markdown can be really easy to use with a good editor such as some of these [text editors](../practice-areas/engineering/text-editors-ides.md) - some editors have plugins that support Mdformat and Remark linting for real time fixing and feedback on your edits - just check they have the right plugins and configuration files.

## Mixing HTML and Markdown

For any markup that is not covered by Markdown's syntax, you simply use HTML itself. There's no need to preface it or delimit it to indicate that you're switching from Markdown to HTML; you just use the tags.

Examples:

<details>
  <summary>Example of an accordion</summary>
  HTML block
</details>
