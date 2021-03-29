# Engineering

## Introduction

Our thoughts on what we wanted the engineering culture to be stemmed directly from this excellent material. It was a great convenience to hyperlink to the source material, which is both eloquent and in-depth. While this has served us well in the past, the corpus of excellent material has grown too large to be readily digestible for new hires. In this document, we provide a gentle summary and introduction to these pillars of the Payoff engineering culture. We hope that you have the opportunity to read through the original content over time!

## Guiding Principles

Our guiding principles exist to aid you in making engineering decisions. Each was chosen to provide the best long-term value creation for customers, the company, and of course, you the engineer. Not surprisingly, many of our guiding principles deal with maintenance, which is by far the most expensive part of the software development lifecycle.

We'll lay the foundation with two very common ideologies we subscribe to: Agile and DevOps. Unfortunately, both of these terms have been hijacked to some extent. We mean them in their original sense and to help dispel any confusion, we will duplicate the original definitions below:

Between Agile and DevOps, we have a solid foundation. It should be noted that the principles we designated as our guiding principles are not the only good ones, nor are they always going to trump other values. Context plays a big role. This was written when Payoff was making the transition to being an established startup operating in the field of personal finance. As our operating environment shifts over time, we may need to revisit which principles to put to the forefront. Additionally, there is often tension between principles, with a gradient of choices rather than simple boolean options. This is why we describe them as guiding principles. Remember that these principles are here to serve us and that they are not here to be worshipped.

Without further ado, here are some additional guiding principles (some may be dupes from Agile & DevOps):

```
Simplicity - code is harder to read and debug than to write, so save the cleverness for debugging. Build grokkable things so that others can understand the design and build upon your work.
Composability - build things that can be easily combined, re-combined in different ways, and swapped out.
Be pragmatic - accept that perfection is a goal to be strived for, but we may need to sacrifice things in order to deliver a reasonable solution.
Be compliant - we operate within a business environment w/ compliance requirements. If there's any doubt, be sure to loop in the compliance folks.
Low Coupling
High Cohesion
Optimize feedback - this is already mentioned by Agile and DevOps, but it is so important we will discuss it once again. It is the reason we strive for fast tests, for good tests, for good logging and metrics. Those are all in service of optimizing feedback.

```

## Agile

Agile is comprised of two important writings. The first is the manifesto, which is exactly what it sounds like. To put it in context, this declaration was revolutionary at the time, a rejection of the commonly held software development beliefs of the time. The second is the "12 Principles of Agile Software," which provides concrete guidelines resulting from the new value system put forth by the manifesto.
The Agile Manifesto

We are uncovering better ways of developing
software by doing it and helping others do it.
Through this work we have come to value:

Individuals and interactions over processes and tools
Working software over comprehensive documentation
Customer collaboration over contract negotiation
Responding to change over following a plan

That is, while there is value in the items on
the right, we value the items on the left more.

Take note that it mentions a relative value weighting in favor of the left, but it doesn't ignore that the items on the right also provide value. As always, take the context into account and use your discretion to make decisions.

12 Principles of Agile Software

```
Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.
Welcome changing requirements, even late in development. Agile processes harness change for the customer's competitive advantage.
Deliver working software frequently, from a couple of weeks to a couple of months, with a preference to the shorter timescale.
Business people and developers must work together daily throughout the project.
Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done.
The most efficient and effective method of conveying information to and within a development team is face-to-face conversation.
Working software is the primary measure of progress.
Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely.
Continuous attention to technical excellence and good design enhances agility.
Simplicity--the art of maximizing the amount of work not done--is essential.
The best architectures, requirements, and designs emerge from self-organizing teams.
At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behavior accordingly.

```

Various Treatises

Some thoughts on the Payoff Engineering Culture's take of various common topics that crop up.
Tradeoffs

All interesting decisions reflect tradeoffs. If a decision can be made without sacrificing anything, it should be obvious what path to take. Decisions are difficult because there are multiple goals. For feature X, how much latency can I trade off for throughput? How much investment do I make for handling exceptional cases? What level of load do I engineer for? Do I strive for simplicity in this area or that area? How do I create a balanced solution? Context matters greatly. What is a good decision now may look silly 3 months down the road when we switch to a different datacenter. A good exercise for honing your skills is to take the time to periodically revisit older projects to see what decisions were made and try to understand the context they were made it. Reflect upon whether the context has changed and if there might be a better solution available now. One part of context that should also be changing is your own understanding of the tools available to you. You will probably know much more now than 3 months ago, so it's fun to go back and look at your own decisions as you know the full context at the time those decisions were made.
