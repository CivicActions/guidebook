---
title: Drupal - contributed vs. custom development
---

# The most important decision in developing a Drupal site: contributed vs. custom development

When developing in Drupal, should we hack something together that's specific to a site? Or should we instead take the time to do things "right" by improving existing modules or writing our own new modules to contribute to the community? When is one of these options better than the other? How do we decide? It's a key set of questions. All but the most basic projects will require some level of new development. The way we approach this new development is probably _the most important factor_ in determining the long term value of our work, both for us and for our clients. It's a given that we'll first try to meet as much of the need as we can through existing, proven solutions. But there is always some need for customization. For smaller projects, new development might be:

-   minor patches to existing modules
-   some work on a custom theme
-   possibly a small focused custom module.

For larger projects, new development can include:

-   a large custom theme
-   several custom modules
-   new modules for contribution back to the community.

What are some of the benefits and risks of custom vs. contributed development? Here's some suggestions on how they compare.

| Topic                             | Custom Development                                                                                                        | Contributed Development                                                                                                                                                           |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Initial development time          | Can often be done quickly.                                                                                                | Can take a longer time.                                                                                                                                                           |
| Meeting customer specs            | Can potentially match customer specs exactly.                                                                             | May require additional work to create a general solution.                                                                                                                         |
| Flexibility/reusability           | Tends to be specific to a particular case. Answering a similar need even in the same project tends to require new coding. | Tends to be more flexible. May answer the next need with little or no new coding.                                                                                                 |
| Code quality                      | May encourage short-cuts.                                                                                                 | Imposes a relative rigour and promotes cleaner, higher quality code.                                                                                                              |
| Code footprint                    | Can tend to override, duplicate, replace existing code, leading to a larger overall code footprint.                       | Tends to focus on only what's needed, reducing code duplication.                                                                                                                  |
| Understandable code               | Encourages custom, non-standard methods that are harder for new developers to understand.                                 | Encourages more standard approaches and better documentation.                                                                                                                     |
| Troubleshooting and security      | Onus is entirely on the project.                                                                                          | Benefit of community contributions and broader testing due to a larger user base.                                                                                                 |
| Continuous integration            | Tests are run on client services for all code changes.                                                                    | Tests are run on Drupal.org only when the contributed code has changes. Also will get automated upgrade notices and patches to the next version of Drupal.                        |
| Maintenance and upgrade time      | Needs maintenance and upgrades, increasing long term cost.                                                                | Still needs maintenance and upgrading but will benefit from community contributions and from the potential to share costs with other projects since it meets their needs as well. |
| Developer satisfaction and growth | May reduce initial stress ("Sure, we can do that.").                                                                      | May provide greater fulfillment and more valuable learning ("We made this and shared it.").                                                                                       |

Most problems have at least a general component and can be approached in part through abstracted development. Part of the work is discussion with the client. We need to work to ensure the client understands the relative costs and benefits of custom development vs. general solutions. In most cases, opting to give the clients "what they want" isn't in their long term interest and can cut them off from the benefits of choosing an open source solution in the first place. We recommend encouraging clients to follow a [contrib first approach](../../../common-practices-tools/contribution/contrib-first.md).

## Theme-level vs. module-level solutions

Many of the same considerations apply when weighing the relative merits of theme-level and a module-level solutions. At first, it can seem relatively quick and easy to override at the theme level to give "what the customer wants". But as a long term approach it can lead to code bloat, duplication, and lack of coherence.

In theory, the theme level should be concerned primarily or exclusively with presentation and display; _what_ is being displayed should be the concern of modules. This ideal separation is not always feasible in practice. Still, before weighing a theme down with API calls, it's a useful discipline to ask: is this better handled in a module? How would that be done? Simple tweaks at the theme level make total sense--the get the exact look and feel with little pain. But extensive overrides can reduce or undermine the benefits of the platform. Example: overriding the display of a form. It's relatively quick and easy to do, but has long-term implications:

-   Future UI-level changes (for example, through CCK's field display management) may have unexpected results, or none at all.
-   New modules may be turned on but have no way to affect the form without new custom coding.

It may indeed be necessary to extensively customize a form if it's centrally important to the client. But can at least major pieces of this customization be done through an existing or if necessary a new API module, in ways applicable not to this one form but to any form?

## Finding the abstract in the specific

A large part of the challenge of providing the highest value to a client lies in teasing out the abstract problems embedded in the specificity of a client's project. Doing so is a skill that engineers can develop over time. It's not purely a technical question and ideally should involve the client, the project manager, and other members of the engineering team. Asking the right questions at the outset is key to ensuring the overall project is developed along a line where open sourcing the main thrust of development is a natural assumption. It can help to take a few steps back from the immediate details. What's the core of this need? Questions that can help tease out the general core of a problem include:

-   What is the basic need that this particular requirement answers?
-   What are the few problems that anyone with a similar need would always face?
-   What would the required information/data look like, independent of how it's displayed?
-   What is the earliest spot in the process of loading and building that this change could be made? Rather than tacking on or overriding in a large way at the end, could we make this an integral part from the start?
-   What is the minimum that we could do or change and still meet the MVP for our needs?
-   Is this problem really several distinct problems that look like one because they're tied up in the same UI/output/mockup/image?

Questions that can help clarify whether a particular problem lends itself to an abstract, contributed solution include:

-   Is the basic problem or need likely to recur on other sites?
-   Will a significant amount of time and code be required to abstract it enough to be useful to others?
-   Could it benefit from community support and security coverage?
-   Is it the kind of thing that could either make the client or CivicActions look like a leader?

A "yes" to one or more of these questions would indicate at least the potential to build out a solution coded to a high, general, open source standard, rather than custom code at the module or theme level.

## Staying open

Too much abstraction, or abstraction done too early, can increase complexity and short term cost. It may be true that almost every problem has a general aspect, but not every problem is sufficiently large to justify the "right" answer. Sometimes not enough is known about a problem from the outset to determine the best solution. But _custom development is essentially closed source_. That is, it's cut off from the primary benefits of open source. In fact, custom development can undermine those benefits in that it overrides and replaces solutions. An excessive reliance on custom code can burden a project in the long term with a massive codebase that delays or prevents necessary upgrades. The majority of custom code we produce for a project we should write to a general standard and contribute back. The top problems a project presents will, almost always, justify cleanly coded, general solutions that fully meet the client's needs _and_ can be perfectly applied elsewhere.

"Sure," you might say, "but how do we put these high-sounding ideas into action?" Well, glad you asked! Because the next installment is: [Drupal developer tips for getting the most out of open source](drupal-developer-tips-for-getting-the-most-out-of-open-source.md).

## Credits

-   This was originally a blog post on the CivicActions site authored by [Nedjo Rogers](https://nedjo.ca/) ([d.o](https://www.drupal.org/u/nedjo)) on November 19, 2008.
-   Modified in 2025.
