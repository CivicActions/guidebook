---
title: Automatic checking
---

We use GitHub Actions CI, a hosted, distributed continuous integration service, to test projects hosted at GitHub. Actions automatically detects when a commit has been pushed to a GitHub repository. Each time this happens, it will try to build the project and run tests to ensure that the commit complies with certain standards. For now, it is primarily concerned with our [markdown](markdown-for-guidebook.md) syntax, and will "fail" if there are errors as specified in the .remarkrc.error file in the root directory in the repo.

## What to do if a build fails

Each time a commit or PR is made to the guidebook master repo, the tests will run, and a report is created with the results of that test. A bot posts a link to the report on the merge request page in GitHub, as well as in the #docs channel in Slack. If it fails, you can click the report number and see what went wrong.

The left hand column shows the line and the position in that line where the error/warning occurs, and explains which test failed, which should provide you with enough information about how to address it.

You can see some recent runs at <https://github.com/CivicActions/guidebook/actions>.
