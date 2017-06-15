# Systems and Sandboxes

* We contemplate DevOps lite so that we influence greater harmony and integration between sandboxes and systems.

  ![DevOps Lite](../images/devops-areas.png)

* We document our systems fully while avoiding too much verbosity.

## Table of Contents

1. [Overview](#overview)
2. [Basics](#basics)
3. [The WORKSPACE Directory](#the-workspace-directory)
4. [GNU-Linux](#gnu-linux)
5. [OS X](#os-x)
6. [\*AMP Configurations](#amp-configurations)
7. [Additional Tools](#additional-tools)
8. [CivicActions Sandbox Tools](#civicactions-sandbox-tools)
9. [Drush - the Drupal Swiss Army Knife](#drush---the-drupal-swiss-army-knife)
10. [Setting up a new site](#setting-up-a-new-site)
11. [Extras](#extras)

## Overview

The landscape of sandbox development environments is rapidly evolving, and there are many "best" ways to handle it. Here, we let you decide - and inform us! - how you handle the basics. But there are some hints here you may find useful.

Our previous "Creating your sandbox" page lasted for many years, and is still useful if you need to work with our older, svn-based client code repositories and sites.

### Virtual machines:

We have begun to use docker and vagrant to quickly and easily create sandbox development sites that match the specifications of the target server. These include pre-configured Apache, MySQL, PhP and other tools (composer, drush, etc.). Docker/Vagrant is currently in use on these sites:

GlobalNET: <https://git.civicactions.net/dsca/globalnet/blob/integration/readme.md>
GlobalNET v2: <https://git.civicactions.net/dsca/globalnet2/blob/integration/readme.md>

If you're working on one of these sites, follow the link above and the rest of this file is unnecessary.

### Document conventions:

Everywhere you see $HOME, replace with the path to your home directory, e.g., /home/fen or /Users/Bob

Similarly, replace WORKSPACE with $HOME/workspace

Some example system paths and commands may be specific to GNU/Linux, Mac may be different (but likely similar).

## Basics

You likely already have a \*AMP (Linux or Mac, Apache, MySQL, PHP) stack for your drupal development, but in case you don't, here are some good things to look at (and feel free to Google for more and post here your experiences):

* [GNU - Linux](#gnu-linux): mostly already there (Xubuntu 13.10 install example)
* Mac:
       - Many options - the first looks great, but what works best for you?
       - How to Install Xcode, Homebrew, Git, RVM, Ruby & Rails on Snow
       - Leopard, Lion, Mountain Lion, and Mavericks An OS X Drupal development environment with Homebrew
       - See also: Macintosh OS X Developer tools
* Windows: XAMPP?

Some additional information you may find useful: Setting up a development environment

$HOME/bin: It's very useful - essential! - to be able to install local executable files and scripts in a place that you can access from anywhere. If you don't already have it set up, do:

```
mkdir ~/bin
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**SSH:** To be able to use our gitlab repository or login to any of our sites, you'll need to have a SSH Public Key. CivicActions security policy states that the associated Private Key must be protected by a strong password. You can use the same key pair for gitlab and client site access - no need to create multiple keys. Here's some information for Creating Your SSH Public/Private Key Pair.

**Git:** You'll also need git. If `git --version` doesn't return a version number, do some Googling and install it.

## The WORKSPACE directory
The CivicActions standard is to install sites under WORKSPACE

```
mkdir ~/workspace
mkdir ~/workspace/conf.d
```

The second line supports the addition of local Apache configuration files, see next section...

The general process of installing a new site will be to change to your WORKSPACE directory and `git clone` the code from there, resulting in WORKSPACE/sitename/docroot

## GNU-Linux
From the command line (from Drupal.org):

  `sudo apt-get install synaptic apache2 apache2-mpm-itk php5 php5-curl php5-dev php5-intl php5-mcrypt php5-mysql php5-xdebug mysql-server`

### Optional

  `sudo apt-get install phpmyadmin`

### Lock PHP Version
You may wish to prevent PHP from automatically being updated to the latest version.

`sudo apt-mark hold php`

## OS X

### Homebrew/ports users:
The standard method is to manually alter the httpd.conf file to ensure that the relevant Apache modules are enabled. Go to:

/etc/apache2/httpd.conf and ensure that these lines are uncommented:

```
LoadModule rewrite_module     libexec/apache2/mod_rewrite.so
LoadModule vhost_alias_module libexec/apache2/mod_vhost_alias.so
LoadModule php5_module        libexec/apache2/libphp5.so
```

### OS X MAMP users:

Change your ports to default and document root to your WORKSPACE folder:

1. Create the workspace folder in your home directory.
2. Open your MAMP app.
3. Click preferences and choose the Apache tab.
4. Under "Start/Stop..." uncheck "Check for MAMP PRO"
5. Under "PORTS" click on "Set to default Apache and MySQL ports"
6. Under "Apache" set the Document Root to "/Users/YOURNAME/workspace"

## \*AMP Configurations

### Apache
Enable `mod_rewrite` and `vhost_alias` modules

#### Tell Apache to include your local configuration files
Edit Apache's httpd.conf file (usually found in /etc/apache/,  /etc/apache2/, or (on OS X MAMP) /Applications/MAMP/conf/apache/) and add this line to the bottom (replacing "WORKSPACE" with the full path to your workspace, e.g., "/Users/myusername/workspace"):

`Include WORKSPACE/conf.d/*.conf`

Restart Apache.

#### Default sitename.localhost config file
The [zz-localhost.conf](assets/zz-localhost.conf) (to be located in your new ~/workspace/conf.d/ directory, and named such so that it be read last -- only if the domain name being sought isn't found earlier) works magic with the Apache vhost_aliases module to find the docroot of a site given its name in the URL. (Note: This is mentioned here for context only; the script to actually install the file is included in the "Drush Aliases" section below.)

#### /etc/hosts
When installing a new site, (e.g., named "sitename") add a line to your /etc/hosts file like: 
`127.0.0.1   sitename.localhost`
Then when you visit `http://sitename.localhost` Apache looks for the (virtual) document root (using the enabled vhost_alias module) along the path defined in zz-localhost.conf and finds it in WORKSPACE/sitename/docroot/. See comments in that file (mentioned above and installed below in the "drush aliases section") for more information.

#### Permissions
Apache, by default, usually runs under the user:group permissions of www-data:www-data. In most cases, this is overly restrictive for personal development machines that aren't living a second life as a public server. The easiest way to get Apache to read the files in your ~/workspace/ directory is to change the permissions that Apache runs under to match your default user permissions. On Ubuntu, there is a file /etc/apache2/envvars that contains the variables `APACHE_RUN_USER` and `APACHE_RUN_GROUP`. Change the values these are set to from `www-data` to those that match your user account, and restart Apache.

If you can't do this for some reason (e.g., your development box is also a public server) you can grant www-data group write permissions to the group that owns your ~/workspace/ files, but this ends up being a bit more fiddley.

### MySQL

#### /etc/mysql/my.cnf
The Percona Configuration Wizard for MySQL does a good job.

$HOME/.my.cnf
Create a text file in your home directory named .my.cnf that contains the following (changing the user and password values to match your databas user and password names):

```
  [client]
  host=localhost
  user=root
  password=root
```

Then when you run mysql from the command line, you'll no longer have to type in pesky usernames and passwords!

#### Database naming
We often have multiple sites running on our sandox machines, and multiple databases, so we've developed a standard naming convention that some tools expect.

* sitename_drupal -- Drupal database for sitename (in your sandbox)
* sitename_civicrm -- CiviCRM database for sitename (in your sandbox)
* live_drupal -- Drupal database on LIVE (production) site (running on server vhost)
* qa_drupal --Drupal database on QA site  (running on server vhost)
* dev_drupal -- Drupal database on DEV (running on server vhost)

#### MySQL Workbench
Check out the [MySQL Workbench](https://www.mysql.com/products/workbench/) for a handy GUI - and there are others.
(Which should be our primary recommendation?)

### PHP
/etc/php5/apache/php.ini
There are many possible tweaks, but here are some you may want to consider:

max_execution_time = 600
memory_limit = 256M
display_errors = On

## Additional Tools

### Composer
a PHP dependency manager / package installer
Install composer <https://getcomposer.org/doc/00-intro.md#installation-nix>

### curl
-sS <https://getcomposer.org/installer> | php
mv composer.phar ~/bin/composer

#### PHP_CodeSniffer
This is a handy tool that works in conjunction with the coder module to ensure code meets the Drupal Coding Standards. (More info at <https://www.drupal.org/node/1419988>)

Install using composer with this command:

`composer global require squizlabs/PHP_CodeSniffer:\<2`

This will place the phpcs executable in ~/.composer/vendor/bin/. Add this to your executable search path by placing the following in your ~/.bashrc startup file after which you will need to restart your terminal session (or run: source ~/.bashrc).\`

```
# Set PATH to include composer's vendor/bin directory.
if [ -d "$HOME/.composer/vendor/bin" ] ; then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi
```

## CivicActions Sandbox Tools
Drush Aliases (and zz-localhost.conf)
Read the comments at the top of each file for instructions and usage.

```
https://git.civicactions.net/civicactions/sandbox-tools
cd ~/workspace
git clone git@git.civicactions.net:civicactions/sandbox-tools.git
ln -s ~/workspace/sandbox-tools/local.aliases.drushrc.php ~/.drush/local.aliases.drushrc.php
ln -s ~/workspace/sandbox-tools/ca.aliases.drushrc.php ~/.drush/ca.aliases.drushrc.php
# install zz-localhost.conf file used by Apache (described above)
cp ~/workspace/sandbox-tools/zz-localhost.conf ~/workspace/conf.d/zz-localhost.conf
# change all occurances of WORKSPACE to $HOME/workspace
sed -i -e "s|WORKSPACE|$HOME/workspace|" ~/workspace/conf.d/zz-localhost.conf
```

Often projects will include a drush aliases file in e.g., scripts/sitename.aliases.drushrc.php. Look for it or ask the TechLead if one exists, and then link it into your ~/.drush/ directory so that you can enjoy using them.

Note re: zz-localhost.conf:since this is an Apache configuration file, you should restart Apache after installing this file.

settings.local.php
The docroot/sites/default/settings.php file is usually a copy of default.settings.php with the addition of a line at the bottom to include "settings.local.php" if one is found. This allows us to keep passwords and local configurations out of the source code controlled settings.php file. An example settings.local.php file might look like:

```
< ?php

// Edit this for your local database username and password
$databases['default']['default'] = array(
  'driver'   => 'mysql',
  'database' => 'gn2_drupal',
  'username' => 'root',
  'password' => 'root',
  'host'     => 'localhost',
);

?>
```

## Drush - the Drupal Swiss Army Knife
[Drush FAQ](https://www.drupal.org/drush-faq)

```
cd ~/workspace
git clone https://github.com/drush-ops/drush.git
cd drush
git checkout tags/6.5.0   # or the current stable release
ln -s ~/workspace/drush/drush ~/bin/drush
drush status    # will report version and some other information
```

## Setting up a new site

Once you have all the above working, it's quick and easy to set up a new site in your sandbox. Here's the outline:

```
cd ~/workspace
git clone sitename_clone_url.git sitename
sudo vi /etc/hosts          # add: 127.0.0.1   sitename.localhost
mysql -e 'create database sitename_drupal'
# create sitename/docroot/settings.local.php file (see above)
# pull sitename's database and load into sitename_drupal
drush use @local.sitename   # cool command; do 'drush help use'
drush cc all
drush rsync @sitename.prod:%files/ @local.sitename:%files
# visit your site at http://sitename.localhost/
```

## Extras

Dotfiles to enhance the commandline
You may like to check out our dotfiles: <https://git.civicactions.net/civicactions/dotfiles> -- Fen and David have fancier versions:

<https://github.com/davenuman/dotdaven>
<https://github.com/openprivacy/dotfen>
Development environments
...tbd
(Fen sez: what more do you need than Emacs?)

civicactions.slack.com
And don't forget to ask questions on the #engineering channel on slack!
