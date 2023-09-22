---
title: Drupal for project teams
---

# Drupal for project teams

## Drupal basics

### Logging in

The /user/login path will bring you to the form to log in to your drupal site. Depending on your project this route will likely be overridden to allow for single sign-on to be used. Single sign on is a service that allows users to have a single set of credentials for multiple applications. It is also worth noting that depending on your project there may be different processes in place for requesting access to be able to log in to your project's Drupal site(s). Refer to your project's onboarding documentation for gaining access to your site(s).

### Content management basics

As a content management system, Drupal's primary purpose is to allow users to create content with as little technical knowledge as possible. Some of the tools that it uses to allow users to create meaningful content are listed below. As a project team, part of our responsibility is to tailor these tools to our client's needs.

-   **Entity Types, Bundles & Entities:** In Drupal an entity type is a grouping of fields. Bundles are extensions of entity types, or sub-types. Entities are then instances of an entity type/bundle. For instance, an entity type can have several fields where editors or site administrators can enter content or other data. When these fields are filled out and submitted, an entity is created with the data from the fields. For those familiar with object-oriented patterns, An entity type can be thought of as a class. A bundle would be a subclass or extended class of the entity type. An entity would then be an instance or object of those classes. [Read more about entities.](https://www.drupal.org/docs/user_guide/en/planning-data-types.html) [Read more about the Entity API.](https://www.drupal.org/docs/drupal-apis/entity-api/introduction-to-entity-api-in-drupal-8)

-   **Nodes:** A node is an entity type that is provided by Drupal core. Most content on most sites is going to be stored as nodes. Nodes can be further divided into other bundles such as articles, blog posts, or other custom content-types (bundles). [Read more about nodes.](https://www.drupal.org/docs/core-modules-and-themes/core-modules/node-module/about-nodes)

-   **Menus:** Menus are collections of links used for navigation in websites. Drupal comes standard with several menus including the main navigation. Links can be added to or removed from menus using the admin interface. [Read more about menus.](https://www.drupal.org/docs/user_guide/en/menu-concept.html)

-   **Taxonomy:** Taxonomy is a way to categorize or classify different content on a site. Taxonomy terms provide a list of vocabularies or allow users to add new vocabulary on the fly that pieces of content can be "tagged" with. [Read more about taxonomy.](https://www.drupal.org/docs/user_guide/en/structure-taxonomy.html)

-   **Aliases & Redirects:** These allow site builders and editors to create more readable urls to content on the site. So instead of seeing a path like /node/12345 you could specify an alias of /some-content-title. [Read more about aliases and redirects.](https://www.drupal.org/docs/user_guide/en/content-paths.html)

## Drupal site administration

### Users, roles and permissions

Being able to control which users are able to see or do different things on your site is one of the major benefits of using a CMS like Drupal. In Drupal this is handled by giving users certain roles which have certain permissions. Drupal comes with a few roles by default, they are:

-   **Anonymous users:** Any user that visits your site who is not currently logged in. This role typically has very few permissions. Most of the permissions assigned to this role are going to be for viewing certain pieces of content.

-   **Authenticated users:** These are users who are logged in to your site. Depending on the site, authenticated users could have many permissions, or they might have very few permissions - similar to anonymous users.

-   **Administrator:** This is typically the role that you give to users who should have full administrative privileges to the site.

-   **Content Editor:** This role has been included by default since Drupal 9.3. This role provides for the management of content, media, and workflows. As with all roles, it can be modified to suit your needs.

You also have the ability to create additional roles however you see fit. For example, maybe your site allows users to sign up to be able to make comments on certain pieces of content. You might want to create a new role for commenters that gives them permissions that are different from, or more limited than, content editors, but not as limited as "Authenticated users".

You can read more about users, roles, and permissions in the [Drupal User Guide](https://www.drupal.org/docs/user_guide/en/user-chapter.html).

### Modules

The many different pieces of functionality on a Drupal site are typically broken down into different modules. Modules are sets of code that extend features and add functionality to your site. Modules can be turned on or off by installing or uninstalling the module.

The many different pieces of functionality on a Drupal site are typically broken down into different modules. Modules are building blocks that extend features and add functionality. Modules can be turned on or off by installing or uninstalling the module.

There are several modules that come shipped with core Drupal, and there are thousands more that can be downloaded and installed from contributors.

When you are looking for a feature that is not shipped with Drupal core, then it is best practice to search drupal.org for a contributed module that fits your needs. If there isn't one that fits your needs exactly but it comes close, it might be best to ask the maintainers of the module for a feature request. This can be done in the issue queue for the module on drupal.org. If you are able to contribute your own solution you can do so using the same issue queue and performing a merge request.

If you come across a situation where there is not a contributed module, then it might be best to have your team create a custom module for your use-case. Keep in mind that somebody else may need this same feature eventually, so you should think about contributing your custom module back to the Drupal community as a contributed module.

### Themes

Themes are the set of files (generally html and css) that determine how your site "looks and feels." Drupal comes with several basic themes. There are also many contributed themes available, some paid and some for free. Generally, however, most site administrators are going to create their own theme. They'll do this by either extending an already established theme (like the ones provided by core) or create an entirely new theme.

There are usually two different themes installed and enabled on a site at one time. One theme is for the content and the other is for the administrative interface.

### Views

Views are listings of content on your site. Drupal's views are highly customizable and provide many different ways that you can list content. Drupal comes with two modules for using views on your site. The first module is the Views module which handles displaying the view to the user. The second is the Views UI module which allows users (with the right permissions) to create and edit their views via the administrative interface. An example use-case for a view could be a news site landing page that shows teasers of news articles sorted by date published.
