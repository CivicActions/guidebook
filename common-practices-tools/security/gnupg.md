---
title: Setting up GnuPG
---

# Setting up GnuPG

## Create a new GPG key

**OS X Users NOTE:** If the instructions below do not work for you, you may need to upgrade your copy of gpg. To update try: [https://gpgtools.org](https://gpgtools.org) It is recommended that you customize the installation of gpgTools to NOT include gpg Mail (you can deselect it if you customize the installation)

[Github instructions](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

```shell
gpg --full-generate-key
```

-   Select "`(1) RSA and RSA (default)`" as the type.
-   Select a 4096 bit keysize "`What keysize do you want? (3072) 4096`"
-   Set the key to not expire "`Key is valid for? (0)`"
-   Set your full name and the email address associated with your Github and Gitlab accounts:

```shell
Real name: first-name last-name
Email address: user@example.com
Comment:
You selected this USER-ID:
    "first-name last-name <user@example.com>"
```

-   Set a complex passphrase for your private key.

It should return: "`public and secret key created and signed.`" and the new keypair should be present under `.gnupg/` in your home directory.

### List your GPG keys

List your keys and make note of the value after `sec  rsa4096/`. This will be used for specifying which key you are working with. **OSX User Note:** You can use the email address you used to create your key if your key build result did not include a value after the `sec  rsa4096/` notice.

```shell
gpg --list-secret-keys --keyid-format=long

gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
/home/username/.gnupg/pubring.kbx
-------------------------------
sec   rsa4096/FF342ASDF39B2 2022-09-13 [SC]
      99984532145747329BF4386FF94295866AB36B1
uid                 [ultimate] first-name last-name <user@example.com>
ssb   rsa4096/ADED1234B3C2C5BD 2022-09-13 [E]
```

### Export ASCII GPG public key

Get the ascii version of the public key that corresponds to your secret key using the armor and export options:

```shell
gpg --armor --export FF342ASDF39B2
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQINBGMg+QEBEACp+GHgRF1mOrz51yBcYde2h5Yl+MdN22TtrA4CkvnDsb1LvQdU
.
.
.
-----END PGP PUBLIC KEY BLOCK-----
```

This public key can then be shared with others to allow them to send you encrypted email or to configure [git commit signing](../../practice-areas/engineering/git.md).
