---
title: Security awareness
---

# Security awareness and tools

This is an appendix to the [CivicActions Security Policy](../../company-policies/security.md) containing details that can and should be updated regularly as new technologies or patterns of use develop, with a goal of providing team members the best tools with which to maintain the security of company confidential and personal information.

_This is currently - and probably always will be - a work in progress. Pull Requests welcome._

## Securing your laptop

The operating system and software applications on your laptop - and all computers, phones, tablets, etc. in your house - should be kept up to date with new versions and security patches that ensure it presents a minimal attack surface to potential adversaries. (This is mentioned in the [Security Policy](../../company-policies/security.md) but is worth repeating.)

Additionally, your laptop should lock (require a password to resume) on screen close and after 15 minutes idle time. See [Securing Your Workspace](./securing-your-workspace.md) for more details.

## Password management tools

A password manager enables you to have unique, strong passwords for every service that you log into. Good password managers will generate new passwords for you, auto-fill web forms, allow extra protection for high-security accounts (like banking), and more. Choose a password manager that encrypts locally (in your browser, so you don't have to trust the provider to keep their data safe) and that has iPhone and Android apps that will auto-sync with the manager. At CivicActions, we currently recommend LastPass as it is the most full-featured, but we are keeping a close eye on other solutions.

The password manager itself must be protected by a strong _memorized secret_ (this may be the only password you have to remember) as defined in the [Password Policy](../../company-policies/security.md#password-policy)

### LastPass

-   The [LastPass](https://www.lastpass.com/) password generator can create and maintain hundreds of different passwords. And LastPass has free iPhone and Android apps.
    -   We recommend a minimum of 16 character passwords using all character types. (Some old systems will need you to lessen this level of security, but those are few.)
    -   Once you have all your passwords in LastPass, take the "Security Challenge" - your score should be 80% or higher.
-   LastPass is required for members of the CivicActions System Admins and DevSecOps Team.
-   We recommend LastPass premium but do not require it. A premium account will enable unlimited sync across your devices and more robust two-factor authentication (e.g. with a [YubiKey](#yubikey) token).
-   Set up Two Factor Authentication on your LastPass Account (see below). LastPass will be storing all your passwords, so make it secure.
-   It is fine (and perhaps preferable, because your browser can only use one LastPass account at a time) to use a personal email address to create your LastPass account.

### Disable browser password autofill

LastPass provides secure password management especially when unlocked via Two Factor Authentication. Storing new passwords created in LastPass in your browser completely defeats this security, enabling anyone with access to your browser access to all your sites. If asked by your browser "Do you want to save this password in your browser?" answer "**No**". Then disable this insecure action altogether:

-   In Chrome, go to chrome://settings/ and uncheck "Offer to save your web passwords"
-   In Firefox, go to about:preferences#privacy and uncheck "Ask to save logins and passwords for websites"
-   In Safari, go to Settings >> AutoFill and uncheck "User names and passwords"

## Use Multi-Factor Authentication (MFA)

Multi-Factor Authentication (MFA), sometimes known as Two-Factor Authentication (TFA or 2FA), greatly enhances login security by requiring two or more pieces of evidence (or factors) before granting access to a service. These factors may include something you know (e.g., your _memorized secret_), something you have (e.g., your smartphone or a YubiKey), and something you are (e.g., your fingerprint or iris scan).

If you lose your second factor (say a Yubikey or your phone) you may not be able to unlock the service any more. For this reason it is crucially important that you have a [backup second factor](#multi-factor-redundancy-and-mfa-backup-codes) for each MFA-enabled service.

CivicActions requires MFA for access to your password manager, the CivicActions Google Workspace, GitHub, Gitlab and for any _privileged account_ access.

### Multi-Factor Authenticators (MFA)

There are many hardware and software tools for creating secure "one time passwords" (OTP). Three that we frequently use internally are described below.

Do not rely on SMS text messages for general two-factor authentication as it is less secure than others listed here. At the time of this writing, however, setting up MFA on your Google account initially requires SMS verification. This is OK, and also serves as a "MFA Backup" mechanism (be sure to see the essential section below on [Multi-Factor Redundancy and MFA Backup Codes](#multi-factor-redundancy-and-mfa-backup-codes)).

#### LastPass Authenticator

-   This provides tight integration with Lastpass, see: <https://www.lastpass.com/solutions/authentication>
-   For installation see [iPhone](https://apps.apple.com/us/app/lastpass-authenticator/id1079110004) or [Android](https://play.google.com/store/apps/details?id=com.lastpass.authenticator&hl=en_US&gl=US)
-   For more info, [see the support page](https://support.lastpass.com/s/document-item?language=en_US&bundleId=lastpass&topicId=LastPass/LastPass_Authenticator.html&_LANG=enus)

#### Authy

-   For installation instructions (iPhone or Android), see: <https://authy.com/download/>
-   Guides for setting up Multi-Factor Authentication: <https://authy.com/guides/>

#### YubiKey

Once set up, your YubiKey greatly simplifies the process of Multi-Factor Authentication (MFA). While at home, keep the key plugged into an unused USB port and tap the button if asked to authenticate. This saves time while enabling the strongest security. While on the road, the nearly indestructible YubiKey attaches to your keychain _(and should only be inserted when authenticating)_.

See the [Yubikey page](./yubikey.md) for details on setting it up with various operating systems.

While YubiKey is the easiest to use on a daily basis, if you lose it you could get locked out of all your systems so be sure that you have set up [Multi-Factor Redundancy and MFA Backup Codes](#multi-factor-redundancy-and-mfa-backup-codes).

### Partial list of MFA-Enabled services

-   LastPass: [Multifactor Authentication Options](https://support.lastpass.com/s/document-item?language=en_US&bundleId=lastpass&topicId=LastPass%2Ft_lastpass_faqs_users_logging_in_using_diff_mfa_options.html&_LANG=enus)
-   Google: [2 Step Verification](https://support.google.com/accounts/topic/28786?hl=en&ref_topic=3382253)
-   GitHub (especially for your [CivicActions account](https://github.com/CivicActions)): [Securing your account with two-factor authentication (2FA)](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa)
-   GitLab: See [your profile](https://git.civicactions.net/profile/account)
-   iCloud: [Two-factor authentication for Apple ID](https://support.apple.com/en-us/HT204915)
-   Slack: [Enabling two-factor authentication](https://get.slack.help/hc/en-us/articles/204509068-Enabling-two-factor-authentication#enablingtwofactor-authentication)

### Multi-Factor redundancy and MFA backup codes

As a final, crucially important step, **_you must have a backup second factor for all your MFA accounts_**. Imagine that you use a YubiKey to unlock LastPass and you lose it. Without a backup second factor, you would be effectively locked out of all of your accounts. So you need a backup.

SMS can often be an easy backup, but it is known to be insecure. Most services that provide MFA provide multiple second factor options, and we recommend that you set up at least one of several backup strategies for each MFA-enabled service you use:

-   Have a second YubiKey in safe keeping (the author of this article has three).
-   [Authy](#authy) and [LastPass Authenticator](#lastpass-authenticator) provide ever-changing 6-digit codes and can securely backup to the cloud, so if you lose your phone you can pull your information back out of the cloud when setting up your new phone. _Hint: store your cloud backup password in LastPass (but make sure you have another mechanism to unlock LastPass!)_
-   Many services offer a downloadable set of single use "backup codes" that can be printed and kept in a safe place. _Hint: you can store backup codes from other services in LastPass in the Notes section._

## Phishing and social engineering

Social engineering is the most common attack vector used to compromise computer systems. Social engineering relies heavily on human interaction and often involves tricking people into breaking normal security procedures. The following is a brief reminder of some of the methods used, but is in no way complete.

-   Phishing
    -   Is the email from someone you know and contains expected information?
        -   Emails from unknown people asking for some action on your part is the most common form of phishing.
    -   Don't click on links or open attachments:
        -   Unless you trust the sender and expect the link or attachment,
        -   Even if you trust the source (a From: address can be spoofed) hover first and check the URL
    -   If in doubt, ask an IT member (e.g. via Slack) or forward the email to an IT member
    -   [More on Phishing avoidance (from EFF)](https://ssd.eff.org/en/module/how-avoid-phishing-attacks)
-   Windows Technical Support
    -   "Windows Technical Support has noticed that you have viruses or other malware on your computer..."
-   Baiting
    -   Seemingly innocent (or interesting) abandoned USB, CD, DVD media with autorun
-   Public Wi-Fi (e.g., coffee shop, airport, library)
    -   Turn off sharing
    -   Don't automatically connect to unknown Wi-Fi hotspots
    -   Confirm the network name - know the name of your hotspot!
        -   Watch out for an "Evil Twin" - a hotspot that looks good but could be an access point set up by an attacker (e.g., "StarbucksGuest" or "DeltaFreeWifi")
    -   Turn on your local firewall
    -   Use a VPN if possible
        -   CivicActions has an [internal company VPN](https://git.civicactions.net/devops/internal-it-wireguard-vpn/tree/master) that has a static exit IP that can be allow-listed to CivicActions' client services
        -   If you always use HTTPS and SSH for connectivity, you are essentially creating a trusted VPN tunnel with every connection. There could still be metadata collection and local DNS spoofing, but [public Wi-Fi is now reasonably safe](https://www.eff.org/deeplinks/2020/01/why-public-wi-fi-lot-safer-you-think)
    -   As usual, never enter your name or password information:
        -   when on an insecure (non-HTTPS or SSL encrypted) connection, or
        -   to a site that you have not verified is correct (by examining at the URL)
    -   [More on public Wi-Fi network safety (from FTC)](https://consumer.ftc.gov/articles/are-public-wi-fi-networks-safe-what-you-need-know)

## Keep your systems up-to-date

One of the best ways to protect yourself from being hacked (other than via a social engineering pathway) is to keep your software on your computers and phones up-to-date. Sometimes you may reasonably want to wait for a .1 or .2 release before updating after a new major release, but don't get far behind. Also, if you have a Windows machine, you _must_ maintain an up-to-date anti-virus package on it.

## Disk encryption and storage management

Most modern disks (and SSDs) have self-encrypting drive (SED) technology built in. CivicActions highly recommends SSDs for their increased speed and the hardware-based encryption (self-encrypting drive or "SED" technology) that will protect the drive when the machine is off. This is particularly important for laptops that can be easily stolen. When you buy a new disk or configure a new laptop, turn on the disk encryption. Some CivicActions clients will demand it. (Contact your product manager to see if you are eligible for a hard disk rebate.)

### Software disk encryption

If you haven't set up your hard drive with hardware encryption, there are software alternatives that you can use until you get yourself a new drive. Note that these methods incur a small performance penalty with respect to hardware encryption, but they are relatively quick and easy to set up.

#### macOS: FileVault 2

CivicActions strongly recommends full disk encryption (FDE) with FileVault, and requires it on Macs supplied by CivicActions for specific client work.

-   [Use FileVault to encrypt the startup disk on your Mac](https://support.apple.com/en-us/HT204837) - setup instructions

Much more technical detail on securing your Mac: [macOS-Security-and-Privacy-Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide/blob/master/README.md). _This is useful but well beyond what is required by CivicActions._

#### Windows: BitLocker or DiskCryptor

To see if BitLocker is supported on your version of Windows, open up Windows Explorer, right-click on C drive, and see if you have a "Turn on BitLocker" option (if you see a "Manage BitLocker" option, then congratulations, your disk is already encrypted.) If you don't have BitLocker available, google the open source DiskCryptor.

#### GNU/Linux: use the hardware

Unlike Mac and Windows, you can only encrypt your drive during system installation. Might as well buy a new SSD with hardware encryption or - during install - enable [Linux Unified Key Setup (LUKS)](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) which comes standard with most distributions.

### Backups

With more work captured in the cloud by Slack, Gmail, Google Drive, GitHub, etc. there is less that needs to be backed up. But you won't know what you'll miss until your system doesn't boot up because of an unrecoverable hard drive (or SSD) error. At the least, back up your security keys and personal preferences directories, such as (examples in GNU/Linux):

-   `~/.ssh/`
-   `~/.gnupg/`
-   `~/.config`

Consider committing your personalization files (like `~/.bashrc`) into a Git repository. Please ensure that you do _not_ commit any files that may contain private keys or passwords.

While it's preferable that you _not_ backup any company or client sensitive files or data, it is critical that such data is completely deleted from your machine(s) when you stop working for that client.

If you use any backup mechanism more complicated than simply copying the files to another medium, ensure that you know how to restore the files, too, as backups are worthless if you can't retrieve them.

<!-- prettier-ignore -->
Finally, there is no good reason not to be making backups: a one _terabyte_ external USB drive costs less than $60 on Amazon.

### Securely delete files and wipe disks

When you delete a file, it doesn't actually go away. Usually, all that occurs is the file name and a pointer to its bits are removed from a directory listing. With the proper tools, deleted files can be recovered. For this reason, it's important that old disks be securely wiped before being given or thrown away. Some pointers are given below:

GNU/Linux:

-   [How to delete file(s) in secure manner?](http://askubuntu.com/questions/57572/how-to-delete-files-in-secure-manner) (Ask Ubuntu)
-   [How to: Delete your Data Securely on Linux](https://ssd.eff.org/en/module/how-delete-your-data-securely-linux) (from the EFF Surveillance Self-Defense guide)

MacOS:

-   [How to erase a disk for Mac](https://support.apple.com/en-us/HT208496) - if erasing your startup disk, use macOS Recovery
-   [About macOS Recovery](https://support.apple.com/en-us/HT201314) - which will lead you to reinstallation:
-   [How to reinstall macOS from macOS Recovery](https://support.apple.com/en-us/HT204904)

More information and resources:

-   [Guidelines for Media Sanitization](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-88r1.pdf) (pdf) (NIST SP 800-88, December 2014)
-   [ATA Secure Erase](https://ata.wiki.kernel.org/index.php/ATA_Secure_Erase)

## Protecting your privacy

CivicActions believes that your privacy is a right, and that private communications can be beneficial to business. Here's some tips on how FOSS can help:

-   [Protecting Your Privacy with Encryption](encryption.md)
