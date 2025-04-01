---
title: Drupal Contrib First module development
---

# Drupal Contrib First module development

When a new module is needed we try to follow [Contrib First](../../../common-practices-tools/contribution/contrib-first.md), the process looks like this:

1.  Check with project leadership to make sure the contract allows for it.
2.  Gather requirements and identify MVP vs nice-to-haves
3.  Search for existing modules that might solve the problem. (It might be easier to stretch an existing module than build a new one)
4.  If opting to build a new module:
    -   Choose a meaningful search engine friendly module name. (crowd sourcing name suggestions is recommended)
    -   Create the Drupal project on Drupal.org
    -   Populate the project page with a description of what is coming. List supporters as CivicActions and the client [directions](./drupal-for-drupal-engineers.md#contribution-to-drupalorg-modules-and-themes). If the client does not have a drupal.org page, get help from your PM to encourage them to create one.
5.  Populate the issue queue on the Drupal project with "Feature requests". Keep them as atomic as possible. Mark any that are part of the MVP as "major". Create issues for any improvement ideas that emerge. They don't all have to be acted on, but they help shape the road map for where you want the module to go.
6.  Add [DDEV](https://github.com/ddev/ddev-drupal-contrib) to your module to allow easy building of [local environments](./drupal-for-drupal-engineers.md#local-development) for you and others to work on the module.
7.  Add [tugboat previews](https://www.drupal.org/docs/develop/git/using-git-to-contribute-to-drupal/using-tugboat-previews-on-drupal-core-and-contrib-merge-requests) to your module to create preview sites on issues so that fixes can be more easily tested by you and the community.
8.  Add [.gitlab-ci.yml](https://www.drupal.org/docs/develop/git/using-gitlab-to-contribute-to-drupal/gitlab-ci) to your module to ensure code linting and future tests are automatically executed on merge requests for the modules.
9.  Add [tests](https://www.drupal.org/docs/develop/creating-modules/basic-module-building-tutorial-lorem-ipsum-generator/testing-a-drupal-module) to your module to ensure [it is working as expected](./drupal-for-drupal-engineers.md#testing).
10. Close the issues as you go and be sure to credit yourself, CivicActions, and the client.
11. Begin with alpha releases. Ideally when all your MVP/major issues are closed, you are ready for the official release.
12. After the official release, opt in to [Drupal security coverage](https://www.drupal.org/drupal-security-team/security-advisory-process-and-permissions-policy).
