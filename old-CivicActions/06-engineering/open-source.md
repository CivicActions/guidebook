---
layout: default
title: How to Open Source like a Trussel
nav_order: 4
has_toc: false
has_children: true
---

This is the `How to Open Source like a Trussel`, written by Trussels for Trussels. We share it here for others to see how we approach open source.

<hr>
<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
* TOC
{:toc}
</details>
<hr>

# Default To Open

Truss encourages working in the open. What does this mean? Making the software we write open source where we can as often as we can so that everyone can benefit. Benefits include early identification and elimination of defects, cost savings through outside involvement, and reusability.

## Exceptions

As with everything, there are always going to be certain exceptions that just don't fit the model of working in the open. This should be rare, but take this into consideration before opening up your repo to the general public.

- Data published contains sensitive information.
- We do not have the rights to reproduce or publish the item on our own.
- Publishing is restricted by law or other regulations, such as the Export Administration Regulations.

<!--
## Oh no, I've published an excepted case, what do?
TODO
-->

# Community First

One of the things that is important to us is making sure that we have a community around our projects that is safe for everyone to participate, no matter if they are fellow Trussels or not. This means that we have developed a strong [Code of Conduct]({{ '/docs/opensource/CODE-OF-CONDUCT' | relative_url }}) that governs how we manage the community and contributions to our projects. Our ultimate goal is to make sure that everyone has a voice and is able to contribute to our software in ways that are meaningful to them. You should always include a copy of the Code Of Conduct, or point to this canonical version so that the community at large is aware.

# Licensing

Non-software projects, like documentation, should be licensed as [CC-BY 4.0 International]({{ '/docs/opensource/LICENSE-CC-BY-4.0' | relative_url }}) when possible and include a copy of the license.

Where it makes sense, source code should default to using an [Apache 2.0]({{ '/docs/opensource/LICENSE-APACHE-2.0' | relative_url }}) license, and should include a copy of the license.

When there is a mix of items, please include a [`NOTICE`]({{ '/docs/opensource/NOTICE' | relative_url }}) file that declares which license(s) are in use for each part of the project.

Certain projects may require the use of an existing license in the case of open source software not originally created by Truss. Follow these terms as conditions where necessary as it will specify how such code may be used, modified or shared.

Each project may need to modify and extend licenses to fit their own circumstances.

For fuller guidance, please see :lock:[TDR 0066 - Open Source License Defaults for TrussWorks Owned Projects](https://docs.google.com/document/d/12UYIN3XfRPdKQV87_0ILa9-z6eWRBcLqtwP9fCyR6Tg/edit#heading=h.5wnob6jxgsgl)
