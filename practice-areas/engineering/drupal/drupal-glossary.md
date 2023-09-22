---
title: Drupal glossary
---

# Drupal glossary

## Bundle

Entity types can be organized into bundles. Each bundle represents a different configuration of the entity and has its own fields. For example, the node entity type usually has multiple bundles such as "Basic page" and "Blog post". This affords site builders the opportunity to share functionality across multiple types of content.

"Basic page" and "Blog post" share multiple fields common to Nodes such as Author, Path and Publishing Status. Users have none of these. But if you want to add a field to only Basic pages, you can do that because Basic page is a bundle.

## Code

Files that control the behavior of a website (or other application). These are stored in the project's Version Control System and updates are deployed during each release.

## Content

Broadly, this can apply to any content on the site. Within the context of the Drupal UI, though, "Content" almost always refers specifically to nodes.

## Content Type

This refers to the bundles of the node entity type. Examples include "Basic pages" and "Blog posts", though it's common for each Drupal site to have its own business-specific content types (for instance, NSF's content types include Solicitations and Programs, which are documents that are specific to NSF's workflow).

## Config

Short for "Configuration;" in the context of Drupal, Config refers to a specific way of storing data. Some site information, especially information that is relatively static, will be stored in YAML files within the site's codebase, in addition to being stored in the database. This has a number of benefits for development, such as being able to track changes to the data using the Version Control System (VCS). There are also drawbacks; in most cases, a code deployment will include reverting all database changes to the values that are stored in the config files. This means that changes made to data stored in config must also be "exported" to the site's existing configuration files after the changes have been made to the database via the UI, or those changes will be lost the next time configuration is reverted.

## Contrib

Short for "Contributed," contrib refers to the universe of modules and other code that is contributed by the community for common use. Drupal is open source which means that anyone can implement changes to the code. Most modules work the same way; here at CivicActions we participate fully in Drupal's open source ecosystem both by using contributed modules and contributing any of our own fixes and changes that we need back "upstream" to the module maintainers.

Contributed modules are distinct from Core modules in that they are not maintained by the Drupal Association.

## Core

This refers to code that is maintained by the Drupal Association. It includes everything you get when you download an installation of Drupal.

## Custom

This refers to the code that CivicActions programmers have produced to meet the particular needs of CA's clients. Whenever it makes sense, we contribute our work back to the contrib ecosystem. But most of the business logic that we program is too specific to our clients to be useful to anyone else. This stays within our own Version Control System (VCS) and our team is responsible for its maintenance.

## Database

An application that specializes in storing, relating and retrieving data. Code running on the web server queries the database whenever website content is read or modified. The kind of databases that Drupal uses store their data in "tables" which can be visualized as very large spreadsheets. The database has features to make it possible to retrieve large amounts of complex data quickly and efficiently.

## Deploy

When a new version of a website's code is uploaded to a server, this is called a code deployment.

## Entity

In Drupal, an Entity is a data record that can be correlated to other records in a structured way. Entity is almost always short for fieldable entity which means an entity that makes use of Drupal's robust fields system. Entities and fields are core concepts of Drupal's content management and you'll encounter these terms frequently.

Broadly, an entity is a logical grouping of data that has a type and ID. For example, one entity type that exists on almost every Drupal site is "User". A User entity must have a discrete internal identifier (ID) so that the system can tell one user from another. This ID is almost always a number like 123 and is usually hidden from users.

A user also has fields which are data that relate to an entity. For example, "Email address," "Name," "Password" and "Last login date" are all fields. Note that none of these bits of data are useful on their own; it doesn't help us to store an email address if we don't know which user it belongs to. This is why the entity ID is so important, even if users never see it. If a User changes their email address, we can do so without impacting their other data because everything is tied together through that entity ID.

By adding a field to an entity type, all entities of that type will have access to that field (even if the field may be empty at first). It is also possible to organize an entity into Bundles, each of which has its own set of fields.

## Field

A discrete bit of data attached to an entity.

## Fieldable Entity

See Entity

## Fieldgroup

## Fieldset

## Git

The most common modern Version Control System.

## Module

Most of Drupal's code is organized into modules. This is what makes Drupal so extensible and customizable. Drupal core provides a handful of modules, but there are many more contrib modules maintained by the community

Each module provides a relatively narrow and discrete bit of functionality. For example, the Menu core module provides Drupal's base menu functionality. Building on that, the Menu Delete contrib module makes a small change to that functionality, allowing content editors to delete multiple menus at once. By mixing and matching which modules are enabled on a site, we can leverage the community's efforts to provide a lot of functionality with little (or sometimes no) custom code.

## Node

A Node is an entity type that is built into Drupal. Almost all Drupal sites use the Node module. Nodes are commonly used to store user-facing website content. Common properties of all nodes include a Title, a URL path and an author. Common Node Bundles include "Basic Page" and "Blog Post".

## Paragraph

Paragraphs is a contrib module which adds a new entity type called a "paragraph." These are fieldable like other entities, but must be attached to an existing entity using a reference field. Paragraphs are commonly used when you have a group of fields that may be repeated on an entity, but do not make any sense as data on their own. For instance, you might have a node for a resumè, with paragraphs for each line of the CV. Each paragraph entity would have its own title, description, start date and end date (fields), and the whole list of paragraphs would be attached to a field on the resumè entity like "field_job_history."

## Paragraph Type

Paragraph Types are the bundles for the paragraph entity type. So each paragraph type can have its own fields.

## Patch

A patch is a file that can be applied to some code to make a controlled, reproducible change to that code. More colloquially, we talk about "patching" code when we're making a change to fix a bug or add a missing piece of functionality. Because the contrib ecosystem can sometimes move slowly, patches often become a necessary part of using contributed code. If a fix is available for a bug, but the module maintainer has not yet implemented it, we will use a patch file to point repair the bug until the maintainer implements the patch into the module.

## Site builder

Version Control System (VCS)

An application used by our programming teams. The most common of these is git. Version control is an important part of any software project. It allows multiple developers to work on the same code without accidentally overwriting each other's work. It also provides a complete history of changes to the code that can be referred to as documentation, or in extreme cases used to roll back to a previous version.

## View

Views is a core module (as of Drupal 8, prior to this it was contrib) that provides powerful list-making functionality. Any list of content on your site is probably powered by a view.
Web Server
An application that specializes in serving data (generally in the form of web pages) in response to requests from a web client (such as a browser). You can think of it as another computer that your computer is connecting to in a structured way (known as a protocol), although nowadays most servers are distributed across hardware and even multiple datacenters. In concert with the database, the web server does most of the work of delivering content to visitors.
