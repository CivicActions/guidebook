---
title: Encryption
---

# Protecting your privacy with encryption

The following offers a brief and necessarily incomplete overview of a few FOSS tools, several of which employ encryption, that you can download and install to enhance the privacy of your interactions online.

> This is important. If we only use encryption when we're working with important data, then encryption signals that data's importance. If only dissidents use encryption in a country, that country's authorities have an easy way of identifying them. But if everyone uses it all of the time, encryption ceases to be a signal. No one can distinguish simple chatting from deeply private conversation. The government can't tell the dissidents from the rest of the population. Every time you use encryption, you're protecting someone who needs to use it to stay alive.
> _[Why We Encrypt](https://www.schneier.com/blog/archives/2015/06/why_we_encrypt.html)_ by Bruce Schneier

For some background on how encryption can protect your privacy, see [A Deep Dive on End-to-End Encryption: How Do Public Key Encryption Systems Work?](https://ssd.eff.org/module/deep-dive-end-end-encryption-how-do-public-key-encryption-systems-work), and [Surveillance Self-Defense](https://ssd.eff.org/en) tutorial, as provided by your friends at the [Electronic Frontier Foundation](https://www.eff.org/). \[[Donate!](https://supporters.eff.org/donate/)]

Finally, keep an eye out for anti-encryption bills such as [Burr-Feinstein](https://www.techdirt.com/articles/20160527/08343534565/burr-feinstein-anti-encryption-bill-has-no-support-wont-be-moving-forward-anytime-soon.shtml) (also [here](https://www.wired.com/2016/04/senates-draft-encryption-bill-privacy-nightmare/), [here](https://www.engadget.com/2016/09/10/anti-encryption-bill-proposed-changes/) and [here](https://duckduckgo.com/?q=anti-encryption%2Bbill&ia=web)) and be prepared to take action when they resurface to protect your rights to privacy and security.

## GNU Privacy Guard (GPG)

The [GNU Privacy Guard](https://www.gnupg.org/) (GPG) is a complete and free implementation of the [OpenPGP standard](https://www.ietf.org/rfc/rfc4880.txt) also known as Pretty Good Privacy (PGP). GPG provides the capability to securely encrypt and sign your data and communications. Both sender and receiver must have GPG installed to use.

Follow the instructions for [setting up GnuPG](./gnupg.md) to create a new GPG key pair or configure [git commit signing](../../practice-areas/engineering/git.md#commit-signing).

## Google Workspace

Documents transferred within the CivicActions.com GSuite including Gmail and Gdrive are encrypted in transit with Transport Layer Security (TLS) which provides sufficient security for our unclassified usage. Communications from within the CivicActons GSuite to other services, such as client email addresses, are not guaranteed to be secure.

## ProtonMail

[ProtonMail](https://protonmail.com/) is a free and secure email service for a single email address, with paid options supporting additional email addresses and features. Protonmail provides arguably better security than GPG-encrypted email sent via Gmail; it not only encrypts but the service does not harvest, index, or resell metadata, such as who is emailing whom and when. To obtain true end-to-end encryption, both sender and receiver must be using ProtonMail.

## Private browsing

We recommend using both of these browser add-ons that enhance privacy without encryption:

-   [Privacy Badger](https://privacybadger.org/) blocks most ads and cookie collectors. Open source and free.
-   [uBlock Origin](https://ublockorigin.com) is an ad content blocker. Open source and free.

These services will have little to no impact on your browsing experience and can go a long way to minimizing the data others collect about you.

For search, we recommend changing your browser "default search" to [DuckDuckGo](https://duckduckgo.com/) or [Ecosia](https://www.ecosia.org/) as they protect privacy and avoid the filter bubble.

For strong security and privacy, consider [Tor](https://www.torproject.org/), the [CivicActions VPN](https://git.civicactions.net/devops/internal-it-wireguard-vpn/tree/master) (for CivicActions business) or a commercial VPN (for personal use).

## Private messaging and calling

We recommend [Signal.org](https://signal.org/), which is free (and open source). We like that their primary "forward secrecy" algorithm, along with the rest of their code, is GPL licensed on [GitHub](https://github.com/signalapp/).

## More resources

-   [Protecting Your Privacy Online](https://duckduckgo.com/?q=protecting+your+privacy+online) (a DuckDuckGo search)
-   [Privacy Friendly Search](https://info.ecosia.org/privacy) and more
-   [5 Quick And Easy Ways To Encrypt Your Life Safely In Less Than An Hour](https://www.lifehack.org/562648/5-quick-and-easy-way-encrypt-your-life-safely) (includes [Tor Browser](https://www.torproject.org/projects/torbrowser.html.en) and [DuckDuckGo](https://duckduckgo.com/))
-   [The ultimate guide to privacy on Android](https://www.computerworld.com/article/3545530/ultimate-guide-to-privacy-on-android.html)
-   [16 Practical Privacy Tips for Your iPhone](https://www.nytimes.com/wirecutter/guides/iphone-privacy-tips/)
-   [Tails - the amnesic incognito live system](https://tails.boum.org/)
-   [Hardware that respects your freedom](https://ryf.fsf.org/) (Free Software Foundation)
