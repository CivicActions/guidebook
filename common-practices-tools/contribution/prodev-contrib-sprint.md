---
title: Contrib First Professional Development Sprint
---

# Contrib First Professional Development Sprint

This serves as a guide for conducting a professional development sprint to build a contributed projects or features following [Contrib First](./contrib-first.md).

## Kickoff Announcement Example

This example can be used as a template to paste into Slack.

**Pro-dev sprint:** Contrib First Drupal Module Build

**Purpose:** To get more people from all practice areas experienced in building a contributed Drupal module as [Contrib First](https://guidebook.civicactions.com/en/latest/common-practices-tools/contribution/contrib-first/).

**Time commitment:** 2-4 hours per week for 4 weeks (5-10% of your time)

**Who:** We need a team

- Product Owner: (Typically a Product person or TL from a project that needs the module)
- Drupal engineer
- FE engineer
- UX Designer
- DevSecOps or QA
- Project Manager

Preference given to people with no previous Drupal contribution experience

**What to get out of it:**

- Experience with Contrib First
- Experience with Drupal contribution
- Experience using the Drupal Issue Queue
- Experience working in the open (public)
- A safe space to be new to the process
- Alignment with your personal goals, practice area goals, and company OKRs

**How to bill:**

- Talk to your current project's PM and TL to see if it is something that project could use. If so, it will be billable to that project.
- If your current project can't benefit from it can be logged as **PRODEV_COMMPART -> Professional Development**

**Module description:** (example)
A USWDS based alert module that would allow for placing [Site alerts](https://designsystem.digital.gov/components/site-alert/) and [Alerts](https://designsystem.digital.gov/components/alert/)

- Built upon the [Sitewide Alert](https://www.drupal.org/project/sitewide_alert) module (as a dependency)
- Two different block plugins
- Two different Single Directory Components
- Support for using the components within Drupal and in a headless site.
- Test coverage
- Well documented
- Supports sustainable maintainership (Tugboat, Gitlab CI, Ddev)

## Onboarding

Onboarding checklist for each team member.

- [Create an account on Drupal.org](https://www.drupal.org/user/register) if you do not have one.
- [Add CivicActions to your profile as "Work"](../../practice-areas/engineering/drupal/drupal-for-drupal-engineers.md#contributions-to-drupalorg).
- If your current project's client has a Drupal.org page, add them as "Work" too.

## Working in Public

This development will be taking place in public. There are several things to consider.

- Whenever possible, have conversations in public on the issue queue rather than in Slack or Zoom.
- This is an opportunity to represent your personal brand. Say please, thank you, and other positive things. Good manners go a long way to having others contribute to your success and the success of the thing being built.
- Getting comfortable participating in public is part of the goal of this, not solely building the thing.
- Bring in a friend. If there is something interesting that needs eyes from someone other than who is on the prodev team, reach out to them for feedback or guidance.

## Sprint 0

- Determine check-in call time and cadence.
- If this is new module development, brainstorm a module name.
- Create the [new module page here](https://www.drupal.org/node/add/project-module) only fill in a minimal description, noting that this is being built and is not ready for use.
- Create the following basic issues
    - Add a README.md (the readme will populate the project description and help page)
    - Add Tugboat PR previews
    - Add Gitlab CI support
    - Add DDEV module wrapper and Contribution directions
    - Connect README to hook_help
    - Add project browser icon
    - EPIC module MVP (this will be used to arrange the MVP tickets)
- Populate the Backlog with issues for known requirements.
    - Make issues as granular as possible. This greatly increases the chances from someone outside the organization will contribute.
    - If the issue is part of the MVP, set the priority to "Major"
    - If you have another idea or feature that this should have after MVP is complete, create a Feature Request issue so the idea does not get lost.

## Sprints 1 through N

Work toward getting MVP completed as you normally would with a project team. Check in with the whoever is serving as Product Owner at least once per week. Create alpha releases as you go.

## Sprint N (MVP complete)

- Perform the official release
- Opt into security coverage (you may need to add someone who has that power as a maintainer for a few minutes).
- Advertise within the company that this module is ready.

## Resources

- [Contrib First module development for Drupal](../../practice-areas/engineering/drupal/drupal-contrib-first-module-development.md)
- [Agile](../agile/README.md)
