# Contrib First

Whenever we are building something that could be of use to more than one project or client, we build it as contributed work first.

## Rationale for contrib first

-   **Fiscal responsibility** - Building it and contributing it means that other government agencies will never have to pay to build the same thing. This helps agencies comply with Federal Source Code Policy: Achieving Efficiency, Transparency, and Innovation through Reusable and Open Source Software [OMB Memorandum M-16-21](https://obamawhitehouse.archives.gov/sites/default/files/omb/memoranda/2016/m_16_21.pdf)
-   **Reusablity** - CivcActions other clients can benefit from work that was already done.
-   **Security** - contributing our work to an open source project like Drupal means it may receive security coverage by the Drupal security team and the public.
-   **Avoiding the gift that never happens** - Clients are not typically supportive of taking working local software that was already built for them and in use by them and then paying to move or refactor that software to be open source. The benefit is too small for the cost. By building it as contributed code first, there is no extra cost.
-   **Development happens in the open** - The issue are public. The commits are public. Everyone can contribute.

## Contrib first patches

In the case of changes needed to existing modules or Drupal core:

1. We contribute patches to existing issues or create new issues.
2. We use the compose-patches to apply local copies of the contributed patches.

## Contrib first modules

When a new module is needed, the process looks like this:

1. Gather requirements and identify MVP vs nice-to-haves
2. Search for existing modules that might solve the problem. (It might be easier to stretch an existing module than build a new one)
3. Choose a meaningful search engine friendly module name. (crowd sourcing name suggestions is recommended)
4. Create the Drupal project on Drupal.org
5. Populate the project page with a descrion of what is coming. List supporters as CivicActions and the client. If the client does not have a drupal.org page, encourage them to create one.
6. Populate the issue queue on the Drupal project with "Feature requests". Mark any that are part of the MVP as "major". Create issues for any immprovement ideas that pop up. They don't all have to be acted on, but they help shape the road map for where you want the module to go.
7. Begin with alpha releases. Ideally when all your MVP/major issues are closed, you are ready for the official release.
8. After the official release, opt in to security coverage.

## Examples of modules CivicActions built as contrib first

-   [Allow Only One](https://www.drupal.org/project/allow_only_one)
-   [Codit: Batch Operations](https://www.drupal.org/project/codit_batch_operations)
-   [Codit: Menu Tools](https://www.drupal.org/project/codit_menu_tools)
-   [Content Model & Site Documentation](https://www.drupal.org/project/content_model_documentation)
-   [Entity Field Fetch field](https://www.drupal.org/project/entity_field_fetch)
-   [GovDelivery Bulletins](https://www.drupal.org/project/govdelivery_bulletins)
-   [Mermaid Diagram Field](https://www.drupal.org/project/mermaid_diagram_field)
-   [Node Link Report](https://www.drupal.org/project/node_link_report)
-   [Post API](https://www.drupal.org/project/post_api)
-   [Vertex AI Search](https://www.drupal.org/project/vertex_ai_search)

See more of [CivicActions Drupal contributions](https://drupal.org/civicactions).
