---
title: Accessibility
---

# Accessibility

We implement Section 508 compliant sites and strive to meet the latest Web Content Accessibility Guidelines (WCAG). We do this so that everyone can access our sites, even if they have a permanent, temporary or situtational disability. The Engineering team is very aware of the advantages of open standards, and semantic code for building future-compatible applications. CivicActions has an [Accessibility Practice Area](../accessibility/README.md), but is also a component of all other practice areas at CivicActions.

## How we do this

-   We use base themes which strive to meet the W3C's WCAG 2.1 AA Success Criteria or above.
-   We implement good SEO structures (which are generally good for accessibility).
-   We implement responsive design strategies that can present complex data in hierarchical structures, capable of being navigated by audio cues.
-   We believe that users should be able to personalize how content is presented. We strive to allow users to change color schemes and text size displays allow them to have a better user experience.
-   We test sites using a combination of automated and manual testing. We leverage automated testing in the browser, with site-wide scans and also through integration in our CI/CD pipeline.
-   We follow the best practices of the Drupal community, which includes accessibility.

## When we do this

-   We strive to produce work that is accessible to people of all abilities, regardless of client. However, we recognize that the level of accessibility compliance and prioritization can be influenced by budgetary and contractual implications.
-   We aim to do accessibility work continuously, as part of our agile process. Accessibility scans should be performed on a per-ticket basis and signed off on before work is considered complete.
-   We know that accessibility CANNOT BE left until the end of a project, but baked in throughout its lifespan.

## General Accessibility Guidelines

-   Form elements are built with meaningful labels and form buttons include descriptive values.
-   Images should have meaningful alternative text ("alt tags") by default. We recommend making alt tags mandatory for content editors.
-   Decorative images or images with no content use should either have a null alt tag (alt="") or rendered as CSS background images.
-   Color should not be used as the sole method of conveying content or distinguishing visual elements.
-   Color alone is not used to distinguish links from surrounding text unless the luminance contrast between the link and the surrounding text is at least 3:1 and an additional differentiation (e.g., it becomes underlined) is provided when the link is hovered over or receives focus.
-   The page should be readable and functional when the text size is doubled. We use rem font-sizing (or another dynamic font unit) to make the text scales as expected when the web-page is zoomed-in. This also provides reliable text-resizing in smaller browser widths.
-   Adequate line spacing (at least 1/2 the height of the text) and paragraph spacing (1.5 times line spacing) is important for readability.

## Resources

-   [CivicActions Accessibility Site](https://accessibility.civicactions.com): Please visit and bookmark, it contains a wealth of information about open source and web accessibility.
-   [Drupal's Accessibility Landing Page](https://www.drupal.org/docs/getting-started/accessibility)
-   [W3C's WCAG 2 Overview](http://www.w3.org/WAI/intro/wcag)
