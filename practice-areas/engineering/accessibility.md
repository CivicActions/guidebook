# Accessibility

We implement Section 508 standards and WCAG compliant websites so that people with all types of disabilities, whether it be physical, mental, or visual impairment, have access to our sites.

## How we do this

-   We use base themes which strive to meet the W3C's WCAG 2.0 AA Success Criteria or above. This will help satisfy the requirements of the ADA.
-   We implement good SEO structures (which are generally good for accessibility).
-   We implement responsive design strategies that can present complex data in hierarchical structures, capable of being navigated by audio cues.
-   We believe that users should be able to personalize how content is presented. We strive to allow users to change color schemes and text size displays allow them to have a better user experience.
-   We test sites using a combination of automated and manual testing.
-   We use good practices in using semantic markup in page templates and report design to define content hierarchy (e.g. primary head is h1, secondary head is h2, etc.).

## When we do this

-   We strive to produce work that is accessible to people of all abilities, regardless of client. However, we recognize that the level of accessibility compliance and prioritization can be influenced by budgetary and contractual implications.
-   We aim to do accessibility work continuously, as part of our agile process. Accessibility scans should be performed on a per-ticket basis and signed off on before work is considered complete.
-   Accessibility should NOT BE left until the end of a project, but baked in throughout its lifespan.

## General Accessibility Guidelines

-   Form elements are built with meaningful labels and form buttons include descriptive values.
-   Images should have meaningful alternative text ("alt tags") by default. We recommend making alt tags mandatory for content editors.
-   Decorative images or images with no content use should either have a null alt tag (alt="") or rendered as CSS background images.
-   Color should not be used as the sole method of conveying content or distinguishing visual elements.
-   Color alone is not used to distinguish links from surrounding text unless the luminance contrast between the link and the surrounding text is at least 3:1 and an additional differentiation (e.g., it becomes underlined) is provided when the link is hovered over or receives focus.
-   The page should be readable and functional when the text size is doubled. We use rem font-sizing (or another dynamic font unit) to make the text scales as expected when the web-page is zoomed-in. This also provides reliable text-resizing in smaller browser widths.
-   Adequate line spacing (at least 1/2 the height of the text) and paragraph spacing (1.5 times line spacing) is important for readability.

## Resources

-   [CivicActions Accessibility Site](https://accessibility.civicactions.com): Please visit and bookmark, it contains a wealth of information useful to you.
-   [Drupal Accessibility Guidelines](https://drupal.org/node/1637990)
-   [WCAG](http://www.w3.org/WAI/intro/wcag)
