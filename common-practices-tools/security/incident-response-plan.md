---
title: Incident response plan
---

# CivicActions Security Incident Response Plan

This Incident Response Plan (IRP) provides guidelines for managing an incident not covered by a client's incident response procedures and team. For most non-project-related incidents, see the [Security Incidents](incidents.md) page.

## Introduction

This document describes the process that the CivicActions Security Incident Response Team (SIRT) follows when responding to security incidents and other disruptions that may affect the Confidentiality, Integrity, Availability (CIA) or Privacy of system resources and data. It explains:

- roles and responsibilities during and after incidents
- overview of the steps to follow for resolution

> _During an incident, the [IRP checklist](incident-response-checklist.md) may be more useful as it contains bulleted, actionable items for the SIRT to follow._

### Security incidents may contain sensitive information

- Don't discuss the breach in public channels before containment
- Don't delete logs/evidence
- Don't publicly disclose before stakeholders are notified.

## Roles and Responsibilities

Individual and team roles are described below.

### Reporter

The person or non-human identity (NHI) that first observes what may be an incident and reports the issue to the SIRT. The primary responsibility of the _Reporter_ is to ensure that a _Responder_ acknowledges receipt of the report.

Generally, raising the issue on the [#loving-security](https://civicactions.slack.com/messages/loving-security/) Slack channel will work. Use `@security` to trigger a Slack notification for the Security team.

_Responders_ should acknowledge within 15 minutes.

### Responder

A _Responder_ is generally a member of the CivicActions SIRT who investigates and remediates an event or incident.

- Initially, the first _Responder_ is also the _Incident Commander_ (IC).
- For the first 15-30 minutes, the first _Responder_ may work alone. If needed, they begin forming the _Incident Response Team_. See [Initiate](#3-initiate-the-response).

#### Incident Response Team

During incident response, _Responders_ do the following:

- Assume primary responsibility for the [Assess](#4-assess-the-incident) and [Remediate](#5-remediate) steps.
- Document in real time the measurements, theories, and steps taken using a shared medium like Slack or a Google doc.
- Designate an _Incident Commander_ (IC), if the incident might require more than 15-30 minutes to resolve, and do an [explicit handoff](#explicit-handoff-ceremony).

### Incident Commander

The _Incident Commander_ (IC) ideally remains uninvolved in remediation efforts, and performs three major duties:

1. _Security Incident Response Team (SIRT)_ creation and management, ensuring that it:

    - Includes team members who are capable of containing, investigating, and remediating the incident.
    - Remains focused on resolving the incident.
    - Uses the most appropriate media/communication channels for recording actions. During business hours, _Incident Commander_ (IC) may create a dedicated Slack channel (for example, `#fire-team`) for SIRT communications.
    - Defines and enforces work shifts if the incident lasts longer than 3 hours.

1. Documentation, including all actions taken during investigation and remediation, using the following methods:

    - Designated Slack or other communications channel
    - Project JIRA ticket or Gitlab issue (if applicable)

1. Communication, ensuring that internal and external entities stay informed. For communication duties, the _Incident Commander_ (IC) may designate a _Communications Officer_ (CO) and do an [explicit handoff](#explicit-handoff-ceremony) for those duties.

### Communications Officer

The _Communications Officer_ (CO) manages external communications with:

- Management, developers, users, and anyone affected by the incident
- Client stakeholders (if applicable)
- Additional Project team members and/or the Product Owner (if applicable)
- CivicActions Legal team, providing support if escalation is required to law enforcement or US-CERT

## Communication channels

The _Incident Commander_ (IC) or the _Communications Officer_ (if one exists) determines the most appropriate communication channels during incident response. Any of the following may be used:

- Slack channel [`#loving-security`](https://civicactions.slack.com/messages/loving-security/) or a dedicated Slack channel (for example, `#fire-team`).
- A JIRA ticket or Github/Gitlab issue for the incident (if applicable) will be the final location for all incident reporting, with links to other documents as needed.
- Video conference: Zoom, Slack Huddle, Google Meet, etc. (Be sure to record the call for documentation purposes.)
- Email to [security@civicactions.com](mailto:security@civicactions.com).

## Severity at a glance

Severity determines response speed, disruption authority, and sitrep frequency. Assess quickly — it can change as the incident evolves.

| Severity                       | Criteria (brief)                                                                | Response timing       | Disruption authority                         | Sitrep frequency |
| ------------------------------ | ------------------------------------------------------------------------------- | --------------------- | -------------------------------------------- | ---------------- |
| **[High](#high-severity)**     | SPII/CUI breach, large-scale availability impact, or significant financial harm | Immediate, continuous | SIRT acts without permission                 | Hourly or more   |
| **[Medium](#medium-severity)** | PII/FCI risk, targeted attacks, or limited service degradation                  | Business hours        | Consult leads; act after 1 hr if unreachable | Twice daily      |
| **[Low](#low-severity)**       | No customer impact; restricted to non-critical systems                          | Business hours        | Mutually agreed with leads                   | Daily            |

See [Incident severities](#incident-severities) for full criteria, examples, and contingency plan guidance.

## Incident response process

There are six major processes of incident response, detailed below:

- [1. _Breathe_](#1-breathe)
- [2. Start documenting](#2-start-documenting)
- [3. Initiate the response](#3-initiate-the-response)
- [4. Assess the incident](#4-assess-the-incident)
- [5. Remediate](#5-remediate)
- [6. Conclude the incident](#6-conclude-the-incident)

### 1. _Breathe_

No one's life is in danger.

### 2. Start documenting

Begin documenting all steps and findings. Documentation makes handoffs and _Responder_ onboarding easier. A thread in the Slack channel [#loving-security](https://civicactions.slack.com/messages/loving-security/) is recommended because it is widely accessible, but other [communication channels](#communication-channels) may be used.

### 3. Initiate the response

At this stage, the first _Responder_ is usually working alone, and as such is also serving as the _Incident Commander_ (IC).

Allocate 5 minutes and determine whether this event is a potential incident or false alarm. Consider any potential Project impact.

An incident begins when someone becomes aware of a disruption in expected normal system operations. An incident is defined broadly, following [_NIST SP 800-61: Computer Security Incident Handling Guide_](https://csrc.nist.gov/publications/detail/sp/800-61/rev-2/final), as "a violation or imminent threat of violation of computer security policies, acceptable use policies, or standard security practices". This definition encompasses any scenario that might threaten the security of system resources and data. For more information, see the CivicActions guidebook: [What is an incident?](incidents.md#what-is-an-incident)

#### Potential incident

- Issue a broadcast notification via the designated [communication channel](#communication-channels).

    - An example message follows. The format is not important, but the information fields are useful.

```markdown
**Description**: [Short description of the event and its impact]
**Status**: investigating
**Severity**: unknown
**Incident Reporter**: [name of the person who reported the issue]
**Incident Commander**: [your name]
**Responders**: [names of other _Responders_]
**Details**: [Extra details about the event]
```

- Observe the following guidelines for communications:

    - During this stage of incident response, the event status is "investigating".
    - An unconfirmed issue is called an _event_. A confirmed issue is called an _incident_.

- For an incident requiring more than 30 minutes to resolve:

    - Recruit additional _Responders_. Use `@security` to trigger a Slack notification for the Security team.
    - Be sure to designate an [Incident Commander (IC)](#incident-commander) and [hand off the IC duties](#explicit-handoff-ceremony).

- Use the [Explicit Handoff Ceremony](#explicit-handoff-ceremony) when transferring/changing roles.

#### False alarm

- Proceed to [_6. Conclude the incident_](#6-conclude-the-incident).

### 4. Assess the incident

#### Confirm the incident

- Gather information, and document your findings.

    - Is there suspected evidence of malware or a malicious actor?
    - Was the event triggered by an [external dependency](contingency-plan.md#external-dependencies)?
    - Is a system failure causing the disruption?

- If a false alarm, proceed to [_6. Conclude the incident_](#6-conclude-the-incident).

#### Assess the severity

- Does it affect system or data Confidentiality, Integrity, Availability and/or Privacy?
- Use the [rubric for determining severity](#incident-severities). Project incidents are generally "LOW severity".
- Note that severity can change over the lifespan of an incident, and it is acceptable for the SIRT to assess the initial severity quickly.
- If HIGH severity or a projected need for Disaster Recovery, consider activation of the [Contingency Plan](contingency-plan.md).

> The SIRT should record all actions and observations in an appropriate [communication channel](#communication-channels).

#### Communication responsibilities during assessment

- Post an initial situation report (_sitrep_), in the appropriate [communication channels](#communication-channels) as specified by the _Incident Commander_ (IC) (or _Communications Officer_ (CO)).
    - Here is an example _sitrep_:

```markdown
**Subject**: [sitrep] Chickens are escaping
**Severity**: LOW
**Incident Commander**: Farmer Jane
**Responders**: Spot the Dog, Farmer Dave
**Description**: We've confirmed reports of escaped chickens. Looks like a fox may have tunneled into the run. Dave is working to fix the fence. Spot is tracking the fox.
```

- For an issue with potential Project impact, ensure that a ticket/issue has been created and the Project Manager informed.

### 5. Remediate

Remediation is about resolving the issues caused by an incident. Remediation will be situation-specific, and timelines vary based on the assessed severity.

#### Containment and evidence preservation

If suspicious activity is suspected or other unanswered questions exist, do the following before making any changes:

- Make snapshots of relevant volumes and data.
- Preserve logs.
- Take screen captures of anomalous activity that can be used in post-remediation forensic analysis.
- Consider implementing a containment strategy. For example, reconfigure firewall rules for the affected instance to drop all ingress and egress traffic, except from specific IPs like your own, until forensics can be performed.

#### Remediation and service disruption

Remediation may require service disruption. If it does, the SIRT should proceed in a different way depending on the assessed [severity](#incident-severities).

#### SIRT responsibilities during remediation

- Determine the cause, implement a resolution, and return the system to normal operations. Make every attempt to identify the cause; this can prevent incident recurrence.
- Maintain a list of informational leads from the incident — actionable information about any security breaches, stolen data, etc.
- Develop a list of remediation steps. These can be tracked as checklists in Slack, shared Google Docs files, a JIRA ticket, Gitlab issue or another [communication channel](#communication-channels).

#### Long term planning

Remediation takes time. If the issue progresses for more than 3 hours without being resolved, the _Incident Commander_ (IC) should plan for a long remediation. This means:

- Determine whether remediation efforts will occur during business hours only or be continuous. This depends on the severity of the issue, and whether breaches are ongoing.
- For a continuous response, plan shifts.

#### Incident Commander responsibilities during remediation

At a high level, the _Incident Commander_ (IC) tracks remediation actions, ensures they are assigned and followed, and verifies them when they are completed.

The _Incident Commander_ (IC) must distinguish between immediate concerns, which need to be completed before the incident is considered resolved, and long-term improvements/hardening, which can be deferred to the Retrospective.

The _Incident Commander_ (IC) does the following:

- Maintains current information in the designated [communication channel](#communication-channels). Be sure to include:
    - SIRT members and their roles, and/or Project team leads and members (if applicable)
    - Remediation items and their assignees
- Establishes and documents work shifts for an incident longer than 3 hours.
- Maintains communications with stakeholders, or designates a _Communications Officer_ (CO) via [explicit handoff](#explicit-handoff-ceremony).
- Focuses on coordination, communication, and information collection -- not remediation.

#### Communications during remediation

The _Incident Commander_ (IC) or _Communications Officer_ (CO):

- Coordinates with the CivicActions managers to apprise them of the situation.
- Coordinates with the Project Product Owner (PO), if applicable, to notify affected customers.
- Ensures that the SIRT is recording all actions in the designated [communication channels](#communication-channels).
- Shares _sitreps_ on a regular basis in Slack, in the ticket/issue (if applicable), and with stakeholders. See the section on [incident severities](#incident-severities) for suggested time intervals based on severity level.

### 6. Conclude the incident

#### Closing the ticket

When the incident is no longer active, for example, the breach has been contained, the issue has been fixed, etc., the _Incident Commander_ (IC) should conclude the incident. There might be longer term remediation required, and possibly more investigation, but when the incident is no longer active, these activities can proceed at the regular pace of business.

To conclude an incident, the _Incident Commander_ (IC) should:

- Set the status of the ticket/issue to **Ready for Review**.
- Send a final _sitrep_ to stakeholders, including CivicActions managers and the Security team.
- Thank everyone involved for their service.

#### Regulatory/user notification obligations

- Consider external notification requirements (e.g., GDPR 72-hour rule, state breach notification laws) that may be triggered by certain incident types.

#### Conducting a retrospective

An _Incident Commander_ (IC), or another designated party such as the _Communications Officer_ (CO), should lead a retrospective and develop an incident report.

#### Developing the incident report

The incident report should contain:

- a timeline of the incident
- details about how the incident progressed
- information about the vulnerabilities that led to the incident, also called a _cause analysis_ (The _cause analysis_ is an important part of the incident report. Tools such as [Infinite Hows](https://www.kitchensoap.com/2014/11/14/the-infinite-hows-or-the-dangers-of-the-five-whys/) and [Five Whys](https://en.wikipedia.org/wiki/5_Whys) can help the SIRT explore potential causes, prevention, and improved incident response.)

Additionally, the incident report should include basic response metrics:

- **Discovery method**: How did the SIRT become aware of the issue?
- **Time to discovery**: How much time passed from the time the incident became active until someone became aware of it?
- **Time to containment**: How much time passed from the time someone became aware of the incident until the incident was contained?
- **Threat actions**: What actions were taken by the actor? For example, phishing, password attacks, etc.

The incident report should be posted in Slack, or in the ticket/issue as a final comment before the ticket is closed.

## Incident severities

Severity dictates response speed, acceptable service disruption, and communication frequency. Severity can change over the lifespan of an incident, and the SIRT should assess the initial severity quickly.

### High severity

- **Criteria:** Compromises Sensitive Personally Identifiable Information (SPII), impacts availability for a large number of customers, or has a significant financial impact.
- **Examples:** Confirmed Sensitive Personally Identifiable Information (SPII) or Controlled Unclassified Information (CUI) breach, root-level production compromise, severe Denial of Service (DoS) outages, **developer system/supply-chain attacks** (e.g., the Shai-Hulud worm), and **AI agents breaking out of sandboxed environments**.
- **Response Guidelines:** Take action immediately to contain the issue, even if it requires complete service degradation. The CivicActions SIRT (or Project SIRT) does not need permission to act. Remediation is continuous.
- **Communication:** Share sitreps hourly (or more frequently).

### Medium severity

- **Criteria:** Poses a potential risk to "Rolodex" Personally Identifiable Information (PII) or Federal Contract Information (FCI), involves targeted attacks, or causes limited service degradation.
- **Examples:** Suspected PII breach, targeted but unsuccessful attempts to compromise production, spam/phishing targeting staff, or DoS attacks with limited degradation.
- **Response Guidelines:** Respond during SIRT business hours. Consult Project leads (via Slack or phone) to weigh disruption vs. security. Bias toward disruption—if leads cannot be reached within an hour, the SIRT may take action.
- **Communication:** Share sitreps twice daily.

### Low severity

- **Criteria:** No noticeable customer impact, or restricted to non-critical systems. *(Note: General project-level incidents default to Low severity).*
- **Examples:** Attempted compromise of staging/testing instances, or DoS attacks with no noticeable impact.
- **Response Guidelines:** Respond during business hours. Consult SIRT members and notify Project leads. Do not take action or cause service degradation until a mutually-agreed course of action is determined.
- **Communication:** Share sitreps daily.

## Explicit Handoff Ceremony

To transfer _Incident Commander_ (IC), _Communications Officer_ (CO), or _Responder_ duties:

1. Outgoing ROLE initiates the handoff and briefs the incoming ROLE on the situation.
1. Incoming ROLE confirms the handoff and assumes responsibility.
1. Incoming ROLE documents the handoff in Slack or the JIRA ticket/Gitlab issue.
1. Incoming ROLE shares a _sitrep_, which notes the handoff.
1. Outgoing ROLE remains available for 15-20 minutes to ensure a smooth handoff and then logs off.
