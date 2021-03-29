# [CI/CD](README.md) / Intro to CI/CD

The goal of CI/CD practice is to provide a workflow that can support
frequent updates, good testing, consistent builds, and prompt deploys.
Additionally issues with code should be found quickly and addressed before
it is released to customers.

<!-- toc -->

- [Delivery Pipeline Basics](#delivery-pipeline-basics)
  - [Build](#build)
    - [Notes about Versioning](#notes-about-versioning)
      - [Semantic Versioning](#semantic-versioning)
      - [Commit Hash](#commit-hash)
      - [Other versioning strategies](#other-versioning-strategies)
  - [Test](#test)
  - [Deployment](#deployment)
  - [Release](#release)
- [Continuous (Integration | Delivery | Deployment)](#continuous-integration--delivery--deployment)
  - [Continuous Integration](#continuous-integration)
  - [Continuous Delivery](#continuous-delivery)
  - [Continuous Deployment](#continuous-deployment)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Delivery Pipeline Basics

There are usually four conceptual steps in a delivery pipeline:

1. `Build`: Where you build the code into a binary or other artifacts to eventually distribute.
2. `Test`: Where you validate or test the artifacts built in the previous step.
3. `Deploy`: Where you configure and deploy the artifacts to an environment. Could be a pre-prod or prod.
4. `Release`: Where you finally allow users access to that version of code you've configured and built.

In many cases you can merge or swap the steps `Release` and `Deploy`.

Philosophical ideas and notes about each step are outlined in the following sections.
These are not the be-all end-all of what we do at Truss but are a starting point for how we think about this process.

Note: These steps are all fungible.
They can be combined to a degree, you can have multiple deployment and validation steps.
You could merge deploy and release.
What is important is that each of those steps is well understood and documented.
That they are configurable and repeatable.

### Build

**Builds should be repeatable.**
This means you should be able to check out the code from your project at that same commit hash and build it again and get the same artifact(s).
_Note_: This means that dependencies should be versioned in your codebase.
To keep dependencies up to date in an automated way you can use [Dependabot](https://dependabot.com/) with our [documentation on configuring it](dependabot.md).
Please do whatever is "correct" in the context of the languages/frameworks your project is built in.

**Builds should be hermetic.** This means that the build should be isolated from other builds.
In CI, the build shouldn't share the same workspace or files from a previous build or from a build of a different project.

**Builds should output an immutable artifact.** Artifact outputs should not be rewritten or altered by subsequent builds.
This allows you to distribute or redeploy from these unaltered artifacts for different points in code.
Additionally, try to label the artifact with the appropriate versioning scheme for your project.

#### Notes about Versioning

Version your code and artifacts. Doesn't really matter how, just do it. It will make it easier to track down issues or deploy specific versions of your project.

In your code consider adding a command or an endpoint that surfaces that version for debugging.

Tag your versioned releases on your mainline branch.
This helps you find the state of mainline at the point in time your artifact was built.
Additionally, if you are using GitHub you can use their releases functionality to share release artifacts and notes.

Here is a preferential ordering of versioning schemes:

##### Semantic Versioning

Why semver? It tells you and your customer how much has changed since the last released code and sets expectations accordingly.
If you are tagging at mainline where you are building from, you can rebuild the artifact from the same point.

From [semver.org](https://semver.org):

```
Given a version number MAJOR.MINOR.PATCH, increment the:

MAJOR version when you make incompatible API changes,
MINOR version when you add functionality in a backwards compatible manner, and
PATCH version when you make backwards compatible bug fixes.
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
```

##### Commit Hash

A commit hash is unique (with extremely few collisions) and is easily linked back to history in code.
However, how much has changed is opaque to your users and it is difficult to determine how old this version is in comparison to other versions.

##### Other versioning strategies

These are other versioning strategies we've seen. We do not recommend them.

- _Feature branch related names._ These should be short lived and maintained for no more than a few days. Most users will not find these useful.
- _Build id related names._ These are opaque to a user and harder to dig up history on when debugging.
- _Build date related names._ These are also opaque to a user and difficult to dig up history on when debugging. You at least get a sense of when these changes went in but are hard to tie to a commit in mainline.

### Test

We will not be writing deeply about testing methodologies or specifics around kinds of tests and the philosophies here.

In the context of a CI pipeline:

**Tests should be hermetic.** Ideally, multiple CI runs should be able to run at the same time without affecting each other.

**Tests should be idempotent.** Tests in CI should be able to run several times over without producing inconsistent effects.

**Tests should be reproducible in a developer's computer.** So developers can debug them more easily.

**Tests should run fast.** "Fast" is poorly defined here.
Generally speaking, you want tests to be fast so merging code changes is fast.
A developer shouldn't think they can start on a new piece of work in the hour or two to push a change through CI and context switch.

**Tests should fail fast.** Similar to the previous point, "fast" is relative but in CI you will want to give the waiting devloper signal on whether their work can be merged or requires changes as quick as possible.

### Deployment

Deployment will differ project to project and should take into account the requirements of the system being deployed to.

**Deployment should be repeatable.** The same code and configuration should be deployable again and again.

**Deployment process for software should be the same regardless of environment.** Using the same process and tooling means lower cognitive overhead in deployment and your non production environments should reflect production more closely.

**Deployment tools should be maintained separate from the application being deployed.** We've seen this happen where we need to fix some deployed code but also had a problem with the code that performs the deployment and all of it is a hairy mess of debugging.

### Release

There are a few different ways of implementing release.
No matter what, release is the step when you allow customers to have access to that particular version of your code.

If you're releasing a CLI, it may mean that you're releasing your binary to a Homebrew tap or just a zip file to GitHub releases.

If you have a service, you could have a loadbalancer manage traffic between different versions of your services.
Or you could use something like Launch Darkly to leverage feature flags to do something similar for different user cohorts.

## Continuous (Integration | Delivery | Deployment)

We throw around terms like CI or CD with the assumption that we know what the differences are between these practices.

For clarity, at Truss we'll refer to them as follows:

### Continuous Integration

`Continuous Integration` is when you validate on every push to mainline.
This helps folks find failures in the code before it reaches mainline.
Ideally, automated build and test steps validate changes and stop any new changes to mainline.
Mainline must always be in a good state to deploy from.

This may manifest as a process where developers merge changes into mainline as often as possible.
Small incremental changes to code and small discrete tests make changes easier to understand and facilitate frequent merges in CI.
This practice helps mitigate risks from long lived branches and helps validate small changes in quick succession.

That being said, in practice we see longer lived branches for features or versions.
These branches need to be kept up to date with mainline with frequent merges or rebases from mainline.

The point of either of those practices is to minimize drift between your working branch and mainline so validation in CI or manually is easier.

### Continuous Delivery

`Continuous Delivery` can be described as an extension to `Continuous Integration`.
In addition to automated build and test steps running on every proposed change to mainline, the delivery of the code is also automated.

You want the software built to be deployable at any given point in time.

Delivery may mean different things depending on your workflow.
It may mean that you have built your artifacts and validated them and delivered them to a centralized repository.
For example, Docker containers might go to Docker Hub or Amazon Elastic Container Registry (ECR).
Might mean that the code has been deployed to a staging environment.
All of these could be "delivered" depending on the project's workflow.

### Continuous Deployment

`Continuous Deployment` can be described as a further extension of `Continuous Delivery`.
In addition to automated build, test, and delivery, production deployment is also automated.

This is an advanced state that requires excellent, trustworthy, automated tests and monitoring. The complexity of continuous deployment system is correlated with the complexity of the delivery pipeline. It's much easier to have continous deployment of a single container image than a full-featured web application.

# [Tools and Practice](../README.md) / CI/CD

The release process is one of the most important parts of development
for obvious reasons: without a release, your code is never going to
actually be used by anyone. What follows are resources for setting
up a continuous integration and continuous delivery (CI/CD) pipeline
according to Truss best practices to deliver software to customers.

- [Intro to CI/CD](intro.md)
- [Standard Delivery Pipeline](delivery-pipeline.md)
- [CircleCI Config Patterns](circleci-patterns.md)
- [CircleCI Orbs](circleci-orbs.md)
- [Dependabot](dependabot.md)

## Resources

- [Wikipedia: Continuous Delivery](https://en.wikipedia.org/wiki/Continuous_delivery)
- [Atlassian's Basic Primer on CI/CD](https://www.atlassian.com/continuous-delivery/principles/continuous-integration-vs-delivery-vs-deployment)
- [Google SRE book: Ch 8 Release Enginering](https://landing.google.com/sre/sre-book/chapters/release-engineering/)
- [12 Factor app: Build/Release/Run](https://12factor.net/build-release-run)
- [7 Pipeline Design Patterns for Continuous Delivery from Singlestone](https://www.singlestoneconsulting.com/blog/7-pipeline-design-patterns-for-continuous-delivery/)

Some OG references:

- [Martin Fowler on Continuous Delivery](https://martinfowler.com/bliki/ContinuousDelivery.html)
- [Timothy Fitz on Continuous Deployment](http://timothyfitz.com/2009/02/08/continuous-deployment/)

# [Intro to CI/CD](README.md) / CircleCI Config Patterns

At Truss, CircleCI tends to be our CI/CD tool of choice. In order to help
developers and infrastructure engineers get their pipelines working quickly,
there are some patterns you can use to make your pipeline more robust.

## Split Build/Push Steps

If you are building a pipeline that builds docker images and then deploys
them to multiple repositories, you can save the built image to the CircleCI
workspace, then load it via another. You will have two commands, a build
command and a push command, and you'll run the build job once, and a push
job for each repository.

<details>
  <summary>Build/Push Config Pattern</summary>

```yaml
commands:
  build_image:
    parameters:
      dockerfile:
        type: string
      image_name:
        type: string
      tag:
        type: string
    steps:
      - run:
          name: 'Build docker image'
          command: |
            docker build -f << parameters.dockerfile >> -t << parameters.image_name >>:<< parameters.tag >> .
            mkdir -p workspace
            docker save -o workspace/<< parameters.image_name >> << parameters.image_name >>:<< parameters.tag >>
      - persist_to_workspace:
          root: workspace
          paths:
            - << parameters.image_name >>

  push_image:
    parameters:
      image_name:
        type: string
      tag:
        type: string
      repo:
        type: string
    steps:
      - attach_workspace:
          at: /tmp/workspace
      - run:
          name: 'Retrieve docker image from workspace'
          command: |
            docker load -i /tmp/workspace/<< parameters.image_name >>
      - run:
          name: 'Tag and push docker image'
          command: |
            bash -c "$(aws ecr get-login --no-include-email --region $AWS_REGION)"
            docker tag << parameters.image_name >>:<< parameters.tag >> ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/<< parameters.repo >>:git-commit-${CIRCLE_SHA1}
            docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/<< parameters.repo >>:git-commit-${CIRCLE_SHA1}

jobs:
  build:
    executor: main
    steps:
      - checkout
      - setup_remote_docker:
          # You can set docker_layer_caching to true if you have a paid plan
          docker_layer_caching: false
      - make bin_linux/my_app
      - build_image:
          dockerfile: Dockerfile
          image_name: my_app
          tag: latest

  push:
    executor: main
    steps:
      - setup_remote_docker:
          # You can set docker_layer_caching to true if you have a paid plan
          docker_layer_caching: false
      - push_image:
          image_name: my_app
          tag: latest
          repo: app-my_app
```

</details>

Reference: [Build Docker image in one job and use in another job](https://support.circleci.com/hc/en-us/articles/360019182513-Build-Docker-image-in-one-job-and-use-in-another-job)

## Multiple Account Operations

With the use of AWS Organizations, it's not uncommon that we want CircleCI
to execute steps in different AWS accounts. You can update AWS credentials
and variables by saving multiple versions of the environment variables in
CircleCI, and then using commands to swap between them. See the example
code below:

<details>
  <summary>Multiple AWS Account Credentials Pattern</summary>

```yaml
commands:
  aws_vars_dev:
    steps:
      - run:
          name: 'Setting up AWS environment variables for dev'
          command: |
            echo "export AWS_REGION=$DEV_REGION" >> $BASH_ENV
            echo "export AWS_ACCOUNT_ID=$DEV_ACCOUNT_ID" >> $BASH_ENV
            echo "export AWS_ACCESS_KEY_ID=$DEV_ACCESS_KEY" >> $BASH_ENV
            echo "export AWS_SECRET_ACCESS_KEY=$DEV_SECRET_ACCESS_KEY" >> $BASH_ENV

  aws_vars_prod:
    steps:
      - run:
          name: 'Setting up AWS environment variables for prod'
          command: |
            echo "export AWS_REGION=$PROD_REGION" >> $BASH_ENV
            echo "export AWS_ACCOUNT_ID=$PROD_ACCOUNT_ID" >> $BASH_ENV
            echo "export AWS_ACCESS_KEY_ID=$PROD_ACCESS_KEY" >> $BASH_ENV
            echo "export AWS_SECRET_ACCESS_KEY=$PROD_SECRET_ACCESS_KEY" >> $BASH_ENV

jobs:
  do_thing_dev:
    executor: main
    steps:
      - aws_vars_dev
      - do_thing:
          environment: dev

  do_thing_prod:
    executor: main
    steps:
      - aws_vars_prod
      - do_thing:
          environment: prod
```

</details>

Reference: [Using `BASH_ENV` to set environment variables](https://circleci.com/docs/2.0/env-vars/#using-bash_env-to-set-environment-variables)

## Manual Approval by Restricted Groups

If you need to gate part of your CI/CD pipeline to a small group (for
example, you want only product managers to be able to approve deploys to
your production environment), you can use a CircleCI restricted context
to achieve this. You will need to create a GitHub team for the people you
want to be able to approve these jobs, create a context in the CircleCI
UI that includes this team only, and then add the context to all jobs
_after_ the approval job.

Reference: [CircleCI Contexts](https://circleci.com/docs/2.0/contexts/)

# [CI/CD](README.md) / Standard Delivery Pipeline

The following is a standardized workflow for developing and deploying our
code using CI/CD. This is meant to be an example, not a prescriptive
ideal; if your project needs to use a different workflow, that's fine.
Your goal should still be to provide a workflow that can support frequent
updates, good testing, and prompt deploys.

<!-- toc -->

- [Developing Your Code](#developing-your-code)
- [Unit Testing](#unit-testing)
- [Deploying Our Code](#deploying-our-code)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Developing Your Code

Here at Truss, we generally use Git for our code repository, and Github
more specifically. Our preferred method for making changes and integrating
them into the project is relatively simple:

1. Check out the repository for `my-project`.
2. Create a new branch `my-feature` in the repository.
3. Make your changes to the code and commit them, then push your code to
   the central repository.
4. Create a pull request, get approvals, and then merge your `my-feature`
   branch into the default branch.

The virtue of this workflow over more complicated methods like the one
shown [here](https://nvie.com/posts/a-successful-git-branching-model/) is
that we are constantly merging to the default branch, so the drift of any specific
branch from the default branch is kept to a minimum. The idea of more frequent small
changes over less frequent large changes is a fundamental aspect of many
development practices (such as Agile). The core of this belief is that
things which break the the application can quickly be noticed, isolated,
and rolled back (or fixed), without requiring a lengthy period of
diagnosis, or requiring delicate operations to pull out problem code
without sacrificing code which is benign.

This process is known as _continuous integration_ or CI (because code is
constantly being integrated into the mainline of the project). Its
relative simplicity belies the fact that it also requires a great deal
of additional work to ensure that this process can occur without
disrupting the project's development.

## Unit Testing

Key to ensuring that our CI workflow is safe is making sure we are doing
unit testing of our code _prior_ to merging in to the default branch. To do this,
we use automated tools like CircleCI to run a battery of tests against
every branch we create a PR from. We want to run a variety of tests that
cover a variety of things like:

- Code formatting and syntax
- Acceptance testing for configuration
- Functional code testing

Our goal is to be as sure as possible _before_ anyone even looks at the
pull request that this code does what we want and won't break things.

## Deploying Our Code

Merging your code is just the first step to actually getting it in front
of a real person to use it. The other component for this how your code
gets from a Git repository into a live environment where someone can touch
it. This workflow is orchestrated via an automated tool like CircleCI, and
looks something like this:

1. New code is merged into the default branch.
2. CircleCI detects that the default branch has been updated and deploys the code to
   our `development` environment.
3. CircleCI checks to make sure the deploy was successful. Is our
   environment running the right version of the code?
4. CircleCI (or another tool fired by CircleCI) performs post-deployment
   testing. Does it pass some functional tests to ensure user workflows
   are functional (eg, can someone log in, pull up a user record, put
   things in a shopping cart, etc)? Are logs filling up with error now
   that the new version is deployed?
5. If the tests pass, CircleCI goes ahead and deploys to our `production`
   environment, then runs the same sort of tests it ran in development.
   In some cases, there may be an additional manual approval step, or
   this may be a deployment to a `staging` environment as an additional
   step prior to "real" production.

This means that we are constantly releasing new versions of our code to
users -- we may deploy a dozen times a day, all with a reasonable degree
of confidence that everything will be fine, thanks to our automated
tests. If something doesn't work, we can stop the process (or roll back,
if the problem is detected post-deploy), and users will be protected from
malfunctioning code. This _requires_ that we write a battery of tests at
every stage of the release process, however.

This automated workflow that allows rapid release of merged code is called
_continuous delivery_ or CD.
