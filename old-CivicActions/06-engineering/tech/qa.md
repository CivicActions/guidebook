# Quality Assurance

## About the QA Practice Area

> @todo [NEEDS SOME CLEANUP](https://trello.com/c/c9FW3be8)

- We check and clean up extraneous notices, warnings, and errors:
- So that we can easily identify and debug new issues.
- We make small, logical commits:
- so that changes are clearly differentiated.
- One module per commit so that code can be contributed without losing Git history or needing a sub-tree push.
- Don't make commits are so small they are broken (per below, we only commit working code), but also we shouldn't have a single huge commit for a whole ticket.
- We commit working code:
- So that we don't break other's sandboxes.
- We have the ability to view and share code changes:
- so that we can reference code and commits by URI.
- Ideally, this would be shareable, browser-based, linked to ticket tracker, e.g. Trac (w/ Git plugin) or Redmine or...
- Per Zeke Weeks: (For further discussion: Git web UI commonly used by team for reviewing & linking to changes and parts of codebase?)
- Per David Numan: The language of this one sounds more like a "how", but I think there is a what and why behind it.
- Per David Numan: btw if you have lighttpd installed (sudo apt-get install lighttpd) you can run your own with this:
  `git instaweb`
  `http://git-scm.com/book/ch4-6.html` and this was helpful for setting up gitolite+gitweb locally: `http://blog.countableset.ch/2012/04/29/ubuntu-12-dot-04-installing-gitolite-and-gitweb/`
- Per Steve Wirt: and we use these tools to do paired code review. The developer who wrote the code looks at it with another developer and walks through the approach and the code as part of review and testing.
- We share QA breadth with our clients in an easily digestible format.
- Per Eric Napier: What is the best format??? Behat HTTP Formatter??? Jenkins??? Is there any benefit to further connection of Jira and Behat? Is there a way to do it?
- We have best practices for creating BDD tests.
- Per Eric Napier: Behat or Codeception? Is there a use case for both? Are there best practices that pertain to both approaches?
- On our team projects, we practice awareness not just of our own tickets and code commits, but also those of our team members.
- We use Coder and code review (security, style, etc.) to verify our code is clean and meets industry standards
- Clean, well-organized code and comments that is executed according to industry-standard and /or Drupal standard (as is the case) helps ensure that our code is structured in a universally understandable, navigable and organized fashion that saves time and reduces error.
- Drupal code is code reviewed by tools that have been enhanced especially to analyze Drupal code
- JavaScript, SASS and CSS files should also be code reviewed by your tools
- Code review should be automated within your IDE or by using Git hooks so that this step is not overlooked
- Per Kevin Walsh: we might want to add bits of <http://web-dev.wirt.us/info/drupal-drupal-7-drush-linux/installing-drush>, <http://web-dev.wirt.us/info/git-drupal-drush/drupal-code-style-review> and <http://web-dev.wirt.us/info/git-drupal-7-drush/drupal-code-style-review-git-commit-hooks> here.
- We write tests for code/pages that are complex, important or hard to test
- so that we can concretely test these areas (unit or functional, PHP or JavaScript) and ensure our site works
- Per Owen Barton: From Alex on JS testing card: "Being able to regression test your code is a plus. There are frameworks that can help with this, such as Buster JS, Jasmine."
- Per Bob Schmitt: This should include cross-browser testing
- Per David Numan: is it possible to write a test for cross browser testing?
- QA in sales: When inheriting a project, we assess the existing implementation and compare it against our assumptions based on if we had built from scratch.
- Cross browser (and mobile) testing strategy
- See "We avoid cross-browser conflicts" (NEED LINK to Front-end development)
- <http://crossbrowsertesting.com>
- <http://saucelabs.com>
- Development workflow follows best practices that support simultaneous development while safely integrating changes to testing and staging environments
- Always use version control
- Check live to see if code has been added but not committed before updating
- Dev - QA - Live
- Commit from sandbox, not live or QA if you can possibly help it. Possible exception: you can't replicate the live environment on sandbox.
- Use tags to reference specific commits, for stable QA testing and to avoid accidentally updating the live site.
- tag/push before fetching on Dev/QA/Live.
- git fetch -> git checkout versionX (rather than Git pull)
- change major version number with each sprint
- Update/synchronize data on dev/staging/live at the beginning of each sprint
- It shouldn't hurt to update your sandbox db after you do a code push and prior to a next chunk of work
- Per Fen LaBalme: Standard practice for creating/updating sandbox that the dev team uses and directly maps to/from vhost staging/production sites
- We approach complex or new challenges as a group to form implementation strategies, and share how we completed such work with the group
- so we can review for quality, and to spread the knowledge we gained in the process
- We report bugs using steps to replicate the problem, stating expected results, and capture actual results.
- so that we don't want to waste time figuring out how to replicate a bug.
- We use screen captures to rapidly and clearly share the intended or unintended results.
- When reviewing security updates, we document reasons for not updating modules.
- Use a README or <https://drupal.org/project/update_advanced>
- We educate clients and testers how to qualify and report repeatable issues.
- Before a "bug" or other issue is reported it should be "qualified" by the reporting user.
- (See Issue Qualification or Issue Qualification and Defect Reporting) (<https://civicactions.net/content/issue-qualification> and <https://trac.civicactions.net/internal/template/wiki/IssueQualification>) (NEED TO MOVE THIS CONTENT OVER?)
- Our sites include site history and QI documentation: <https://trello.com/b/MH1OIHzV/site-history-evaluation-project> (NEED TO MOVE THIS CONTENT?)

---

TODO: from Truss:

# Recommended Feature and QA testing framework

Truss utilizes [Cypress IO](http://cypress.io) as our qa/feature testing framework of choice.

## Why we selected cypress

Cypress was chosen for many reasons. It is designed from the ground up to tie into browser automation apis to add more stability when interacting with the browser. It provides more tools for better isolation of tests, which will allow tests to skip portions that take a long time (i.e. logging in to every test). Other benefits are to developer workflow as Cypress provides a GUI you can install locally to watch tests run, have tests automatically be re-run when code is changed, as well as a easy way to see what the application looked like at each step of the process after the test is completed.

## Pros

### Test Stability

Cypress IO was designed to use the new automation api's provided by modern browsers. As such it has allowed them to create a more stable library than selenium based tests. This makes it more consistent and more reliable to find dom elements for testing.

### Videos of sessions auto created

Cypress based tests automatically create videos of test runs and stores in user defined location. This is also true of the docker containers provided by Cypress team which means that videos of tests run in a ci environment can be automatically exported and saved as part of a ci run.

### Runs in Docker, with provided cypress containers

Between having screenshots of errors, videos of test runs, and being able to step through a recent local test run and inspect each step; test developers have a large variety of tools for diagnosing andebugging tests. This is especially true of the GUI that allows you to step through each phase of the test after the fact as it is not availble with other frameworks at the time of this writing.

In addition to the above, the GUI for cypress watches for file changes, and any changes to the test files will trigger a rerun of the open test, greatly improving the workflow of the developer.

### Possible to avoid logging in via the ui for every test allowing for better test isolation and speen

Test isolation is a key recommendation from the cypress team. In the [best practices](https://docs.cypress.io/guides/references/best-practices.html#Organizing-Tests-Logging-In-Controlling-State) documentation the cypress team notes that you do not have to rely on using the browser interactions to do tasks common to all tests such as logging in. Cypress provides tools for making api calls that can allow a test to aquire tokens, and other data, in a quick time allowing for tests to focus on the area that is needed.

## Cons

### Currently only supports chrome and headless browsers

IE is in the works as is Firefox and mobile safari but no estimated date of release. This can be a hold up depending on the nature of the project. If IE support is critical, there are a couple of different workarounds that Truss has implemented on various projects.

- Manually testing PRs against IE before merging
- Executing tests via SauceLabs or similar service

## Other options considered

The main other option for feature/qa tests are selenium based frameworks, which have their own issues. Primarily selenium tests seem to suffer from consistency issues, the same run of a test against a clean version of an application may or may not result in the same test output.

## Additional Resources

- [Why Cypress?](https://docs.cypress.io/guides/overview/why-cypress.html)
- [Key differences](https://docs.cypress.io/guides/overview/key-differences.html)
- [Best practices](https://docs.cypress.io/guides/references/best-practices.html)

# Feature and QA testing in eApp

This is documentation of a decision on the eApp project as to why cypress was not chosen for this project. Though typically Truss would recommend [cypress](cypress.md)

## Why selenium and nightwatch

### Requirements

1. Automated tests we can run
1. Ability to run tests against IE locally and in a CI environment
1. Green tests of basics

#### Automated Tests We Can Run

The tests need to be run regularly to ensure they are still passing. If they are not run they will inevitably begin to fail and if no one notices, then regressions are not caught and the value of the tests goes down since when they are run it will be unclear as to what has caused them to fail.

So to support this we will mark all the currently failing tests as pending except for the newly fixed identification section tests. Once this is complete then ensure that the tests are run regularly. Primary desire is to have Circle CI build process run on a regular basis, ideally on every PR branch, but if not at least once a week against the default branch. If these options are not possible or we run out of time the tests should be run at least once a week by one of the eApp team developers.

#### Ability To Run Tests Against IE Locally And In A CI Environment

The current user base of eApp is primarily IE11 based at this time. In eApp history some major bugs that affected only IE users made it all the way into the hands of eApp end users. Due to this and the need to ensure that IE as well as other browsers are supported we need to ensure that whatever system we use supports multiple browsers. To that end selenium will be used as it already has wide support for multiple browsers and can be deployed with the help of selenium grid in a private environment controlled by NBIS.

## What other options were considered

We considered cypress.io as an alternative. While it provided better testing tools for developers and debugging tests, as well as better consistency between runs. However, it lacks support for IE currently, and no eta on when support for that will be added leads us to not choose it.
