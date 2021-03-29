# [Tools and Practice](../README.md) / Technical Design

## Overview

This section provides some guidance
for designing new features or architectural changes.
While process may change based on project needs
(such as existing client process or team size),
these resources can provide a foundation when necessary.

Some purposes of providing a process for technical design are to:

- clarify problem statements and client value.
- guide Engineers through breaking down complex problems.
- facilitate collaboration amongst Engineers.
- share information across teams.
- empower Engineers of all levels to make and contribute to architectural decisions.

## Design Documents

Design documents help share and collaborate on technical decisions.
They become necessary when a feature or architectural change
is unclear based on individual pieces or work,
has significant unknowns,
or has long term and widespread impact.
Some examples where they are appropriate include:

- building the foundation for a new application.
- designing a set of APIs with no existing pattern.
- implementing a new authorization pattern throughout a codebase.

Designs may vary significantly based on the problem domain,
but the [provided template](./design-document-template.md)
will address many commonalities.
Using a consistent template also helps to establish a common language among the team and company.

Try to keep these broad guidelines in mind while you work:

- Always define and readdress stakeholder value.
- Discover your audience and keep them in mind while writing.
  The document may be read by:
  - Engineers directly responsible for implementation.
  - Engineers on other teams who need to be aware of decisions and changes in the codebase.
  - Clients, Product Managers, and/or Team Leads looking for a solution overview and resource considerations.
  - Security experts assessing risk.
- Foster inclusive collaboration.
  - Emphasize main points,
    but provide resources for less experienced team members
    or people removed from the subject area.
    Rely heavily on links to external documentation.
  - Consider enabling less experienced Engineers to lead design with guidance.
    Learning technical design can be a great avenue for career growth,
    and ultimately levels up people and teams.
  - Find common language.
    Domain specific language may be necessary,
    but when possible provide clarification
    or use common terms.

Note that design documents are not a substitute for early design discussions.
Ideas should be discussed before a more extensive design is applied.
Find subject experts and stakeholders early to vet proposals.

## Workflow Incorporation

Once a design document is accepted,
it becomes a resource for the Development Cycle.
The [Development Cycle Guide](../../cycle/README.md)
provides a more in depth view of how Truss iterates on work
and should be consulted for implementation.
However, a design doc can be helpful with starting that process.
It can help to:

- identify epics among the [proposed solution](./design-document-template.md#proposed-solution).
- break out small pieces of work from the [implementation section](./design-document-template.md#implementation).
- prioritize identified unknowns early on, clarifying long term work.

Note that design documents are not a go-ahead for implementation,
nor are they a substitute for agile workflow.
Priorities may change based on resources, roadmaps, or unknown constraints.
The initial design may be used as a measure for completion,
but maintain an agile approach,
readdress tradeoffs,
and be adaptable to changes during the implementation phase.

## Resources

- [6 Lessons I learned while implementing technical RFCs as a management tool](https://buriti.ca/6-lessons-i-learned-while-implementing-technical-rfcs-as-a-management-tool-34687dbf46cb)
- [Rust RFC Template](https://github.com/rust-lang/rfcs/blob/master/0000-template.md)

Template

# Title

- Contributors:
- Proposal Date:
- Feedback Accepted Until:

## Overview

In one or two sentences,
summarize what the problem is and how you intend on solving it.
It's helpful to outline the stakeholders here,
as it informs why this problem merits solving.

## Background

This section is for going into more detail about the problem.

- Who are the stakeholders and how have they been impacted?
- Historically, what effect has the problem it had?
- Is there data to illustrate the impact?
- Is there an existing solution?
  If so, why does it need to be improved on?
- Are there past projects or designs to link for context?

At least one example should be used to help the audience understand the context better.

## Proposed Solution

Detail your solution here.
Start with a broad overview and then go into detail on each portion of the design.

- What changes will the stakeholder/client see?
  This should clearly illustrate how the stakeholders' needs are being met
- How exactly does it solve the problem outlined above?
  Explain how this solution applies to the use cases identified.
- Why are you picking this solution?
- What are the limits of the proposed solution?
  At what point will the design cease to be a viable solution?
- How will you measure the success of your solution?
- If priorities shift or the solution becomes too cumbersome to implement, how will you roll back?

Visual representations of the solution can be helpful here (ex. a diagram for a request lifecycle).

## Implementation

Without going too much into individual tasks,
write an overview of what this solution's implementation would look like.

- Can this be broken down into multiple technical efforts?
- What is the tech stack involved?
- Will additional infrastructure be needed to achieve this?
- How will you test this?

## Trade-offs

- This section should go over other possible solutions,
  and why you chose yours over them.
- Was there a build vs. buy solution?
- What industry standards/practices already exist?
- Why is your solution better?

## Cross Team Dependencies

If there are multiple teams or clients that are dependencies for implementation to be successful,
list them here.
Examples of this are security or design collaboration/reviews.

## Further Reading

List any resources you found helpful to make this design.
