---
title: Security Policy
version: 1.1.5
---

# CivicActions Information Security Policy

CivicActions has established the following policy to safeguard the security, confidentiality, availability and integrity of CivicActions data, as well as that of our personnel, clients and client website users. All CivicActions employees and contractors are expected to accept and abide by this policy. This policy will be reviewed and updated from time to time. If you have questions or comments about this policy please contact your supervisor. We invite your feedback.

## Our primary goals

-   Protect clients' confidential and personal information;
-   Reduce potential liability of CivicActions;
-   Craft a consistent policy that is easy to understand, implement and follow;
-   Educate/disseminate our best practices for security throughout the CivicActions community;
-   Demonstrate to clients that we are trustworthy and satisfy contractual requirements for security.

## Confidential Information Agreement

CivicActions does most things out in the open, and we strive to reduce the amount of Confidential Information (defined below) we get from third parties. Despite that, during your time as an employee or independent contractor you will be exposed to certain Confidential Information owned by CivicActions, owned by third parties, or provided to us by users and governed by our privacy policy. This section of the Agreement describes the responsibilities you have with regards to such information. Accordingly, you agree that Confidential Information:

-   is owned by CivicActions, or (where appropriate) by the third party from whom it originated
-   will only be used as necessary to perform your job
-   will be protected by you with reasonable measures (such as not letting it out of your control)
-   will not be disclosed to anyone outside of CivicActions

You further agree that you will promptly notify your manager if you know of unauthorized use of Confidential Information.

"Confidential Information" means information or material which is proprietary to CivicActions and not generally known outside CivicActions, including information or material that you create, learn, or obtain, as well as information we receive in confidence from third parties. For example, this may include without limitation any information disclosed that is subject to applicable non-disclosure protections of CivicActions privacy policies, non-public product plans of CivicActions or 3rd parties, technical and business information, personnel information like salaries, or other sensitive information. Material need not be marked confidential for it to be considered Confidential Information.

Personally Identifiable Information (PII) should be considered confidential by default, but that may depend upon the project and data usage; PII generally falls into one of two classes:

1.  Sensitive Personally Identifiable Information (SPII) - for example: Social Security or Passport numbers, financial account numbers, biometric identifiers, passwords, and all records and files directly relating to a person that are not publicly available.
2.  "Rolodex" Personally Identifiable Information (PII) - for example: publicly available personal data such as name, email, home address and phone number.

The exact definition of PII varies from jurisdiction to jurisdiction and depends on the project, so consult with your project manager or the security team if you have questions.

Not all information or material you encounter is confidential information. Generally, Confidential Information does not include any information which is subject to free and open source software licenses, or similar licenses including without limitation, GNU General Public License, MIT License, GNU Affero General Public License, or Creative Commons ShareAlike licenses. This may depend on CivicActions' agreements with third parties, though, so if the free and open source licensed material does not fall into one of the categories below you should check with your project manager to determine if the material is considered Confidential Information. Confidential Information does not include (i) information communicated that is publicly known at the time you received the information or has become publicly known other than by a breach of this Agreement; (ii) information you independently developed unrelated to your relationship with CivicActions and without violation of this Agreement; and (iv) information that becomes known to you from a source other than CivicActions, provided any such source is legally entitled to have and to disclose such information to you without restriction. CivicActions believes strongly in openness and transparency and we strive to release source code publicly under a free and open source license agreement, but there may be circumstances where we choose not to; for instance we may be prevented from doing so by the terms of an agreement with a third-party.

From the point of view of a typical client project, this means that:

-   Database exports should always be treated as confidential, since these may contain personal information that is not publicly available.
-   The uploaded files directory may need to be treated as confidential if the client site has any access-controlled content.
-   The site source code can normally be treated as non-confidential, unless this includes proprietary code from the client or 3rd parties.
-   The contents of the project management site (e.g. Trac, JIRA, Trello, etc.), e-mail lists and related communication tools, will normally contain a mixture of confidential and non-confidential information:
    -   Information authored by clients or 3rd parties should generally be treated as confidential, unless it is clearly public-facing, and then its use other than as set forth in the engagement agreement may still require client permission. If in doubt, ask your supervisor or the legal team.
    -   Project management material can be sourced for distribution or repurposing, but should be first reviewed and redacted, if needed, to ensure no confidential information remains.

If you are unsure about the confidentiality of a piece of information you should ask someone who is able to give a qualified answer (if in doubt who this is, consult with the legal team) - in the meantime, work from the assumption that it is confidential.

## Acceptable Use Policy

It is each person's responsibility to ensure they understand and follow the data security policy. This is true for CivicActioners in both non-technical and technical roles, although there are some additional steps that need to be taken for those involved in technical work.

Broadly, dealing with confidential information involves - to the maximum extent feasible - limiting the number of places (physical and logical) where it is stored, and secondly ensuring that each of those places is as secure as reasonably possible, to prevent unauthorized access.

Users are responsible for carefully tracking any confidential information stored on personal devices (including backup/offline storage). Periodically during and after each project, confidential information stored on personal devices should be reviewed, and anything that is no longer needed should be deleted (after being archived to a CivicActions service, if needed). Users should ensure files are actually deleted (and not stored in a recycle/trash area), ideally running [a secure delete on the files](../common-practices-tools/security/README.md#securely-delete-files-and-wipe-disks), which is available out of the box on OS X and GNU/Linux based systems. Note that if a personal device is used in the performance of some of our contracts, you may be required to provide a copy of stored information or the device itself (such as the disk drive containing the information) if requested by CivicActions or the client. As always, if you have questions, talk to your project manager or the legal team.

There are also a number of security concerns with non-confidential information. Even though we don't need to protect it from viewing, it is critical that any copies in active use are protected from unauthorized changes.

It is important that our information technology systems, service and network infrastructure are used in ways that maintain:

-   Security from unauthorized access and use
-   Data integrity
-   Compliance with the law
-   Compliance with our hosting provider(s) acceptable use policies

CivicActions IT services provide a number of general user accounts. This includes:

-   CivicActions GSuite Google Apps (Gmail, Hangouts, Docs, Drive, etc.)
-   Web-based collaboration accounts such as
    -   Our home site
    -   Intranet (internal team collaboration)
    -   Project management site (Trac, JIRA, Balsamiq, GitLab, ...)
    -   3rd party collaboration tools (such as Slack, Trello, Zoom, ...)
    -   IP telecommunications/conferencing accounts

Usage of CivicActions user accounts should be as follows:

-   Usage must be directly related to your work with CivicActions - personal use (including personal projects) must be approved in advance by the CTO.
-   Use in any way harmful to CivicActions or our clients is forbidden.
-   Storing confidential personal information from client website users (for example CSV exports from CiviCRM) on internal collaboration systems should be avoided wherever possible, especially on 3rd party services such as Google Docs.
-   Confidential information (other than personal information) should only be stored in areas restricted by access control, such as the project management area.
-   Binary software executable files should not be distributed via internal collaboration systems, as we do not have anti-virus scanning in place. Uploading human readable source code and scripts (php, bash, perl etc.) is acceptable (but nevertheless should be considered a risk).

In addition to user accounts we provide developer and system administrator access to system and service accounts, such as administrator web-access and SSH access to client sites, version control systems such as SVN/Git and MySQL database access. Usage of these accounts is covered in the [Engineering Security and Compliance](../practice-areas/engineering/security-compliance.md) guidelines.

## Access Policy

The security of our systems is only as strong as the weakest link. Hence it is important that all devices that connect and are authenticating to any CivicActions IT system are as secure as possible. Specifically:

-   This includes access to web based accounts, such as our intranet, as well as developer accounts.
-   This covers both desktop and laptop machines, as well as devices such as mobile phones and network routers (including home/office Internet gateways). This also includes 3rd party sourced servers/services that employees and contractors may employ as part of their workflow.
-   CivicActions is responsible for maintaining the security of our own systems, as well as supporting computers or other devices that may be provided to staff as a part of their employment.
-   Employees and contractors are responsible for maintaining their own systems to the highest standards of security. This includes (but is not limited to) the standards described in this document.
-   The civicactions.com Google docs and domain must be accessed via your civicactions.com email address. In particular, it is not permitted to add a personal email address to shared civicactions.com domain Google docs.

Before connecting and authenticating to any CivicActions IT system or storing confidential information on your systems, all users must ensure that:

-   Operating systems, and all software that makes network connections (such as web browsers), or opens files that have been downloaded from the Internet (such as PDF readers) is patched or updated to resolve critical publicly known vulnerabilities, or, when an older version of a program is used on purpose (such as for interoperability testing), it is run in a sandbox (typically a virtual machine).
-   Systems vulnerable to malware infections (primarily Windows, but may include other systems and mobile devices) are running a high-quality virus scanner (such as Avast or ClamAV) that automatically updates its virus definitions at least every 24 hours, detects malware in a real-time fashion, and completes a full system scan at least every week. In addition, Windows users are expected to run a general malware scanner (which may be integrated into the virus scanner, or may be separate, such as Adaware or TotalAV) that detects accidentally installed malware that does not qualify as a virus.
-   A firewall is configured to block all unsolicited incoming connections to systems that store confidential information. This can be a network router NAT based firewall, or a software based firewall running on your local machine. This applies to all operating systems.
    -   For laptops that are used in hostile network environments (including public places such as cafes or airports) a software based firewall is mandatory.
    -   For users of Unix based systems, such as GNU/Linux and OS X, it is acceptable to open port 22 to allow external SSH access to home/office computers, as long as these systems are up-to-date with security patches and they use strong account passwords or SSH keys.
    -   It is particularly important to ensure that network shares, databases and local development sandbox versions of web sites are not publicly visible, both when working from home/office and when working in public places.
-   User accounts on all systems must be password protected (using passwords that adhere to our password policy) and require entering the password on initial startup, as well as on resume from "sleep" mode.
-   Whenever practical, work should be done from under a relatively non-privileged (user) account, not from an account with administrative privileges on the computer. Working under the latter is more likely to result in unintended installation of malicious software that would be harder for an anti-virus program to detect and cure. Thus, even if you're the only person using a computer (such as a laptop), it is a good practice to create two accounts on the computer: a "user" and an "administrator", and use the "user" account for most activities.
-   Untrusted software should not be installed. This includes software you have never heard of, as well as known software that was downloaded from sources other than the author's site or a trusted, established repository.
-   Be cautious opening e-mail attachments or files sent over instant messengers or similar systems. Even if the attachment is from a contact you recognize, if it is unexpected and does not indicate a project or discussion you recognize it is wise to e-mail the person separately to confirm that they sent the message. The reason for this is that it is common for malware to use e-mail software contact lists to send e-mails masquerading as a known contact with the malware attached.
-   Do not access CivicActions IT systems using an untrusted computer (for example an Internet café or library system). This is because these systems can easily be infected with malware that transmit user activity to a 3rd party.
-   If technically possible, additional protections such as encryption of your home directory (with a strong passphrase not reused for another purpose) and "remote wipe" of lost mobile devices are encouraged.
-   When connected to wired or wireless Internet connections associated with CivicActions (for example while at company sprints/retreats or when visiting client site offices), users are expected to follow the appropriate terms and conditions of that provider, and to avoid initiating network traffic (e.g. by visiting specific websites or running file sharing software) that may bring our reputation into question.

If a system is believed to be compromised, either through theft, loss, remote access, virus/malware infection, CivicActions IT should be informed immediately.

## Password Policy

Strong passwords provide the basis for secure authentication to many systems and services.

For a password to be compliant with the CivicActions "strong password" policy, it must be 12 characters or longer and not based on a dictionary word, your name or the application you are logging in to. If under 16 characters (e.g, 12-15 characters) it _must_ be paired with a second factor (see [Multi-Factor Authentication](../common-practices-tools/security/README.md#use-multi-factor-authentication-mfa). A longer _passphrase_ consisting of several words in an order that make sense only to you can work well as a _memorized secret_.

All passwords at CivicActions must follow this policy, including passwords used for:

-   Personal computers or devices that access CivicActions or client services or store confidential information.
-   Your password manager, PGP and SSH encryption keys.
-   Accounts on any CivicActions or client site or service.
-   Accounts on 3rd party vendor sites.

CivicActions requires that you employ a unique, strong password for every service that you log into. For this reason, CivicActions requires use of a [Password Manager](../common-practices-tools/security/README.md#password-management-tools).

### Mitigation

If you suspect a password has been compromised (for example, it was accidentally typed into an unencrypted chat session), [report the incident](../common-practices-tools/security/incidents.md#reporting-an-incident) immediately - the Security Team will provide support. It is usually good practice to change the password yourself if possible.

-   This includes the case when a client sends a name/password pair in the clear in an email.

## Mobile Device Security

Mobile devices are portable devices that connect to the internet, specifically devices like smartphones and tablet computers. Most (or all) mobile devices used at CivicActions are personal devices - this policy is intended to cover these personal devices, if they are used for CivicActions work.

Securing mobile devices used for CivicActions work is crucial for safeguarding sensitive information and maintaining the integrity of our organization and our customer's data. The following are best practices for mobile device security (for more information see NIST SP 800-124 - [Guidelines for Managing the Security of Mobile Devices in the Enterprise](https://csrc.nist.gov/pubs/sp/800/124/r2/final)):

1. Keep the device updated on all firmware and OS updates, including critical security updates.
2. Enable security features to lock devices when not in use. Recommended security features include a password or 6-character pin, and biometric security (fingerprint, facial recognition, if available).
3. The device must be set to automatically lock after a maximum of 5 minutes of inactivity. If security features make unlocking convenient then a shorter lock time is recommended.
4. Verify that data is encrypted on the device. Ways to set this up by OS type:
    - iOS - setup icloud account to enable data encryption
    - Android - setup biometric/pin code to enable data encryption
5. Do not "jailbreak" or "root" your mobile device, removing inherent OS security and exposing it to malware apps.
6. Install apps from only secure sources (official app stores) and avoid side-loading apps.
7. If a device used for CivicActions work is lost or stolen, please notify the security team immediately to document and assist in recovering or wiping the device.
8. Follow [CivicActions' prohibited hardware and software policy](prohibited-hardware-and-software.md) to avoid using/installing items on the list.

## Security awareness and tools

We maintain a [Security Awareness and Tools](../common-practices-tools/security/README.md) document that dives deeper into these and some additional topics, including:

-   Password Management Tools
-   Multi-Factor Authentication
-   Phishing and Social Engineering
-   Backups
-   Secure Delete Files and Wiping Disks

Finally, in addition to the above policies, CivicActions Engineers -- who may have elevated privileges in specific environments -- are required to align with the [Engineering Security and Compliance](../practice-areas/engineering/security-compliance.md) guidelines.
