---
title: Security and compliance
---

# Security and Compliance

## Security Policy

All engineers understand and abide by the [CivicActions Information Security Policy](../../company-policies/security.md). Further, we take care to follow the guidance in the [Security Training](../../company-policies/new-hire-orientation/security-training.md).

We follow the _Principle of Least Privilege_: an entity (person or process) must be able to access only the information and resources that are necessary for its legitimate purpose.

We ensure that all [confidential information](../../company-policies/security.md#confidential-information-agreement) associated with a project (such as databases, database dumps, performace work statements (PWS) and other files) are managed securely and deleted when the need to know lapses.

## Server and site security

Developers, themers and others working on a project site must:

-   Be familiar with how to maintain configuration security
    -   For example, as described in Drupal's [securing your site](https://drupal.org/security/secure-configuration) page.
-   Confirm correct role permissions and authorizations after changing settings affecting content/data access control.
-   Ensure their code and development practices follow accepted secure coding standard.
-   Ensure all changes that may affect site security are thoroughly tested before being made live.
-   Engage - both give and receive - peer review of contributed code.
-   Check for security advisories (e.g., [drupal.org/security](https://drupal.org/security)) for libraries/modules/packages, ensure they are upgraded where necessary.
-   Understand common attack vectors, such as:
    -   [OWASP Top 10 Web Application Security Risks](https://owasp.org/www-project-top-ten/)
    -   [OWASP Top 10 API Security Risks](https://owasp.org/API-Security/editions/2023/en/0x11-t10/)

### As Drupal Developers

We follow [Drupal coding standards](https://www.drupal.org/docs/develop/standards) and best practices for [writing secure code](https://www.drupal.org/docs/administering-a-drupal-site/security-in-drupal/writing-secure-code-for-drupal)

-   We create and maintain [secure Drupal sites](https://www.drupal.org/docs/administering-a-drupal-site/security-in-drupal)
-   We understand that `alpha`, `beta` and `rc` versions are not stable and not subject to security team support. It is often preferable to run a `dev` than `alpha/beta` releases where there has been significant number of bug fixes done, and the security profile is identical.
-   We periodically audit sites to determine if the set of enabled modules are up-to-date and still in use on the site.

### Code Creation

We minimize custom code, always preferring to use community maintained modules and contribute patches when needed.

-   When necessary for new functionality, we strive to create generic modules and contribute them to the parent project
-   Custom code must:
    -   have an associated Jira (or other ticketing system) ticket
    -   include testing mechanisms, ideally hooked into the continuous integration pipeline
    -   conform to coding standards (use static code analysis where possible (such as [DCQ](https://www.drupal.org/project/dcq))
    -   undergo security peer review

The project technical lead (or a designated lead engineer/lead themer or peer-review process) is responsible for reviewing all new/modified code each sprint, and ensuring it meets a high standard of quality.

Software that is not licensed under a CivicActions approved open source license may not be used on a project without prior approval from the legal team.

### Account naming

We use a company identifiable email address and personally identifiable names for all company, client and service accounts:

-   based on your `firstname.lastname@civicactions.com` email address
-   to create multiple email addresses (that will be delivered to your main account) add a unique `+identifier` after your name -- everything after the `+` is ignored by the mailer
    -   e.g. `first.lastname+project-admin@civicactions.com`
    -   and: `first.lastname+qa1@civicactions.com`

When creating test or exploratory accounts on staging or production systems, we, use a user name derived from your name, e.g., `first.lastname` or `flastname` or `flastname-admin`

### Privileged Access

Privileged access to applications, websites, source code, and servers (SSH/shell, file system, database) carries a high-level of responsibility and trust. We are familiar with and follow best practices and processes, engaging our professional development and developing our skills.

Privileged account holders (Drupal, Moodle, Ilias, GNU/Linux SSH, etc.) must:

-   Respect the privacy of site users, avoiding accessing personal data such as private messages
-   Employ [Multi-Factor Authentication (MFA)](../../common-practices-tools/security/README.md#use-multi-factor-authentication-mfa) to ensure access is granted only to authorized personnel.

### Private keys

SSH public/private key pairs are used to access CivicActions and client servers and services we use.

-   RSA keys must be 2048 bits as a minimum (keys using lower strengths must be replaced). 4096 bits or higher is recommended for new keys and will soon become required.
-   The private key must be protected with a passphrase that adheres to the CivicActions [Password Policy](../../company-policies/security.md#password-policy)
-   Passphrases may be cached, but should expire after 1-2 hours or at the end of each login session for desktops and laptops and after 5-15 minutes for mobile devices.
-   Private key files should be kept in as few places as possible, and never on external servers
-   If you suspect a private key file (or its passphrase) has been compromised, [report the incident](../../common-practices-tools/security/incidents.md#reporting-an-incident) immediately.

### IT Team specifics

IT team system administrators working on CivicActions servers must also:

-   Take the utmost caution when working on server configuration - document and test each change.
-   Non-urgent yet risky changes (those with significant risk of introducing undesired side-effects) should only be made when the person expects to remain online and available for at leat two hours after the change.
-   Minimize the use of root or other group accounts
-   Work with the IT team to ensure server and backup health is monitored and alerts are responded to promptly.
-   Ensure system backups are logically air-gapped so that they cannot be corrupted or destroyed by a bad actor.

### Sharing Service Accounts

Group accounts with shared passwords should be avoided.

-   If a required service only allows a single account, LastPass password sharing or encrypted credential files can be used to share a password to a limited number of users on an "as needed" basis.
-   Shared account passwords should rotate to ensure that only those users needing access continue to have access, revoking individual accounts particularly when people offboard from the project or company.

### Incident Response

-   We are trained to recognize and report [security incidents](../../common-practices-tools/security/incidents.md).
-   Every project has an Incident Response Team
-   We ensure that at least one member of the Incident Response Team has access to the Internet at all times.
-   We train new employees and perform yearly quizzes of employees on the Incident Response procedures.
-   Each project can extend or replace the default [Incident Response Plan](../../common-practices-tools/security/incident-response-plan.md).

### Continuous Monitoring

We use tools to support continuous monitoring for performance and efficiency, and to ensure proper operation and security. These tools include (not an exhaustive list):

-   Event and error log capture: auditd (SELinux), fail2ban and AIDE.
-   Continuous monitoring dashboards: Cloudwatch, StatusCake, OpsGenie, Splunk and New Relic.
-   Automated security scanning: OpenSCAP, OWASP ZAP, and Trivy.
-   Supply chain and Software Bill of Materials (SBOM): Syft and DependencyTrack.
