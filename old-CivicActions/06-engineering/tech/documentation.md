# [Engineering Playbook](../README.md) / Documentation

## Overview

Documentation is an important part of any project -- software and
infrastructure isn't especially useful if we cannot document how to
use and operate it.

## Contents

- [Introduction to Documentation](./intro-to-docs.md)
- [External Resources](./external-resources.md)
- [Architectural Decision Records](./adr.md)

# [Documentation](./README.md) / Introduction to Documentation

Documentation is a key part of any software project, but it's often
something that many engineers struggle with even if we recognize its
importance. Writing well is just as difficult whether it is code or
docs, and both require deliberate effort in order to hone your skills.

Documentation has a positive feedback loop -- if you have documentation
that is well-written, provides real value, and is easy to find, you're
much more likely to have people work to keep it accurate and up to date.
In contrast, if you have documentation that is inaccurate, hard to read,
and/or hard to find, then people will tend to discount the value of
documentation entirely -- so they are much less likely to treat it as a
key component of your project.

## Documentation Tips

### Make your documentation easy to find

Docs that no one knows about or can't find when they need them are
essentially docs that don't exist. If we want to encourage people to
write good docs, we need to make sure we can model good behavior. Some
specific tips for accomplishing this goal:

- **Establish strong norms (if not hard and fast rules) about where
  documentation belongs, preferably in no more than two places** (eg, a
  Git repo for technical docs and a Google Drive for design docs). If
  people have to look in too many places to find what they are looking
  for, they will eventually just give up (and it makes it more likely
  you'll have many different inconsistent documents for the same thing).
- **Make it easy to find documents in those repos without needing to play
  a guessing game with keywords** (especially since a search for something
  like "terraform" or "docker" is probably going to give you too many
  results to be useful). Provide good tables of contents (they should
  not be too long) and put related documents close to each other
  topologically.
- **Give documents descriptive, non-generic titles.** Giving a document a
  title like "Docker" or "Alerts" becomes increasingly troublesome the
  larger your project gets -- if you're using Docker for three different
  applications and local development, what does the "Docker" document
  refer to?
- **Keep in mind the specific restrictions of your repositories.** If you
  are using a wiki with a table of contents in the left margin that only
  shows ~20 characters, keep your titles as close to that limit as
  possible. If you are using a Git repo, make sure the filenames for your
  markdown documents are also descriptive.

### Make documents serve a single purpose

A document that tries to do too many things ends up doing none of them
well. If you are writing a step-by-step how-to on a specific process,
avoid going into a deep dive on the involved systems. In addition, keeping
your documentation focused will mean individual documents will be kept
shorter, which is important if you want people to be able to read them
easily and find the information they are looking for.

Consider breaking your documentation into a set of distinct categories,
and make sure the type of document is very clear in the title (so you
could title the document "Runbook: Spacecats DB Alerts," for instance).
Use an [ADR](./adr.md) to define what these types are -- such as:

- _How-tos_ are step-by-step guides to common procedures intended for
  execution under normal operation. A reader should be able to execute
  these steps safely when following the document.
- _Runbooks_ are documents intended to be used in concert with alerts
  that guide troubleshooting and mitigation responses and should include
  information on issues that users may expect with upstream and downstream
  services. A reader should be able to perform a quick diagnosis of an
  alert's underlying causes, or at least rule out any common issues, with
  the information provided in the document.
- _Topical guides_ provide a deep dive into how a specific system or
  service works, with references to ADRs that illustrate how technical
  decisions were made on the project. Readers should come away with a
  strong understanding of how the system works, as well as how to gather
  more information about the system and its state on their own.

These aren't meant to be prescriptive; define your categories in a way
that works best for your project. However, whatever you decide, the
categories should be clearly defined and focused; notice the "what the
reader should get from this document" part of the description -- if you
cannot adequately summarize what a reader is supposed to get from the
document in a single sentence, it is probably too widely scoped.

### Keep your audience in mind always

The most important thing when writing documentation is to remember that
you are writing this _for_ someone. It may be new engineers, it may
be people on-call, it may be stakeholders in the C-suite, but whoever they
are, you intend for _someone_ to be reading this at some point in the
future.

If you aren't keeping this audience in mind throughout the process of writing
your docs, then you are going to miss the mark. Writing a document intended
for new engineers and assuming a ton of knowledge will severely limit its
utility. Similarly, writing something intended for project leads and
spending pages defining common terms they're already familiar with will
probably cause them to lose patience and start to skim things over.

### Avoid going overboard with graphics or video

Often we'll be tempted to add lots of screenshots, diagrams, or other
graphics to documentation to try and make things more clear. A well-placed
graphic can help -- but too many will make the upkeep of your documentation
too difficult. It is _much_ more difficult to edit a graphic (and videos
even more so) than to edit text, so use them only when they're worth the
added cost in maintainability.

In addition, adding lots of graphics will make it harder to read the
text. If people cannot follow from one paragraph to the next (seeing them
both on the screen at the same time), this is especially difficult. If
you need to use large graphics, use thumbnails and link to the larger
version to prevent them from being too distracting. Graphics can also
make your docs less accessible, so captions and alt text are important.

### Keep individual documents short -- but not too short

There's nothing worse than trying to find the one paragraph you need from
a 20 page document. In order to avoid this, we should keep individual
documents short and focused. Generally, anything more than 4 "pages" (ie,
you would need to scroll four full screens to see the whole thing) is going
to feel "long" to most readers -- if you go over this length, be aware that
a lot of people will resist reading this documentation in a single sitting.
This might be acceptable for a thorough technical document, but it's not
great for something you're expecting people to refer to regularly.

If your document is something people are going to have to refer to in a
crisis, you should consider keeping it even shorter -- no more than two
pages. Following the other tips on this page will help you keep your
documents short and focused.

One warning -- if you link to other documents in yours to keep your
document shorter, try to avoid sending people down a Wikipedia-esque
link hole. If you can summarize the information you want people to get
from the other document in a sentence or two, you should try to do that
(in addition to providing the link for further exploration).

### Get reviews for your documentation

You wouldn't want to put code in production without a thorough code
review and testing -- you shouldn't expect people to use your documentation
before it gets a thorough review either. Some tips for reviewing docs:

- Junior members of your team are great people to have review your docs,
  since they will likely be using them the most. They _aren't_ usually the
  best people to _write_ docs though, since they have the least context
  for them.
- For step-by-step guides, try running the commands. Do they work? Is it
  safe to run them? They should _not_ use real people's usernames or
  other problems if someone just cut-and-pastes the command!
- Try reading paragraphs out loud. Does the language feel awkward or
  ambiguous?
- If you're the writer, have the reviewer tell you what they took away
  from the document -- is it what you wanted them to know? Did they come
  away with a good mental model of the system you described?

### Miscellaneous

A few other short pieces of advice you may find useful:

- If you use graphics, write the caption first, then make sure that the
  graphic represents what you want to convey.
- Lists and tables can be a good way to present information people need
  in a hurry -- they are easier to digest than paragraphs of text (but
  may not be best for nuanced information).
- Use active voice instead of passive voice whenever possible ("do this
  thing" not "this thing must be done").
- Put conditionals _before_ imperatives to prevent people from doing
  something without realizing when they shouldn't ("If not Y, do X", not
  "do X if not Y").

# [Documentation](./README.md) / Architectural Decision Records

Truss uses [architectural decision records](https://adr.github.io/) (ADRs) to
document engineering decisions. These include choices about composition of the
tech stack, using one module or library over others, infrastructure, features,
etc. "Architectural" should be interpreted broadly: any decision that could
impact a project at the architectural level is a candidate for an ADR.

ADRs are useful for recording context with decisions that may become unclear over
time, or as engineers rotate on and off the project. Therefore, the best time
to write an ADR is shortly after - or before! - making the decision it documents.

We also encourage writing ADRs when a decision is made _not_ to do something,
as these decisions are often no less significant.

## Bootstrapping

We typically use the markdown ADR format, or [mADR]. When starting a new
project or repository, review the mADR documentation and commit the most recent
[template] into source control under `/docs/adr/`.

```console
mkdir --parents docs/adr
curl -L -Ss https://raw.githubusercontent.com/adr/madr/master/template/template.md > docs/adr/0000-template.md
```

## Writing a new ADR

To begin a new ADR, check out a branch and copy the template. It is helpful to
establish an indexing scheme in advance. You can add new ADRs indexed by a
simple sequence of integers, e.g. `0001-my-new-adr.md`. In busier projects, it
may be useful to use a Unix timestamp to avoid index collisions when more than
one ADR is being drafted simultaneously:

```console
cp docs/adr/0000-template.md docs/adr/"$(date %+s)"-my-adr-title.md
```

## Changing an old ADR

In general, once an ADR is added in an "accepted" state, it should not be
changed. If the decision it documents is later reversed, publish a new ADR
explaining that decision, and change the status of the old ADR to "superseded"
as outlined in the template.

## Tools

Some command line tools are available that you may find useful for managing (m)ADRs in your project:

- [adr-log](https://adr.github.io/adr-log/): Generates a architectural decision log out of mADRs.

[template]: https://github.com/adr/madr/blob/master/template/template.md
[madr]: https://adr.github.io/madr/

## See also

- [Intro to docs](./intro-to-docs.md)

# [Documentation](./README.md) / External Resources

This is a list of articles and talks that have influenced the advice in
this section; you may find it useful to read or view these if you're
especially interested in this topic.

## Articles

- [10 Tips For Making Your Documentation Crystal Clear](https://opensource.com/life/16/11/tips-for-clear-documentation), Ben Cotton
- [A Primer on Documentation Content Strategy](https://increment.com/documentation/primer-on-documentation-content-strategy/), Stephanie Blotner
- [What to Write](https://jacobian.org/writing/what-to-write/) and [Technical Style](https://jacobian.org/writing/technical-style/), Jacob Kaplan-Moss
- [Yelp Production Engineering Documentation Style Guide](https://engineeringblog.yelp.com/2018/10/yelp-production-engineering-documentation-style-guide.html), Chastity Blackwell
- [Content debt: What it is, where to find it, and how to prevent it in the first place](https://18f.gsa.gov/2016/05/19/content-debt-what-it-is-where-to-find-it-and-how-to-prevent-it-in-the-first-place/), Melody Kramer
- [Keep Refining](https://content-guide.18f.gov/our-approach/keep-refining/), 18F

## Talks

- [The 7 Deadly Sins of Documentation](https://www.usenix.org/conference/srecon18europe/presentation/blackwell), Chastity Blackwell
- [Scalable Meatfrastructure](https://www.usenix.org/conference/lisa15/conference-program/presentation/goldfuss), Alice Goldfuss
- [Traps and Cookies: A Mystery Package From Your Former Self](https://www.usenix.org/conference/lisa16/workshop-program/presentation/reilly), Tanya Reilly
