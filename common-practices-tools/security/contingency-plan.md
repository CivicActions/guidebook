---
title: Contingency plan
---

# CivicActions Common Contingency Plan

## Applicability

**Note:** This Contingency Plan applies only to systems for which CivicActions has negotiated and defined Incident Response/Contingency Plan (IRCP) operations. Each IRCP-managed system will have a specific, tailored version of this Contingency Plan or in some cases a completely unique Contingency Plan will be developed. All CivicActions employees are aware of the procedures outlined herein.

## Overview

This Contingency Plan provides baseline guidance for the CivicActions Security Incident Response Team (SIRT) when managing the disruption, compromise, or failure of any component of a CivicActions IRCP managed system, product or service ("system"). As a general guideline, we consider "disruption" to mean unexpected downtime or significantly reduced service lasting longer than:

- 30 minutes 0900 - 2100 Eastern Time Monday through Friday (standard U.S. business hours)
- 90 minutes at other times

Scenarios where that could happen include unexpected downtime of key services, system data loss, or improper privilege escalation. In the case of a security incident, the team uses the [Security Incident Response Plan](incident-response-plan.md) as well.

Some clients will create and maintain a Contingency Plan defining procedures specific to their system. In such a case, the client-specific Contingency Plan takes precedence.

## Recovery objective

More than 3 hours of any system being offline during standard U.S. business hours (0900 - 2100 Eastern Time) is considered unacceptable. Our objective is to recover from any significant problem (disruption, compromise, or failure) within that span of time.

## Contingency plan outline

### Activation and notification

The [Incident Response Plan](incident-response-plan.md) is activated first when a disruption
is reported. During the Assessment phase, if HIGH severity or a projected need for Disaster
Recovery is identified, the Incident Commander (IC) activates this Contingency Plan and
notifies the people authorized to make system-level recovery decisions:

- From CivicActions: Project Manager, SIRT members assigned to the incident
- From the customer: Product Owner, and users if service is degraded

### Recovery

The SIRT works to restore the system following the [assessment](incident-response-plan.md#4-assess-the-incident)
and [remediation](incident-response-plan.md#5-remediate) processes in the IRP. In addition, the SIRT should:

- Identify the root cause and scope of the disruption before restoring service.
- Restore from the most recent known-good backup or snapshot if data integrity is in doubt.
- Confirm the restoration target's integrity before promotion to production.
- If an external dependency is involved, consult the [external dependencies](#external-dependencies) section for fallback options and monitor the dependency's status page for recovery.
- Document all recovery actions taken, including timestamps, in the designated [communication channel](incident-response-plan.md#communication-channels).
- Obtain Authorizing Official approval before re-deploying to a new region or environment.

### Reconstitution

Before declaring the system operational, the SIRT should verify:

- [ ] Core application functions respond as expected (smoke test or runbook verification).
- [ ] Data integrity is confirmed — no missing, corrupted, or inconsistent records.
- [ ] Authentication and access controls are functioning correctly.
- [ ] Monitoring and alerting are active and reporting normally.
- [ ] No indicators of compromise remain.

Once verification passes, the Incident Commander:

1. Declares recovery complete and lifts any access restrictions imposed during containment.
1. Notifies the Product Owner, CivicActions managers, and affected users that service is restored.
1. Schedules a retrospective following the [security incident retrospective process](incident-response-plan.md#conducting-a-retrospective)..

## External dependencies

CivicActions managed systems often depend on several external services. In the event one or more of these services has a long-term disruption, the SIRT will mitigate impact by following this plan. Zero or more of the following services may be involved:

### GitHub

- **Service:** <https://github.com>
- **Status:** <https://www.githubstatus.com/>

If GitHub becomes unavailable, systems will continue to operate in its current state. The
disruption would only impact the team's ability to update code on the instances.

### GitLab

- **Service:** <https://git.civicactions.net/>
- **Status:** <https://app.statuscake.com/UptimeStatus.php?tid=1702974>

If GitLab becomes unavailable, systems will continue to operate in their current state. The disruption would impact the team's ability to update code on the instances, which could have significant impact.

### StatusCake

- **Service:** <https://status.statuscake.com/>

If there is a disruption in the StatusCake service, the SIRT will be notified by email.

### OpsGenie

- **Service:** <https://app.opsgenie.com/alert/>
- **Status:** <https://status.opsgenie.com/>

If there is a disruption in the OpsGenie service, all alerts automatically get delivered to the SIRT via email.

### Slack

- **Service:** <https://civicactions.slack.com/>
- **Status:** <https://status.slack.com/>

There is no direct impact to the platform if a disruption occurs, thugh 90% of CivicActons communications are via Slack.
Primary incident communications will move to Zoom or Google Meet.

### Zoom

- **Service:** <https://civicactions.zoom.us/>
- **Status:** <https://www.zoomstatus.com/>

There is no direct impact to the platform if a disruption occurs.

### Google Workspace

- **Service:** <https://admin.google.com/?dn=civicactions.com>
- **Status:** <https://www.google.com/appsstatus/dashboard/>

CivicActions depends upon Google Workspace.

### AWS

- **Service:** <https://signin.aws.amazon.com/console>
- **Portal:** <https://civicactions.awsapps.com/start/#/?tab=accounts>
- **Status:** <https://health.aws.amazon.com/health/status>

In case of a **significant** disruption, after receiving required client approval, the CivicActions SIRT will deploy a new instance of the entire system to a [different region](https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1).

## How this document works

This plan is most effective if all CivicActions team members know about it, remember that it exists, have the ongoing opportunity to give input based on their expertise, and keep it up to date.

- The CivicActions team is responsible for maintaining this document and updating it as needed. Any change to it must be approved and peer reviewed by at least another member of the team.
    - All changes to the plan should be communicated to the rest of the team.
    - At least once a year, and after major changes to our systems, we review and update the plan.
- How we protect this plan from unauthorized modification:
    - This plan is stored in the CivicActions Guidebook GitHub repository (<https://github.com/CivicActions/guidebook/tree/master/common-practices-tools/security/>) with authorization to modify it limited to SIRT members by GitHub access controls. CivicActions policy is that changes are proposed by making a pull request and ask another team member to review and merge the pull request.
