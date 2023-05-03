---
header:
    "The Most Important Decision In Developing A Drupal Site: Contributed Vs.
    Custom Development"
---

Note: _This was originally a blog post on the CivicActions site authored by [Nedjo Rogers](https://nedjo.ca/) ([d.o](https://www.drupal.org/u/nedjo)) on November 19, 2008._

When developing in Drupal, should we hack something together that's specific to a site? Or should we instead take the time to do things "right" by improving existing modules or writing our own new modules to contribute to the community? When is one of these options better than the other? How do we decide? It's a key set of questions. All but the most basic projects will require some level of new development. The way we approach this new development is probably _the most important factor_ in determining the long term value of our work, both for us and for our clients. It's a given that we'll first try to meet as much of the need as we can through existing, proven solutions. But there is always some need for customization. For smaller projects, new development might be:

-   minor patches to existing modules
-   some work on a custom theme
-   possibly a small focused custom module.

For larger projects, new development can include:

-   a large custom theme
-   several custom modules
-   new modules for contribution back to the community.

What are some of the benefits and risks of custom vs. contributed development? Here's some suggestions on how they compare.

<table>
<thead>
<tr>
<th>Topic</th>
<th>Custom Development</th>
<th>Contributed Development</th>
</tr>
</thead>
<tbody>
<tr>
<td><em>Initial development time</em></td>
<td>Can often be done quickly.</td>
<td>Can take a longer time.</td>
</tr>
<tr>
<td><em>Meeting customer specs</em></td>
<td>Can potentially match customer specs exactly.</td>
<td>May require relatively more adjustment of customer specs, or additional work to customize a generic solution.</td>
</tr>
<tr>
<td><em>Flexibility/reusability</em></td>
<td>Tends to be specific to a particular case. Answering a similar need even in the same project tends to require new coding.</td>
<td>Tends to be more flexible. May answer the next need with little or no new coding.</td>
</tr>
<tr>
<td><em>Code quality</em></td>
<td>May encourage short-cuts.</td>
<td>Imposes a relative rigour and promotes cleaner, higher quality code.</td>
</tr>
<tr>
<td><em>Code footprint</em></td>
<td>Can tend to override, duplicate, replace existing code, leading to a larger overall code footprint.</td>
<td>Tends to focus on only what's needed, reducing code duplication.</td>
</tr>
<tr>
<td><em>Understandable code</em></td>
<td>Tends to promote custom, non-standard approaches that are relatively difficult for new developers to follow.</td>
<td>Tends to promote more standard approaches.</td>
</tr>
<tr>
<td><em>Troubleshooting and security</em></td>
<td>Onus is entirely on the project.</td>
<td>Potential benefit of contributions from community contributions and wider testing environment given a bigger install base.</td>
</tr>
<tr>
<td><em>Maintenance and upgrade time</em></td>
<td>Can with a custom code base that needs maintenance and upgrades, increasing long term cost.</td>
<td>Still needs maintenance and upgrading but may benefit from community contributions and from the potential to share costs with other projects since it meets their needs as well.</td>
</tr>
<tr>
<td><em>Developer satisfaction and growth</em></td>
<td>May reduce initial stress ("Sure, we can do that.").</td>
<td>May provide greater fulfillment and more valuable learning.</td>
</tr>
</tbody>
</table>

Most problems have at least a generic component and can be approached in part through abstracted development. Part of the work is discussion with the client. We need to work to ensure the client understands the relative costs and benefits of custom development vs. generic solutions. In most cases, opting to give the clients "just what they want" just isn't in their long term interest and can cut them off from the benefits of choosing an open source solution in the first place.

## Theme-level vs. Module-level Solutions

Many of the same considerations apply when weighing the relative merits of theme-level and a module-level solutions. At first it can seem relatively quick and easy to override at the theme level to give "just what the customer wants". But as a long term approach it can lead to code bloat, duplication, and lack of coherence. In theory, the theme level should be concerned primarily or exclusively with presentation and display; _what_ is being displayed should be the concern of modules. This ideal separation is not always feasible in practice. Still, before weighing a theme down with API calls, it's a useful discipline to ask: is this better handled in a module? How would that be done? Simple tweaks at the theme level make total sense--the get the exact look and feel with little pain. But extensive overrides can reduce or undermine the benefits of the platform. Example: overriding the display of a form. It's relatively quick and easy to do, but has long-term implications:

-   Future UI-level changes - e.g., through CCK's field display management - may have unexpected results, or none at all.
-   New modules may be turned on but have no way to affect the form--without new custom coding.

It may indeed be necessary to extensively customize a form if it's centrally important to the client. But can at least major pieces of this customization be done through an existing or if necessary a new API module, in ways applicable not just to this one form but to any form?

## Finding the Abstract in the Specific

A large part of the challenge of providing the highest value to a client lies in teasing out the abstract problems embedded in the specificity of a client's project. Doing so is a skill that engineers can develop over time. It's not purely a technical question and ideally should involve the client, the project manager, and other members of the engineering team. Asking the right questions at the outset is key to ensuring the overall project is developed along a line where open sourcing the main thrust of development is a natural assumption. It can help to take a few steps back from the immediate details. What's the core of this need? Questions that can help tease out the generic core of a problem include:

-   What is the basic need that this particular requirement answers?
-   What are the few problems that anyone with a similar need would always face, regardless of the details?
-   What would the required information/data look like, independent of how it's displayed?
-   What is the earliest spot in the process of loading and building that this change could be made? Rather than tacking on or overriding in a large way at the end, could we make this an integral part from the start?
-   What is the minimum that we could do or change and still meet the need?
-   Is this problem really several distinct problems that just look like one because they're tied up in the same UI/output/mockup/image?

Questions that can help clarify whether a particular problem lends itself to an abstract, contributed solution include:

-   Is the basic problem or need likely to recur elsewhere on the site or on other sites?
-   Will a significant amount of time and code be required?
-   Is this problem close to the core of what the organization/site is all about?

A "yes" to one or more of these questions would indicate at least the potential to build out a solution coded to a high, generic, open source standard, rather than custom code at the module or theme level.

## Staying Open

Too much abstraction, or abstraction done too early, can increase complexity and short term cost. It may be true that almost every problem has a generic aspect, but not every problem is sufficiently large to justify the "right" answer. Sometimes not enough is known about a problem from the outset to determine the best solution. But _custom development is essentially closed source_. That is, it's cut off from the primary benefits of open source. In fact, custom development can undermine those benefits in that it overrides and replaces solutions. An excessive reliance on custom code can burden a project in the long term with a massive codebase that delays or prevents necessary upgrades. The majority of custom code we produce for a project we should write to a generic standard and contribute back. The top problems a project presents will, almost always, justify cleanly coded, generic solutions that fully meet the client's needs _and_ can be perfectly applied elsewhere. "Sure," you might say, "but just how do we put these high-sounding ideas into action?" Well, glad you asked! Because the next installment is: [Drupal Developer Tips for Getting the Most out of Open Source](drupal-developer-tips-for-getting-the-most-out-of-open-source.md).
