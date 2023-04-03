# Draft Automated Accessibility Testing at CivicActions Playbook

Related document [CivicActions' Comprehensive Accessibility Testing Approach](https://docs.google.com/document/d/185odSrtYU8yMv_y9DkaqCT_E34fpofaRwNmBCP6GFsk/edit#heading=h.kbw6tzyvuua5)

Below are CivicActions projects and their approaches to automated accessibility testing. Note that projects have different set-ups currently because of contractual requirements, and we are iterating to find the best approach. Hopefully this documentation will serve as a source to learn from each other.

## GlobalNET

It is important that our site is accessible and meets accessibility standards. To help with ensuring that the site meets those standards the GlobalNET team uses automated testing. Note that while automation only catches about 33% - 50% issues, those are still important to fix.

When working on individual pages, the engineers use the browser extensions WAVE and axe DevTools to check for issues. To capture issues across many pages the team has set up Pa11y CI running axe-core and htmlcs and Cypress with cypress-axe plugin. Axe-core is an industry standard automated accessibility testing engine. The tools run in GitLab pipelines.

The GlobalNET team's goal is to meet Section 508 and WCAG 2.0 AA standards and our plan is to work on reported issues in quarterly epics. Following the [axe issue impact](https://github.com/dequelabs/axe-core/blob/develop/doc/issue_impact.md), the team focuses first on critical and serious issues. The team also focuses on moderate/minor issues that are common to many pages.
