---
title: Drupal developer tips to get the most out of open source
---

# Drupal developer tips for getting the most out of open source

We [recently suggested](../drupal/most-important-decision-in-developing-a-drupal-site-contributed-vs-custom-development.md) that the way we approach new development is the most important factor in determining the long term value of our work. But how can developers using Drupal make the most of open source by ensuring that participating and contributing is an essential part of our daily workflow? Here are some practical tips that come out of our experience at CivicActions and that can guide you in deciding how to approach new development to get the full benefit of open source. Read on as well for a discussion of patching vs. hacking vs. forking and of how to get attention for your patches.

## Approach to new development

Before wading into coding, it's important to take a good hard look at what's out there. For each area of functionality you're going to develop, the following decision-making steps can help focus your work.

-   **Existing modules and configuration** Is there an existing well-coded module that meets the need? Can the functionality be delivered through pure configuration? If so, do that.
-   **New development** Is the functionality, or is a significant aspect of it, a common need suitable to and worthy of solving in a general way?

    -   **Existing module** Is there an existing well-coded module that covers most of the need? If so, use the existing to provide the bulk of the solution.

        -   **Existing patch** Search the drupal.org issue queue for issues similar to yours. Does a patch exist that you could use, test, improve, and review? If so, do so.
        -   **New patch(es)** If not, produce a patch or patches on the module to achieve the changes as [Contrib First](../../../common-practices-tools/contribution/contrib-first.md). Contribute the patch to a new or existing issue with ample explanation.

    -   **New contrib module** If there is no existing module to cover the need, consider a small, focused new module for contributing back on drupal.org as [Contrib First](../../../common-practices-tools/contribution/contrib-first.md). See [guidance on building a module as Contrib First](./drupal-contrib-first-module-development.md).
    -   **New contrib module set** In cases where the problem is large, avoid producing a large, monolithic module that does a lot of distinct things. Instead, break the work into small distinct modules, not necessarily packaged in the same project. Wherever possible, rely on existing well coded API modules as components of your solution.

-   **Theme modifications** Is it a presentation-type change? Consider implementing at the theme level. However, avoid introducing new logic or functionality at the theme level. The following should be avoided wherever possible at the theme level:
    -   Load new data.
    -   Implement conditional logic.
-   **Custom module** Is it not a presentation-type change and not suitable for contributed (general) module development? Consider writing a custom module for use only on this site or - if feasible - for use on various sites that you maintain.

In summary:

-   Wherever possible, use or improve what already exists (existing contrib modules) before building anew.
-   When it's necessary to build anew, focus first on doing so in an extendable minimum viable product (MVP).
-   Try to produce custom (site-specific closed source) modules only when the needs are limited in scope and truly specific to the site.
-   Try to save the theme layer for what it's intended for--final presentation, look and feel.
-   When we work on a FOSS contribution for a client(s), all the work should be billable to that client. When doing maintenance on a contribution for no particular client, that work should be recorded as community participation (PRODEV_COMPART -> Community Participation). You will need to ask to be added to your options in Slack #unanet.

## Patching vs. hacking vs. forking

Changes we might make to existing modules fall into three general categories, which have very distinct implications.

-   **Patches** A patch is a contribution to a project that can reasonably be expected to be accepted. A patch must be general (not specific to a particular site). It's contributed back to the codebase with the hope that it will be accepted. However, it might not be accepted but others can still use the patch and build upon it.
-   **Hacks** A hack is a small change made to a file or files in the knowledge that it is unlikely to be accepted as a contribution to the original project. A hack may be made e.g. to provide customizations required by a client. Hacks may e.g. cause code conflicts when code is updated to a new version. Hacks have permanent costs--they must be maintained in perpetuity.
-   **Forks** A fork is extensive customizations made to an existing project to the extent that the codebase is now fundamentally customized. A fork converts an existing project into a custom module that must be permanently maintained on a custom basis for the site in question. Forking implies major long term costs and largely undermines the benefits of open source development, e.g., minimization of future maintenance and upgrade costs. Forks should be avoided whenever possible.

In weighing potential changes, it's essential to figure out what kind of change we're making and to carefully weigh costs and benefits, ensuring that the client too is aware of long term implications. At every stage, we should ask:

-   Can this change be made through API methods rather than code changes? For example, is there a hook available that could be used in a custom module to achieve the change without changing existing modules?
-   If not, can this change be made cleanly through a patch?
-   If not, is the benefit that would result from this change truly worth the long term costs of a hack or a fork?

Similar considerations apply when considering custom modules or overrides at the theme level. We should work with the client to ensure they understand that each hack, fork, custom module, and extensive theme override increases long term costs, especially of upgrades, and cumulatively can risk undermining some of the benefits of working with open source tools.

## Contributing patches

Getting patches accepted and applied takes a lot of time and effort. But it's time well spent. It's part of the cost of working with open source. Often, the time required to initially code a solution through a patch is only a fraction of the total time that will be required to get that patch accepted. Ideally, these are costs that we should build into development. Some keys to making this work:

-   **Make your changes general** Avoid site-specific hacks wherever possible. Do this e.g. through adding configuration options.
-   **Work with the current development branch** Active development on a particular module may have passed on from the Drupal version your site is in. If so, take the time to convert your patch to the active development version. If you can get it applied there, you might be able to backport it. Even if a backport doesn't get applied, you're still doing well. When the site you're working on is upgraded in the future, there'll be one less patch to worry about.
-   **Break up patches** When submitting patches, it's essential that you break them up into logically distinct issues. Yes, it's a lot more work. Yes, it's tempting to only roll a single patch for the various changes you might make to a module--new features, bug fixes, etc. But doing so will often sink any chance you have of getting the patch applied. How to do this in practice? Say you maintain a git repository of the site you're working on, as many Drupal development shops do.
    -   Maintain (outside git) a clean checkout of the module in question for each issue. In that checkout, make only the changes you need for that issue. Generate a patch.
    -   In your git repository checkout, apply each of the patches you've generated. You end up with the cumulative total of the patches, but you're able to keep them distinct.
-   **Communicate outside the patch queue** Connect with others in [drupal Slack](https://www.drupal.org/slack). Selectively and respectfully contact other developers via email to ask for feedback.
-   **Follow up** It's essential that you follow up on the patches you post. Answer questions. Re-roll patches.
-   **Request git access** If it looks like the maintainer could use some help, request git write access to the project. Wait until you've already contributed some sound patches. Then say, e.g., "I'm going to be working a lot with this module for the next few weeks/months and will be contributing a lot of patches. I'll always work through the issue queue. Could I get git access?"
-   **Co-maintain** If it looks like you'll be working in the longer term on the project, offer to be a co-maintainer of a module. Like requesting git write access, this works best if you've started small by proving yourself through e.g. some pure bug fix patches or small commonly needed features.
-   **Composer** [patches are used in composer files](https://github.com/cweagans/composer-patches) to automatically apply those when installing the modules. So name the patches with the patch issue queue number, comment number, and any short description. Also don't link directly the the Drupal.org links for patches and instead download the patch locally and then reference that local patch file in your composer file.

While patches are still a method to contribute to Drupal, the community has shifted to using [merge requests in GitLab](https://www.drupal.org/docs/develop/git/using-gitlab-to-contribute-to-drupal) as the preferred method.

## Reaping the benefits

If contributing back is an afterthought at best, we're missing out on most of the benefit of open source, please [Contrib First](../../../common-practices-tools/contribution/contrib-first.md#rationale-for-contrib-first) if possible.

## Credits

-   This was originally a blog post on the CivicActions site authored by [Nedjo Rogers](https://nedjo.ca/) ([d.o](https://www.drupal.org/u/nedjo)) on November 19, 2008.
-   Modified in 2025.
