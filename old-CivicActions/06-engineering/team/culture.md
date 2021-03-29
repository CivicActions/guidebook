# [Tools and Practice](../README.md) / Growth

## Overview

When working on a project, it's important to allow time for career
growth. Folks will have different levels of experience and will need
to explore areas that are not directly related to completing project
work.

The experience at Truss is that this exploration winds up benefiting
the client in the long run, both through immediate impact (e.g.
speeding up tests) and the client getting the benefit of learning that
happened elsewhere. Allowing time for growth ensures consistent, high
quality work which benefits everyone.

Mentoring is an important part of growth. Truss has [shared some
techniques for
mentoring](https://truss.works/blog/2016/8/12/theres-a-method-to-the-mentoring-advice-from-a-teacher-turned-developer).

To ensure that growth happens, the time should be built into the
estimate for a ticket. From time to time, it will be appropriate to
restrict exploration and "just get the ticket done", but that should
happen infrequently.

If someone is interested in a topic that is not related to their
client work, a separate plan will need to be made. That might involve
changing client teams, changing client projects, or joining Truss
Reserve.

## Mental Traps to Avoid

Engineering is done by humans and is mostly brain work, so we will start by addressing a pair of opposing but related mental biases: the Dunning-Kruger Effect and Imposter Syndrome. To quote wikipedia, the Dunning-Kruger Effect is a cognitive bias wherein relatively unskilled individuals suffer from illusory superiority. Imposter Syndrome, on the other hand, is the condition where an person feels that their success is undeserved and that they are less capable than their peers. There is a fear that they will be discovered to be frauds, masquerading as skilled engineers. Studies have shown that engineers commonly suffer from these biases, sometimes schizophrenically bouncing between the two throughout their career. Those in the middle of the Dreyfus Model are especially susceptible. Hopefully by shining a light on the topic, you will be able to catch yourself if these biases start to creep up. As a software engineer, you must accept that you are competent and capable, but at the same there is much you do not know and need to learn. Who knew engineering was so zen?

## T-Shaped Engineers

Here at Payoff, we want you to be able to make informed decisions across our entire system. To handle this great responsibility, you will need to invest in yourself and continue to grow. There is far too much to know, even in a modest company of our scale. Some years ago, the notion of the full stack engineer gained popularity. This mythical unicorn of an engineer was well-versed in every facet of the solution, from the deepest ops plumbing to the shiniest UI. Let us dispel the myth that this is an attainable, let alone, desirable goal. It would take a lifeline of intensive Batman-like training to become such a ninja/rockstar/guru and we'd rather our engineers have time to spend with their family and pursuits outside of work. :)

The ideal to aim for at Payoff is the T-Shaped engineer. This T refers to a vertical line of deep knowledge in one or a few areas, and a horizontal line representing a shallow but sufficient level of knowledge across a broad spectrum. The archetypical example would be the front-end Angular & Javascript expert who knows enough to be able to track a bug down to the database or application code level. Expert knowledge is essentially uncapped, especially in a field like software engineering where things change so quickly. Malcolm Gladwell has popularized the theory that it takes 10,000 hours of dedicated practice to become an expert and that should tell you that becoming an expert will take a lot of grit and dedication. This is something you do over the course of a career and as I said, our knowledge is constantly being eroded by advances in the field, so don't fret if you feel like you're not an expert in anything. As the proverb goes, "It is a journey, not a destination." Plus you are already more of an expert than you realize in your area of focus.

The acquisition of broad knowledge seems daunting at first. If becoming an expert takes 10,000 hours, then learning even a half dozen areas at 25% level would take years of dedicated study. Luckily, there is research showing that it can take as little as 20 hours to gain proficiency on a topic. The goal is to understand the key concepts and foundational core, to learn the boundaries of your knowledge and map out what you know and what you don't know, and be able to communicate with experts on the topic. We strive to keep a diverse workforce at Payoff, staffed with a variety of experts, and we encourage you to both ask for help and share your knowledge. Likewise, the Internet and social media have made it easier to connect with experts outside the company. We encourage you to participate with user groups, forums, Twitter, etc. and be a part of the wider community. Perhaps the best thing about learning a new topic is that it's so much fun!

Complexity

Engineering is all about fighting complexity. There are two types of complexity: essential and accidental/incidental. We always want to reduce complexity, especially complexity of the accidental/incidental kind. When possible, seek to eliminate these complexities. Essential complexity will likely continue to grow over time. This is a good thing because it means that we have shouldered the burden of the complexity for our customers. Essential complexity represents that complexity which cannot be avoided in order to provide features and deliver value. Accidental or incidental complexity is complexity that worms its way into the design. Oftentimes we mistake it for the essential and it takes a keen eye to spot accidental complexity and root it out. Here at Payoff, the greatest accomplishment is to reduce the complexity. As such, we celebrate days when we can reduce the number of lines of code.

Constraints

Embrace constraints. They are the muses for the best engineering solutions. Constraints inspire and bring out the best. There will always be constraints. If nothing else, time is the ultimate constraint.

Models

Models are necessarily incomplete. What we choose to omit is even more important than what we include. Simple models aid understanding. Complex models detract from understanding and more brittle to changes. Detail only the concepts you wish to convey, that will contribute most to the high level understanding of the topic. Leave the details where they belong, at a lower level - i.e. tests, code, API docs, etc.

Information Overload

Be wary of information overload, both on the receiving end and on the transmitting end. Consider whether it is even worth it before sending or consuming information. Along the same lines, strive for the minimum cost medium that is appropriate. Different mediums are vary along the spectrums of urgency, lifetime, information density, and discoverability. Be sure to take the receiving party into account. They may be busy, asleep, on PTO, etc. An IM might be best for highly urgent message, whereas an email might be better low interruption audit trail and a wiki would be more ideal to collect long-lived, high-density information that can be discovered later by new hires.

Strategies/Tactics

While not principles, we have found value in these ideas, which we will group in strategies and tactics. They differ mostly in scope and lifetime. Tactics will apply to a narrow scope and typically change more often. For example, a tactics page might summarize what our current best practices are for Ruby or perhaps even more narrowly Date/Times in Ruby. Strategies are meant to be broader, such as OOP design principles. It can be useful to think of these as a hierarchy, with guiding principles at the top and tactics at the bottom.

Strategies and tactics reside in a multitude of wiki pages outside of this document. Unlike our guiding principles, they are subject to more frequent change and apply to more limited scopes. Tactics will change often and strategies periodically. Guiding principles should rarely change and only after much informed discussion. As you well know, exceptions make the rule. Likewise, exceptions to tactics will be much more common, whereas an exception to a strategy should be treated with a larger dose of skepticism. The curation of strategies and tactics is best left to the folks working in that scope. As these pages are written, we will update the links to these strategies and tactics.
Strategies

Mostly just Ruby strategies right now: Strategies

Tactics

Here be tactics: Tactics
Don't Be Scared of Asking Questions

We have tremendous faith in you. All the tools are here. If you get stuck, don't be afraid to ask questions. We all went through the learning process and enjoy when we are able to share our knowledge. It also benefits the folks providing the answers, as we often learn more when we teach others. It forces us to distill and focus the knowledge when we explain it to someone new to the topic. Asking questions can also help us discover holes in our on-boarding or documentation. It could even be that something is wrong now because the context has changed and we hadn't re-examined our prior decisions. So please, please ask questions!

Cheat Sheet

Be pragmatic. Use your discretion. Look at the problem from different angles (good rules of thumb: exercise empathy and put yourself into the shoes of other stakeholders, approach a problem from top-down and bottom-up, look to see how we solved similar problems, look at how others solved them, reflect on the good and bad and what can we improve, what can we live with, use the 80/20 rule, bounce solutions off your coworkers or through HipChat) You will make mistakes. You will get things wrong. Context will shift. Bits will rot. Documentation will be wrong almost as soon as you write it. Forge on nevertheless! Do the your utmost and strive to be better each time. Each day learn something new. You will be surprised at seemingly simple things that used to trip you up. At the same time, new nuances and problems will arise and keep you on your toes. It's a never-ending endeavor but a worthwhile one. It's easy to underestimate what you can accomplish in the long term. One day, you will look back in amazement at all that you've accomplished here. As they say, there's nothing like the satisfaction of a job well done. Or at least done. :)

Happiness

Happiness comes from mastery, autonomy, and purpose! We want you to be happy, so if there's something we can do better to promote those three aspects of happiness, please let us know!

Parting Message

Our success or failure as a company depends on you. As an engineer, you are hands-on building things that deliver value to the customer. During the course of each day, you will be constantly making decisions. Some will be major, most will not. It can be a simple as the name of a variable or as difficult as deciding that the entire UX needs to be reworked. Since you are the one closest to the problem, you already have a lot of the necessary context. Hopefully knowing our engineering values and culture will help fill in the rest of the context. For those of us who are not the boots on the ground, like your erstwhile author, our job is to assist you, provide you with the resources you need to succeed, whatever they may be, and to remove the roadblocks and distractions.

Don't forget to have fun! We're not about working ourselves into an early grave or burning out in a blaze of glory. Changing the world is a marathon, not a sprint. We pride ourselves on being pragmatic and let me tell you, burning out is not very pragmatic. We want you to learn, have fun, and get better by building things. We care about getting things done well and delivering value. Luckily this turns out to be in perfect alignment with deep and continual investment in our engineers, namely you! Software is a field that seems to expand at an accelerating pace and if you ever want to get ahead of that curve, you'll need to keep learning. Remember that investing in yourself is like any other good investment - it compounds over time, it's easy if you make it a habit, and you'll be surprised just how far you can get over the long run.

We haven't talked much about the nature of the employer-employee relationship. Some of you will be old enough to lived through the shift from life-long employment to the free agent nation and gig economy. There's an excellent book by Reid Hoffman called "The Alliance" that is alignment with our thoughts on the matter. The following quote is a good summary: "[Employees] basically promise to help transform the company while they’re here in a specific way, with the expectation that the company in return commits to invest in them during that time." So whether you're here for a year or a life-long career, we hope that we can help you grow and you can help us be the best Payoff possible!
Bonus Tolkien Quote For the Road!dr
