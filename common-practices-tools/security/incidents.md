---
title: Security incidents
---

# Security Incidents

Something went "bump" in the night (or the day)? This document explains what to do when you need to report a potential security incident.

Please remember:

- If you see something, say something - when in doubt, report it. The security team decides if it's an actual incident.
- You are not in trouble when you report a security incident.
- _We are all part of the Security team at CivicActions._

## What is an incident?

An incident is any actual or potential threat to the Confidentiality, Integrity, or Availability (CIA) of CivicActions or client systems and data.

| Pillar | Means | Examples |
|---|---|---|
| **Confidentiality** | Secrets are exposed | PII leak, shared passwords, elevated unknown user on a site, public Google doc that should be private |
| **Integrity** | Data or systems are altered unexpectedly | Deleted backups, defaced web page, missing logs, unauthorized code change |
| **Availability** | A production service is unexpectedly down or degraded | App outage, pages failing to update, service running significantly slower than expected |

Not every incident is security-related; some are operational (a full disk, a crashed service). We call them security incidents because they _might_ be, and we'd rather find out.

## Reporting an incident

Time is critical - the SIRT will initiate the [Incident Response Plan](incident-response-plan.md) if needed.

### What not to do

- Don't try to fix it yourself before reporting
- Don't delete logs, files, or running instances
- Don't discuss it in public channels before the SIRT acknowledges

### How to report

1. **Post in [`#loving-security`](https://civicactions.slack.com/messages/loving-security/)** using `@security` to notify the SIRT. Include:
   - What you observed and when
   - What systems or data may be affected
   - What actions you've already taken (if any)

2. **Wait for acknowledgment** - a Responder should reply within 15 minutes. If the issue seems serious, stay available until someone confirms they've picked it up.

3. **No response after 15 minutes?** Email [security@civicactions.com](mailto:security@civicactions.com) with _Security Incident_ in the subject line.

4. **Project-specific incident?** Also post in your project Slack channel with `@security` so your Project Manager is looped in.

After reporting, **follow the Responder's lead** - they may ask you to preserve evidence, provide more detail, or to stand by.

## Some common incident types

### Phishing, vishing, and smishing

Phishing arrives as email; **vishing** as a phone call or voicemail; **smishing** as a text message. All use the same playbook: create urgency, impersonate someone trusted, and get you to click, call back, share credentials, or transfer money.

AI has made **spear phishing** - highly personalized attacks that use your name, role, or recent activity - fast and cheap to produce at scale. A message that feels personal and plausible is no longer evidence that it's legitimate.

The rule is the same regardless of channel: opening or reading is safe; acting on it is where the risk lies.

- **You clicked a link, opened an attachment, or entered data?** [Report it as a security incident](#reporting-an-incident) immediately, even if nothing seems wrong. Many compromises are silent.
- **You received a suspicious email but didn't act on it?** Use [Report phishing in Gmail](https://support.google.com/mail/answer/8253?hl=en#zippy=%2Cuse-gmail-to-help-you-identify-phishing-emails%2Creport-a-phishing-email) (three-dot menu on the message). This warns other users and alerts CivicActions admins. If you're on mobile or a mail client, forward to [security@civicactions.com](mailto:security@civicactions.com).
- **Suspicious email in your Spam folder?** Ignore it - it's already been flagged.

CivicActions runs periodic simulated phishing exercises. Repeated high-risk behavior in these exercises may result in required security awareness training.
