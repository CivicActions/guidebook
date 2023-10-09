---
title: Security and compliance
---

# Security and Compliance

## Security Policy

All engineers understand and abide by the [CivicActions Information Security Policy](../../company-policies/security.md). Further, we have taken care in following all the steps laid out in the [Security Training](../../company-policies/new-hire-orientation/security-training.md).

In particular:

-   We practice [Server & Site Security](#server-and-site-security)
    -   using only sanitized databases
    -   taking care to not install restricted access files on development or personal instances outside the project defined security accreditation boundary
    -   and scrubbing unneeded data from our development systems

## As Developers

-   When creating test or exploratory accounts on staging or production systems, we:
    -   use a user name derived from your name like `first.lastname` or `flastname` or `flastname-admin`
    -   use your `civicactions.com` email address (can add an identifier, e.g. `first.lastname+project-admin@civicactions.com` -- everything after the `+` is ignored by the mailer)
-   We minimize custom code, always preferring to use community maintained modules and contribute patches when needed
-   When necessary for new functionality, we strive to create generic modules and contribute them to the parent project
-   Custom code must:
    -   have an associated Jira (or other ticketing system) ticket
    -   include testing mechanisms, ideally hooked into the continuous integration pipeline
    -   conform to coding standards (use static code analysis where possible (such as [DCQ](https://www.drupal.org/project/dcq))
    -   undergo security peer review

### As Drupal Developers

-   We follow [Drupal coding standards](https://www.drupal.org/docs/develop/standards) and best practices for [writing secure code](https://www.drupal.org/docs/administering-a-drupal-site/security-in-drupal/writing-secure-code-for-drupal)
-   We create and maintain [secure Drupal sites](https://www.drupal.org/docs/administering-a-drupal-site/security-in-drupal)
-   Note that `alpha`, `beta` and `rc` versions are not stable and not subject to security team support. It is often preferable to run a `dev` than `alpha/beta` releases where there has been significant number of bug fixes done, and the security profile is identical.
-   We periodically audit sites to determine if the set of enabled modules are all still in use on the site.

## Privileged Access

-   We ensure that access to documents/sites/dashboards is limited to those that should have access.
-   This includes our Google Docs!
-   We ensure that users with enhanced privileges (to sites and/or servers)
    -   must use MFA for authentication/authorization
    -   are appropriately adjusted upon separation from CivicActions.

### Advanced: Connecting to MFA-enabled Services/Apps

Some applications and services may need to connect to your CivicActions Google account but they might not be able to handle Multi-Factor Authentication (MFA). An example of this would be a personal Gmail account trying to send e-mails through your civicactions' account. For this purpose Google has created something called [App Passwords](https://support.google.com/accounts/answer/185833?hl=en). App Passwords allow you to create a unique password for each of your services/apps. If this password is used while authenticating your service/app to access your CivicActions' account it will bypass MFA.

### IT: Sharing Service Accounts

-   If a service allows individual accounts, use only individual accounts and not shared credentials.
-   Prefer services that allow individual accounts, services that allow MFA and secure password policies.
-   If a service only allows a single account, have a shared LastPass account that ideally only 2-3 trusted people have access to. From there share passwords out on an "as needed" basis only, including to individual day-to-day LastPass accounts for the 2-3 trusted people.
-   If the shared LastPass account is a paid account it also allows sharing credentials in a way that makes the password harder for the person who you shared it with to recover/view/share (but still allow them to log in with it).
-   Shared account passwords should rotate to ensure that only those users needing access continue to have access, revoking individual accounts particularly when people offboard from the project or company.

### Private keys

-   SSH public/private key pairs are used to access CivicActions servers.
-   GnuPG (PGP compatible) public/private key pairs may be used to transmit and store credentials to CivicActions client sites and internal services.
-   The private key files themselves should be kept in as few places as possible (ideally just your primary computer; a home server is also acceptable for storage of a backup copy of the encrypted key, but not for use of the key).
-   Private keys should never be placed on external servers – if you need SSH access to one server from another server (typically for a large data transfer), generate a dedicated key pair for that purpose or tunnel SSH over SSH port forwarding (ask IT for instructions).
-   If you suspect a private key file (or its passphrase) has been compromised, inform IT immediately, so that we can revoke the corresponding public key on our servers.
-   Keys must be 2048 bits as a minimum (keys using lower strengths must be replaced). 4096 bits or higher is recommended for new keys and will soon become required.
-   Passphrases may be cached, but should expire after 1-2 hours or at the end of each login session for desktops and laptops and after 5-15 minutes for mobile devices.

## Server and site security

Web administrator access to websites, working on source code, and access to servers (SSH/shell, file system, database), carries a high-level of responsibility and trust. You are expected to be familiar with and follow our best practices and processes, as well as maintain your skills and know your own limits.

Usage of CivicActions developer accounts should be as follows:

-   Usage must be directly related to your work with CivicActions - personal use (including personal projects) must be approved in advance by the CTO.
-   Use in any way harmful to CivicActions or our clients is forbidden.

Web administrator account holders (Drupal, CiviCRM or other) must also:

-   Be familiar with how to maintain configuration security as described in Drupal's [securing your site](https://drupal.org/security/secure-configuration) page.
-   Test the site after changing site permissions, by logging in as a user with each affected role and ensuring that access is limited correctly.
-   Test the site to ensure settings are correct after changing settings affecting content/data access control.
-   Avoid the use of PHP in the web administration interface when at all possible (as this code is harder to find and hence audit).
-   Respect the privacy of site users, avoiding accessing personal data such as private messages.

Developers and themers working on the site codebase (and committing code to Git) must also:

-   Ensure their own code and development practices follow accepted secure coding standard.
-   Ensure the standard dev-qa-live process is always followed, such that all changes that may affect site security can be thoroughly tested before being made live.
-   Ensure that external developers (client or 3rd party) working on the site codebase are either:
    -   A full part of our developer team, such that they been assessed/trained to have the appropriate skills and are subject to CivicActions code review.
    -   OR: The client confirms understanding that we have neither assessed their skills nor are we reviewing their code.
-   Review all contributed code they have not previously used for basic quality - this is not a formal security audit in most cases, but rather checking the usage stats, issue queue, skimming the module code for readability and adherence to good practices etc. Code that is actively used and maintained and follows best practices is less likely to have serious security issues.
-   Check for security advisories ([drupal.org/security](https://drupal.org/security)) for modules used on each active development site and ensure they are upgraded where necessary, before the site is made live.
-   Understand common attack vectors and the best practices for preventing them, including:
    -   SQL injection, prevented by proper query construction and placeholder usage.
    -   XSS (cross site scripting) attacks, prevented by ensuring user data is always sanitized as appropriate on output.
    -   XSRF (cross site request forgery), mitigated by ensuring URLs that perform actions (including pages that process GET/querystrings) carry an unpredictable token included on URL generation.
    -   Session hijacking, prevented by using SSL and correct site/session settings.
    -   Data disclosure, prevented by carefully setting and testing access control, as well as using SSL as needed.
    -   Password guessing attacks, mitigated by using strong passwords.
-   Software that is not licensed under an approved CivicActions open source license may not be used on a project without prior approval from the legal team.

The project technical lead (or a designated lead engineer/lead themer or peer-review process) is responsible for reviewing all new/modified code each sprint, and ensuring it meets a high standard of quality.

Developers and themers maintaining local sandbox copies of client sites must also:

-   Ensure that our standard tools for creating, sanitizing and transferring database dumps for sandboxes are used.
-   Ensure that unsanitized mysql data (extracted via mysqldump or phpmyadmin) is not downloaded from the server to a local sandbox.
-   Ensure that all confidential data associated with a project (such as databases, database dumps and other files) are securely deleted from their system(s) when leaving or completing a project.

Developers and themers working on the site server instance (SSH/shell, file system, database) must also:

-   Follow best practices with respect to SSH keys, passphrases and passphrase caching (see above).
-   Access the server only by methods (e.g. SSH, SFTP, SCP) configured by designated admins. Access by password, manually installed SSH keys (other than by admins), web based "shell" script, port forwarding to 3rd parties or other methods are forbidden, unless authorized in advance by the CTO.
-   Restrict SSH port forwarding to temporary use for the purpose of accessing the server MySQL from your own desktop.
-   Prefer the initiation of SSH connections from CivicActions servers to 3rd party servers, avoiding the reverse as much as possible.
-   Obtain prior approval from a member of the IT team before running non-standard software on a server instance. This includes:
    -   Daemons (persistent, long running processes)
    -   Binary software (compiled on the server instance or elsewhere)
    -   Web accessible scripts/CGIs that do not use solely an established framework
-   Inform the IT team as soon as possible if unusual resource usage is anticipated, so that we can monitor resource utilization and ensure backup processes run correctly. This can include high traffic events, large data/media file uploads or high CPU/RAM usage (e.g. during large imports).

IT team system administrators working on CivicActions servers must also:

-   Take the utmost caution when working on server configuration - document and test each change.
-   Non-urgent yet risky changes (those with significant risk of introducing undesired side-effects) should only be made when the person expects to remain online and available for at leat two hours after the change.
-   Not work on site/user files as root - but "su" to the account first.
-   Respect the privacy of server users, avoiding accessing others' personal data such as e-mails.
-   Work with the IT team to ensure server and backup health is monitored and alerts are responded to promptly.
-   Ensure offsite backups are transferred and stored only in encrypted form.
-   Ensure the RimuHosting access list (that controls remote hands and physical server access) is maintained.

## Continuous Monitoring

We use tools to support continuous monitoring for performance and efficiency, and to ensure proper operation and security. These tools include (not an exhaustive list):

-   Event and error log capture: auditd (SELinux), fail2ban and AIDE.
-   Continuous monitoring dashboards: Cloudwatch, StatusCake, OpsGenie, Splunk and New Relic.
-   Automated security scanning: OpenSCAP, OWASP ZAP, and Trivy.
-   Supply chain and Software Bill of Materials (SBOM): Syft and DependencyTrack.

## Incident Response

-   Every project has an Incident Response Team
-   We ensure that at least one member of the Incident Response Team has access to the Internet at all times.
-   We train new employees and perform yearly quizzes of employees on the Incident Response procedures.
-   Each project can extend or replace the default [Incident Response Plan](../../common-practices-tools/security/incident-response-plan.md).
