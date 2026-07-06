---
title: Drupal Project Maintenance Lifecycle
---

# Drupal Project Maintenance Lifecycle

## Creation of the project

When you are ready to create the project refer to Drupal.org documentation [Creating a new project](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/creating-a-new-project)

For CivicActions projects we recommend the following when creating the Drupal project for specific selections

### Project fields

These are some of the fields visible when you create or edit a project.

#### Title

Review [Naming and placing your Drupal module](https://www.drupal.org/docs/develop/creating-modules/naming-and-placing-your-drupal-module). We recommend choosing a meaningful search engine friendly module name. Connect with CA team members to crowd source name suggestions. You can also use AI for brainstorming names as well.

#### Maintenance status

- If the project is currently actively worked on by multiple team members for an initiative then set the status to 'Actively maintained'. The focus will be the initiative and community participation.
- If the project is maintained by few maintainers for a client, set the status to 'Minimally maintained'. The focus will be the project and less so the community.

#### Development status

Use the available options to communicate the status of the project.

#### Security advisory coverage

Review [Security Coverage](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/security-coverage), and if you don't have the ability, we recommend getting that access. An option is to invite a CA team member who does have the ability to co-maintain the project with you and the team.

#### Module categories, Ecosystem, and Images

Select the appropriate values for your project.

#### Description

We recommend having the description be sync'd with the `README.md` file in the codebase.

#### Supporting organizations

Please add CivicActions under "Supporting organizations" if the project is for a client project, initiative, or part of your prodev.

If the project is joint venture with other organizations please add those e.g. [https://www.drupal.org/fearless](https://www.drupal.org/fearless)

Please add client organization for client projects. If you need to create an organization, request that someone on their side create one or create it and hand over ownership when appropriate.

Current organizations already on Drupal.org:

- [https://www.drupal.org/centers-for-medicare-and-medicaid-services](https://www.drupal.org/centers-for-medicare-and-medicaid-services)
- [https://www.drupal.org/department-of-veterans-affairs](https://www.drupal.org/department-of-veterans-affairs)
- [https://www.drupal.org/national-science-foundation](https://www.drupal.org/national-science-foundation)
- [https://www.drupal.org/usagov](https://www.drupal.org/usagov)
- [https://www.drupal.org/us-department-of-agriculture](https://www.drupal.org/us-department-of-agriculture)
- [https://www.drupal.org/lincs](https://www.drupal.org/lincs)
- [https://www.drupal.org/us-department-of-justice](https://www.drupal.org/us-department-of-justice)
- [https://www.drupal.org/us-department-of-transportation](https://www.drupal.org/us-department-of-transportation)
- [https://www.drupal.org/unspecified-government-agency-usa](https://www.drupal.org/unspecified-government-agency-usa) (This represents any US government agency that, for a variety of reasons, does not have an organization page on drupal.org. It allows contributors to attribute their work to a US government client without having to reveal which agency it is.)

##### How they helped

For the attribution line, we recommend choosing from the following:

- When CA created or helped create the module, and we want that for historical reference (this doesn't mean we're maintaining it), select CivicActions and add:
    - *development and ideation*
- When it's clear project work, or we're actively maintaining it, add:
    - *provides time and technical support*
- When an employee of CA contributed the module as part of prodev, or isn't involved with maintenance, add:
    - *provided time for community contribution*

### Adding maintainers

Review the documentation at Drupal.org on [maintainership](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership) in particular:

- [Finding a new project owner or new maintainers/co-maintainers](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/finding-a-new-project-owner-or-new-maintainersco-maintainers)
- [Open Ownership Pledge (finding co-maintainers or new project owners)](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/open-ownership-pledge-finding-co-maintainers-or-new-project-owners)

We ask that you add multiple CA team members who are supporting the project and willing to co-maintain the project with you. Adding non-CA maintainers is also recommended. Refer to above documentation and [Co-maintaining projects](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/co-maintaining-projects) for more details.

We also ask that you add the 'civicactions user as a maintainer with the following permissions. This is so a CA team member can use that account to gain access to the project if for some reason you are not reachable or are no longer at CA. You only need to do this for projects that are for a client project or CA initiative.

Permissions:

- Edit project
- Administer maintainers
- Maintain issues

### Creating documentation

Consider the following [Documenting your project](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/documenting-your-project) to document your project by creating pages in Drupal.org.

Examples:

- [AI Migration | Contributed module documentation](https://www.drupal.org/docs/extending-drupal/contributed-modules/contributed-module-documentation/ai-migration)
- [Vertex AI Search | Contributed module documentation](https://www.drupal.org/docs/extending-drupal/contributed-modules/contributed-module-documentation/vertex-ai-search)

## Maintenance of the project

### Tests

CivicActions uses a variety of testing frameworks (e.g. PHPUnit and Cypress). For [Drupal, PHPUnit is a core testing framework](https://www.drupal.org/docs/develop/automated-testing/phpunit-in-drupal) that can also be added to custom and [contributed modules](https://www.drupal.org/docs/develop/creating-modules/basic-module-building-tutorial-lorem-ipsum-generator/testing-a-drupal-module). We recommend adding testing as soon as possible so that you are ensuring the functionality is working as expected and features are stable as you add more to it.

Review the documentation at drupal.org on [Automated testing](https://www.drupal.org/docs/develop/automated-testing).

### GitLab CI

Follow [GitLab CI](https://www.drupal.org/docs/develop/git/using-gitlab-to-contribute-to-drupal/gitlab-ci) to add the .gitlab-ci.yml file to your project to ensure code linting and tests are automatically executed on merge requests on the project.

### Tugboat

Follow [Using Tugboat previews on Drupal Core and contrib merge requests](https://www.drupal.org/docs/develop/git/using-git-to-contribute-to-drupal/using-tugboat-previews-on-drupal-core-and-contrib-merge-requests) to add tugboat to your project to create preview sites on issues so that fixes can be tested by you and the community.

### DDEV

Add [DDEV](https://github.com/ddev/ddev-drupal-contrib) to your module to allow building of local environments for you and others to work on the module especially with plugins like [Contrib module development environment for Drupal projects on DDEV | GitHub](https://github.com/ddev/ddev-drupal-contrib).

### Contribution guidelines

We recommend creating a `CONTRIBUTING.md` file in your project code and also a page in documentation to provide instructions on how someone in the community can work on your project. Here are some examples of `CONTRIBUTING.md` file:

- [https://git.drupalcode.org/project/ai_migration/-/blob/1.0.x/CONTRIBUTING.md?ref_type=heads](https://git.drupalcode.org/project/ai_migration/-/blob/1.0.x/CONTRIBUTING.md?ref_type=heads)
- [Developer Documentation | Vertex AI Search](https://www.drupal.org/docs/extending-drupal/contributed-modules/contributed-module-documentation/vertex-ai-search/developer-documentation)

### Maintaining documentation

Review [Documenting your project](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/documenting-your-project). We recommend creating documentation for your project in [Contributed module documentation](https://www.drupal.org/docs/extending-drupal/contributed-modules/contributed-module-documentation) e.g. [Vertex AI Search | Contributed module documentation](https://www.drupal.org/docs/extending-drupal/contributed-modules/contributed-module-documentation/vertex-ai-search).

### Maintaining and responding to issues

Review [Maintaining and responding to issues for a project](https://www.drupal.org/docs/develop/issues/issue-procedures-and-etiquette/maintaining-and-responding-to-issues-for-a). We recommend allocating time to review the issue queue and following up on items submitted by the community. For actively maintained projects, we recommend monthly reviews. For a minimally maintained project, shoot for a quarterly review.

Additional additional maintainers will help with supporting the issue queue. We recommend using a rotation or similar process to help manage the queue.

### Security issue

If your project has opted into security coverage, read [Contacted by the Security Team. Now what?](https://www.drupal.org/drupal-security-team/contacted-by-the-security-team-now-what) in its entirety. We recommend paying close attention to reported security issues and prioritize responding to the reported issue and getting the project patched.

### Contribution credits (for individuals and organizations)

Follow [Getting credit for work on issues](https://www.drupal.org/docs/develop/issues/fields-and-other-parts-of-an-issue/getting-credit-for-work-on-issues) to credit yourself, CivicActions, and the client on issues worked on in the project. We track our contribution credits and it helps showcase your and CivicAction's work in the community.

### Automatic updates

Your project will get automatic updates for Drupal core major versions via [Project analysis](https://www.drupal.org/project/project_analysis). Review the created issue, the automatic changes, and CI pipeline results.

### Client documentation

Add the project to client facing documentation so it is tracked and included as part of the project's maintenance burden.

### Updating maintainers

Review the documentation at Drupal.org on [maintainership](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership) in particular:

- [Finding a new project owner or new maintainers/co-maintainers](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/finding-a-new-project-owner-or-new-maintainersco-maintainers)
- [Open Ownership Pledge (finding co-maintainers or new project owners)](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/open-ownership-pledge-finding-co-maintainers-or-new-project-owners)
- [Co-maintaining projects](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/co-maintaining-projects)

Audit CA and non-CA maintainers and make updates like adding new members and removing old ones who are no longer interested in maintaining the project.

## Handing off the project

This is assuming you are the owner or a maintainer on the project.

Please ensure the following is done if you are no longer interested in owning/maintaining the project or are leaving CA:
- Other CA team member(s) are listed as maintainers on the project with full permissions
- The team member(s) are informed
- You have created a succession plan to hand off the project responsibilities to others
- The client that uses the project has been informed including details of the succession plan

If you are okay with being listed as a maintainer and helping occasionally with adding/removing maintainers, handling some communications, and connecting with Drupal.org security or support then you don't need to remove yourself as a maintainer or owner of the project.

If you are leaving CA but are still wanting to continue to maintain and own the project then nothing else needs to be done.

To transfer ownership follow the 'Transferring project ownership' directions at [Finding a new project owner or new maintainers/co-maintainers](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/finding-a-new-project-owner-or-new-maintainersco-maintainers#s-transferring-project-ownership).

If you do not have access change maintainers, then either ask other maintainers or follow the 'Adding new maintainers/co-maintainers' directions at [Finding a new project owner or new maintainers/co-maintainers](https://www.drupal.org/docs/develop/managing-a-drupalorg-theme-module-or-distribution-project/maintainership/finding-a-new-project-owner-or-new-maintainersco-maintainers#s-adding-new-maintainersco-maintainers).

## Retirement of the project

When you want to retire the project make the following changes by editing the project on Drupal.org:

- Change 'Maintenance status' to 'Unsupported'
- Change 'Development status' to 'Obsolete'
- Change 'Security advisory coverage' to 'Not covered'
- If the project has a replacement, add the replacement under 'Replaced by'
- Optionally update the 'Description' to indicate why the project is retired
- Optionally update the attribution line for CivicActions to 'development and ideation'
- Please leave supporting organizations and maintainers unchanged to preserve historical references. Only remove the supporting organization if there is some reason to no longer have CA's name associated with the project.
