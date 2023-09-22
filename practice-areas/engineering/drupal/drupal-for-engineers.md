---
title: Drupal for engineers
---

# Drupal for engineers

## Directory structure

For an overview and brief description of Drupal's directory structure see Directory Structure on drupal.org.

## Drush

Drush is a command line tool that assists with, and speeds up many common Drupal tasks. For example, rather than having to click through the UI to do something like install a new module, you can use a single drush command to do it for you. There are a lot of other commands in drush that can do things like generate boilerplate code, run migrations, or clear cache. You can read more about drush on their site https://www.drush.org.

## Caching

Caching is the process of storing files in a temporary storage, or cache. The reason that websites, browsers and many different applications use a cache is because it greatly increases performance. For CivicActions, there are usually several layers of cache that we need to be aware of.

The first layer is the browser cache. Browsers will save copies of all, or most of the content of a webpage on the device's hard drive. This way, when the user re-visits the webpage, the browser won't have to re-download all of the content and can bring up the page much quicker.

The second layer that most teams will need to be aware of is the Drupal cache. Most of our sites will have Drupal core's internal page cache module enabled. This makes it so that pages are cached for any anonymous users visiting the site. When the first anonymous user visits a Drupal page, Drupal will save the results of any queries or requests that it performs into its cache. It will then serve those cached results for all anonymous users. The time that Drupal holds on to these results can be altered in the administrative interface.

After these first two layers, there can be several other layers of caching depending on your site's hosting and any CDNs you may be using. You should check with the engineers on your team if you'd like to learn more about these extra layers of caching.

If you've made some changes to your site, but the changes aren't showing up, you might need to rebuild the cache in one of, or all of these different layers. In Drupal, clearing the cache can be done from the administrative interface (/admin/config/development/performance) or with a drush command ("drush cache:rebuild" or "drush cr"). You can clear the cache in your browser by using the browser's settings (this process may differ between browsers). There are also some contributed modules such as Purge and Akamai Purge that can help with rebuilding the cache in some of the extra caching layers that your site may have.
