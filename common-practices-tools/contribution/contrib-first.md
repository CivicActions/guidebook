---
title: Contrib First
---

# Contrib First

It is a best practice to consider first if we are building something that could be of use by more than one project or client. We build it as contributed work first, if our contract and security concerns allow for it. We actively advocate for this approach with our clients. Contrib First is an approach we take with both patches to Free and Open Source Software (FOSS) and new contributions.

## Rationale for contrib first

-   **Fiscal responsibility** - Building it and contributing it means that other government agencies will never have to pay to build the same thing twice. This helps agencies comply with Federal Source Code Policy: Achieving Efficiency, Transparency, and Innovation through Reusable and Open Source Software [OMB Memorandum M-16-21](https://obamawhitehouse.archives.gov/sites/default/files/omb/memoranda/2016/m_16_21.pdf) and the newer federal [SHARE IT law](https://www.congress.gov/bill/118th-congress/house-bill/9566).
-   **Reusability** - CivicActions other clients and the public at large can benefit from work that was already done.
-   **Security** - Contributing our work to an open source project like Drupal means it may receive security coverage by the Drupal security team and the public. It is made more secure by getting more eyes on the code and more users surfacing any issues.
-   **Avoiding the gift that never happens** - Clients are not typically supportive of taking working local software that was already built for them and in use by them, and then paying to move or refactor that software to become open source. The benefit is too small for the cost. By building it as contributed code first, there is no extra cost.
-   **Development happens in the open** - The issues are public. The commits are public. Everyone can contribute improvements.
-   **Reliability** - A solution built for contribution is often better designed, and better documented than a local solution meant to "just get it done". By putting our company and personal names on it publicly we commit to a quality product. Releasing a FOSS solution also increases the number of testers and edge cases that can surface and reduce bugs in the code.
-   **Scalability** - Contributed FOSS is more scalable than one-off solutions and can grow with the power of the FOSS community.
-   **Visibility** - CivicActions, our developers and clients earn positive representation as technology leaders and contributors.
-   **Economy of tests** - Unit, Kernel and Functional tests for the module are run on the pipeline on Drupal.org. This translates into savings because they don't slow down custom tests running on client servers (human time savings). They run when the module is updated, not every time custom tests run (server cost savings).
-   **Digital Public Goods** - We know that contributing to the digital commons helps everyone. We know that we need to contribute to [digital public goods](https://en.wikipedia.org/wiki/Digital_public_goods) and not simply use them.

## Examples of FOSS CivicActions built as Contrib First

-   [Allow Only One](https://www.drupal.org/project/allow_only_one)
-   [Codit: Batch Operations](https://www.drupal.org/project/codit_batch_operations)
-   [Codit: Menu Tools](https://www.drupal.org/project/codit_menu_tools)
-   [Content Model & Site Documentation](https://www.drupal.org/project/content_model_documentation)
-   [Drupal Knowledge Archive Network (DKAN Open Data Portal)](https://github.com/GetDKAN/dkan)
    -   [CMSDS Open Data Components](https://github.com/GetDKAN/cmsds-open-data-components)
-   [Drydock Cloud](https://github.com/drydockcloud)
-   [Entity Field Fetch field](https://www.drupal.org/project/entity_field_fetch)
-   [GovDelivery Bulletins](https://www.drupal.org/project/govdelivery_bulletins)
-   [Mermaid Diagram Field](https://www.drupal.org/project/mermaid_diagram_field)
-   [Node Link Report](https://www.drupal.org/project/node_link_report)
-   [Open Accessibility Conformance Report](https://github.com/GSA/openacr)
-   [Post API](https://www.drupal.org/project/post_api)
-   [Vertex AI Search](https://www.drupal.org/project/vertex_ai_search)

See more of [CivicActions Drupal contributions](https://drupal.org/civicactions).

## Frequently Asked Questions

### Does building by Contrib First cost more?

Not typically. There are three significant offsets that make Contrib First the more affordable option:

1. Having Open Source community members also work on "feature requests" that are defined during the build process can take advantage of cost free work.
2. Custom code required custom tests that run on the project's infrastructure, while contributed code has tests that run on the contributed framework hosting.
3. If one agency has built it, other agencies don't have pay to build it.

### Does contributed code cost more to maintain?

Generally speaking, no it does not cost more. In total cost of ownership, contributed code is less expensive to maintain than custom code. Contributed code usually gets updated by update bots when there are changes needed. They make issues and merge requests automatically. The same code existing as custom code has to be updated by project personnel when the need for a change is discovered. In addition, with a broader user base, Open Source community members are more likely to uncover bugs or inefficiencies and provide improvements.

## How de we decide between what is worth contributing and what is too specific to a project to have more general appeal?

Our engineers are pretty good at recognizing opportunities to re-use their work across multiple projects. This is especially true in the Government sector where agencies often have similar requirements. If we have even a hint that multiple agencies could benefit, we build it as contributed code first. If it starts out as something so specific to a given project that it can no be generalized, the we build it as custom code for that project. However we continually re-evaluate our custom code to see if, over time, it has become something that is worth contributing.

### Does developing by Contrib First take longer?

In our practice, marginally. Largely the increase comes in specifying the bite sized issues on the Open Source issue queue. If following [good Contrib First development practices](../../practice-areas/engineering/drupal/drupal-contrib-first-module-development.md) small bite sized issues take a little longer to write, but they greatly increases the chance that a community member will grab the ticket and work on it. On our recent build of the Alt Text Validation module 10 out of the first 37 commits (27%) came from community members.
