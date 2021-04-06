# Tech

## Open Source

### Default To Open

We strongly encourage working in the open. We believe that in, principle, software, especially that software powering public services, should be available to all. We also believe contributing back to the open source community that we benefit from is the right thing to do. Finally, we believe that the process of developing open source software exercises good practices that pay dividends in our work. These benefits include early identification and elimination of defects, cost savings through outside involvement, reusability, and easing client collaboration and handoffs.

### Exceptions

As with everything, there are always going to be certain exceptions that just don't fit the model of working in the open. This should be rare, but take this into consideration before opening up your repo to the general public.

- Data published contains sensitive information.
- We do not have the rights to reproduce or publish the item on our own.
- Publishing is restricted by law or other regulations, such as the Export Administration Regulations.

## Accessibility

We implement Section 508 standards and WCAG compliant websites so that people with all types of disabilities, whether it be physical, mental, or visual impairment, have access to our sites.

### How we do this

- We use base themes which strive to meet the W3C's WCAG 2.0 AA Success Criteria or above. This will help satisfy the requirements of the ADA.
- We implement good SEO structures (which are generally good for accessibility).
- We implement responsive design strategies that can present complex data in hierarchical structures, capable of being navigated by audio cues.
- We believe that users should be able to personalize how content is presented. We strive to allow users to change color schemes and text size displays allow them to have a better user experience.
- We test sites using a combination of automated and manual testing.
- We use good practices in using semantic markup in page templates and report design to define content hierarchy (e.g. primary head is h1, secondary head is h2, etc.).

### When we do this

- We strive to produce work that is accessible to people of all abilities, regardless of client. However, we recognize that the level of accessibility compliance and prioritization can be influenced by budgetary and contractual implications.
- We aim to do accessibility work continuously, as part of our agile process. Accessibility scans should be performed on a per-ticket basis and signed off on before work is considered complete.
- Accessibility should NOT BE left until the end of a project, but baked in throughout its lifespan.

### General Accessibility Guidelines

- Form elements are built with meaningful labels and form buttons include descriptive values.
- Images should have meaningful alternative text ("alt tags") by default. We recommend making alt tags mandatory for content editors.
- Decorative images or images with no content use should either have a null alt tag (alt="") or rendered as CSS background images.
- Color should not be used as the sole method of conveying content or distinguishing visual elements.
- Color alone is not used to distinguish links from surrounding text unless the luminance contrast between the link and the surrounding text is at least 3:1 and an additional differentiation (e.g., it becomes underlined) is provided when the link is hovered over or receives focus.
- The page should be readable and functional when the text size is doubled. We use rem font-sizing (or another dynamic font unit) to make the text scales as expected when the web-page is zoomed-in. This also provides reliable text-resizing in smaller browser widths.
- Adequate line spacing (at least 1/2 the height of the text) and paragraph spacing (1.5 times line spacing) is important for readability.

### Resources

- [Drupal Accessibility Guidelines](https://drupal.org/node/1637990)
- [WCAG](http://www.w3.org/WAI/intro/wcag)

## Tooling

### [VS Code](https://code.visualstudio.com/)

While you are free to use any IDE you prefer, you may find the most internal support using VSCode.

### [TablePlus](https://tableplus.com/)

TablePlus is a simple, paid GUI for managing relational databases, like MySQL.

## Git

Git is a source code versioning system that lets you locally track changes and push or pull changes from remote resources.

### Best Practices

- Atomic commits:
  - Generally commits should be as small as possible.
  - The code should be in a functional state after each commit (even if incomplete) - avoid committing code which will won't run at all.
- Feature branches, pull requests (PR) & merge requests (MR):
  - These should contain a closely related series of commits that solves a single problem - avoid including changes that are unrelated.
  - Most often a single (well scoped) ticket will be resolved in a single PR/MR.
    - However, it is good to break larger changes over multiple PRs/MRs that each addresses a logical piece of the whole - this can make the code easier to review.
  - When merging PRs and MRs we prefer a rebase workflow with fast-forward merges (rather than a merge commit) since this retains a clean and linear commit history which can be helpful for future engineers.
    - For small PRs/MRs where there isn't much commit detail using a squash merge approach can also be fine.
- Rebasing commits on a feature branch - we do this for 2 reasons:
  - To update the feature branch on top of more recent changes in `main` so that it can be easily merged when ready.
  - To adjust the commits on the branch with an interactive rebase - for example:
    - Squashing 2 together that make more sense as one change.
    - Splitting a large commit into 2+ smaller ones.
    - Adjusting the wording of commit messages (see above).
    - Dropping any temporary/scratch commits.
  - When rebasing a feature branch, it's encouraged to leave commits showing earlier attempts, even if you later found a better approach.
    - This helps "tell the story" of the change - someone digging though the history may wonder why the first approach didn't work.
    - It also leaves the code available in the history in case you later find a use for that work.
- Our standard workflow uses:
  - Trunk based development with a single `main` branch - i.e. no additional long lived branches (e.g. `stable`) that get repeated merges
  - Short lived feature branches living in developer forks with PRs/MRs for all work
  - Feature branches should be prefixed with the related ticket ID (i.e. `abc-123-my-feature`).
  - We often rebase feature branches and use fast-forward merges
- Feature branches undergo both automatic and manual testing before being merged - this makes sure that `main` always passes tests.
  - Testing often includes linting, unit and functional tests as well as specialized tests such as security and accessibility scans.
- Avoid including files in source control that are specific to your development
  machine or process. For example, your editor or OS might generate files that are
  not pertinent to your project. Since those types of files will need to be
  [ignored](https://help.github.com/en/github/using-git/ignoring-files) from all
  the repos you work on, it's more convenient to set them once in a global
  `.gitignore` file (typically named `~/.gitignore_global`), as opposed to in each
  repo's `.gitignore`. Once you create your file and add rules to it, you can tell
  Git to use it:
  ```
  git config --global core.excludesfile ~/.gitignore_global
  ```
- Delete local and remote feature branches after merging. This allows us to
  reuse branch names, and makes it easier for you to differentiate between
  your branches that are done and those that are still being worked on. To turn
  this on in GitHub, check the "Automatically delete head branches" box under
  the "Merge button" heading in the Options settings for your repo.

### Commit messages

1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Reference the associated ticket ID using a prefix, e.g. `ABC-123:`
5. Use the [imperative mood](https://en.wikipedia.org/wiki/Imperative_mood) in the subject line
6. Do not end the subject line with a period
7. Wrap the body at 72 characters
8. Use the body to explain what and why vs. how
9. Detail any consequences of this (on code, data, users, security etc) - include any key terms

Example:

```
#123 Replace chromedriver-helper with webdrivers

`chromedriver-helper` says in bold on their README that they are no
longer maintaining it and that people should use `webdrivers` instead.

Additionally, `webdrivers` has a very useful feature that will
automatically use the right version of `chromedriver` based on the
version of Chrome that is installed on the machine. This was not
possible with `chromedriver-helper`, which made it harder to deal with
versioning locally and in Circle CI.
```

### PR with multiple commits

Once a PR has been approved, we recommend squashing commits so that the only ones that remain are meaningful ones that pertain to the overall goal of the PR. For example, if a PR is focused on a small specific task, and along the way you created commits that fixed typos or broken tests, those deserve to be squashed. It's easier to understand a PR when there aren't distracting commits.

We don't require any particular way to squash commits, but we recommend using GitHub's `squash and merge` button as it's the safest option.

### Fork vs Clone

If it's a repo you have write and push access to, clone it. Otherwise, fork it.

### Cloning with SSH vs HTTPS

Use [HTTPS] for read-only repos (where you’re only ever going to clone and pull), and use [SSH] for everything else. SSH supports certificates on security keys, and HTTPS does not. Therefore, we should not use HTTPS for anything that requires authentication. However, if you’re just pulling a public repo, HTTPS is more convenient since you don’t need to authenticate anything (unlike SSH for read-only repos).

[ssh]: https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[https]: https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository

### Rebasing

Pick either `rebase` or `merge` to incorporate changes from the default branch onto your
local branch. Use the same method every time for consistency. Most people
use `rebase`.

### Note on Default Branches

Use `main`.

### Resources

- [Dangit, Git!](https://dangitgit.com) - A plain English guide to solving common Git issues
- [Pro Git book](https://git-scm.com/)
- [Github resources](https://help.github.com/articles/git-and-github-learning-resources/)
- [Getting Git Right](https://www.atlassian.com/git/)
- [Version Control with Git book](http://www.amazon.com/Version-Control-Git-collaborative-development/dp/1449316387)
- [Telling stories with commits](https://blog.mocoso.co.uk/talks/2015/01/12/telling-stories-through-your-commits)
- [Keeping commit history clean](https://about.gitlab.com/blog/2018/06/07/keeping-git-commit-history-clean)
- Advance video on [how git works](https://www.youtube.com/watch?v=MYP56QJpDr4) at a lower level, helpful for building your mental model for rebasing, `reflog`, etc.
- [Non-video companion to the first half](http://git-scm.com/book/en/v2/Git-Internals-Git-Objects)

## Programming Languages

While we may have opinions on particular languages and strategic reasons for investing in some languages over others, we recognize that our clients will may make different choices for different reasons. As such, we should aim to be proficient in more than one language and able to get by with several.

### Languages we prefer

- JavaScript ([TypeScript](https://www.typescriptlang.org/) when possible)
  - Node
  - React
- Python
- SQL

### Language Resources

JavaScript

- Destructuring Assignment
  - [A Dead Simple Intro to Destructuring JavaScript Objects](http://wesbos.com/destructuring-objects/)
- Fat Arrow Functions
  - [ES5 Functions vs ES6 Fat Arrow Functions](https://medium.com/@thejasonfile/es5-functions-vs-es6-fat-arrow-functions-864033baa1a)
- Higher Order Components
  - [Higher Order Components: A React Application Design Pattern](https://www.sitepoint.com/react-higher-order-components/)
- Promises
  - [An incremental tutorial on promises](https://www.sohamkamani.com/blog/2016/08/28/incremenal-tutorial-to-promises/)
- Spread Operator/Rest Params
  - [JavaScript & The Spread Operator](https://codeburst.io/javascript-the-spread-operator-a867a71668ca)
  - [How Three Dots Changed JavaScript](https://dmitripavlutin.com/how-three-dots-changed-javascript/)
- Template Literals
  - [Template Literals](https://css-tricks.com/template-literals/)
- React
  - [React Tutorial](https://reactjs.org/tutorial/tutorial.html) - Official tutorial from React. If you stick with it you’ll learn the basics.
- Typescript
  - [Learn TypeScript in 50 Minutes - Tutorial for Beginners](https://www.youtube.com/watch?v=WBPrJSw7yQA)
  - [TypeScript and React](https://fettblog.eu/typescript-react/)
  - [TypeScript Patterns](https://medium.com/@martin_hotell/10-typescript-pro-tips-patterns-with-or-without-react-5799488d6680)
  - [Type aliases vs. interfaces in Typescript-based React apps](https://medium.com/@koss_lebedev/type-aliases-vs-interfaces-in-typescript-based-react-apps-e77c9a1d5fd0)
  - [React + Typescript Cheatsheet](https://github.com/typescript-cheatsheets/react-typescript-cheatsheet)
  - [Composing React Components with Typescript](https://www.pluralsight.com/guides/composing-react-components-with-typescript)

## Frontend

In order to make informed decisions around what kind of tools, libraries, and frameworks to use for your web application, it helps to have a strong understanding of what "front end" means in the context of web development. The front end part of an application stack refers to the client-side code that is downloaded from a web server, and executed in the browser on an end user's device. It includes, but is not limited to, the HTML and CSS that renders the user interface.

It is also important to keep in mind, especially as the ecosystem of front end development continues to expand, that the compiled code that will be executed natively by the browser is ultimately HTML, CSS, and JavaScript. While it is certainly possible to build a dynamic web app using just these languages, it is all run in a single environment, uncompartamentalized, making it easy to introduce bugs and unintended side effects. Therefore, many of the tools we see in modern front end development are actually used in order to improve the developer experience, and in turn the users, by enforcing consistent patterns, reducing the potentiality for bugs, and automating tasks that assist in performance optimization.

### Directory Structure

This is a suggested directory structure for your frontend application. It's not a hard requirement and you may end up using some, all, or none of these suggestions based on your project needs. Generally it's a good idea to be intentional about how you organize frontend code, separate code by concerns, and avoid coupling multiple functions or systems together (ie, React code, Redux code, native JS, etc.).

- `/src/components` - Low-level **React Components** that are more about rendering UI than handling application logic, and should typically _not_ be connected to providers directly. Aim for abstract, generic components that can be shared across the application easily, and will usually have corresponding `stories` files for viewing in Storybook.
- `/src/config` - High-level configuration definitions relevant to the whole application (such as routes).
- `/src/constants` - Define constants here instead of using string literals for any values with specific meaning in the context of the application. For example, data that comes back from the API that may be used in UI logic (such as a user role).
- `/src/containers` - **React Components** that are primarily concerned with connecting UI to containers or context providers, and sharing behavior or patterns via hooks or higher-order components.
- `/src/content` - Content that ends up displayed in the UI to the end-user. This is often expressed as plain text, but can also include JSX nodes in order to support formatted text. An example is defining how specific values from API data should be displayed as user-friendly language.
- `/src/graphql` - GraphQL code is in here! (but not all of it!)
  - `/src/graphql/fragments` - Common GraphQL fragments that may be shared across queries/mutations.
  - `/src/graphql/mocks` - Not to be confused with testing mocks. This defines client-only schema and resolvers for GraphQL requests that have not yet been implemented in the API.
- `/src/helpers` - Miscellaneous utilities that implement logic, data handling, and other common functions used throughout the application. These should not include React-specific code such as JSX, and they should generally be purely functional and well-tested.
- `/src/layout` - **React components** used to render common layout elements, such as header, footer, page content, etc. Similar to the components located in `/src/components`, they should focus on rendering UI rather than application logic or connecting to providers. However, they are designed such that there should only ever be one instance on each page.
- `/src/pages` - **React components** that correspond to actual routes (URLs). These are responsible for assembling the UI components for a page, and hooking them up with the necessary providers such as Redux or GraphQL. Queries should be co-located with page components, since pages are explicitly dependent on them.
- `/src/stories` - Storybook stories that aren't specific to a single component live here.
- `/src/styles` - Sometimes we also have to write CSS.
- `/src/types` - Type definitions that are shared throughout the application.

The primary entry point is `src/index.tsx`. This file is responsible for:

- (if using GraphQL) Initializing ApolloClient.
- Including the CSS entry point (`src/index.scss`) so it doesn't feel left out, and so our webpages look pretty.
- Wrapping the main `<App />` component inside of top-level providers, such as `<ApolloProvider>` (GraphQL), `<Provider>` (Redux), and `<PersistGate>` (redux-persist).
- Finally, rendering the resulting `<App />` component into the DOM

The next most important file is `src/App.tsx`. This is the top-level component that is rendered into the DOM. It is responsible for 2 important things:

- Imposing a global `<Layout />` onto _all pages_.
- Mapping whatever the current route is to the matching page component. If there is no matching page component, it will render the `NotFound` page component instead.

### Application State & Data Management

Choosing a method of state management for your application will depend a lot on the project’s needs, and how much & what kind of data is being cached from an API or is just being set and stored locally. Some common options are:

- [React Context](https://reactjs.org/docs/context.html) - built-in to React, “context provides a way to pass data through the component tree without having to pass props down manually at every level”
- [Apollo Client](https://www.apollographql.com/docs/react/) - caching API data for projects that are interacting with a GraphQL API
- [React Query](https://react-query.tanstack.com/) - similar API to ApolloClient but can be used with any kind of API (including REST)

A lot of confusion can stem from where to store data and how to access it in React applications. An important thing to consider is whether the data is saved in a database, or if it represents local ephemeral state. In other words: does it need to be re-hydrated if the user refreshes their window? Here are some things to consider:

- Avoid using Redux to cache API data, as this will require a lot of manual handling to make associations for relational data, and knowing when to update or re-fetch resources. If you are using a GraphQL API, we recommend using [ApolloClient](https://www.apollographql.com/docs/react/), and if you aren't then try out [React Query](https://react-query.tanstack.com/). Both of these tools are very smart at caching, so when we get API data we don't need to store it anywhere else! Storing API data in Redux in addition to Apollo or ReactQuery would be redundant.
- React Context is useful for storing local application state. That means any UI state that the entire application needs to be aware of, but that _doesn't_ need to be saved to a database for later. Examples include the current page URL, and whether or not a full page modal is open. They can also be useful for storing mock data that will eventually come from the API, but hasn't been implemented yet.

### Testing

- Unit tests
  - Test small pieces or components in isolated environments
  - Good to run continuously during development, as well as part of CI checks
  - [Jest](https://jestjs.io/)
    - The go-to framework for testing React components, but can also be used to test regular JS.
    - If you use create-react-app, this is included.
    - Provides snapshot and DOM testing.
  - [testing-library](https://testing-library.com/docs/react-testing-library/intro/)
    - The current recommendation for F/E unit testing, testing-library always renders components in full and makes assertions against the resulting DOM in order to most accurately capture an actual user experience
- Integration tests
  - Test larger chunks of the app and how they work together with partial or complete context
  - Good to run continuously during development, as well as part of CI checks
  - [Enzyme](https://enzymejs.github.io/enzyme/)
    - Allows you to assert and manipulate rendered components with jQuery-like selectors.
    - More useful for testing implementations of React class components, Enzyme can make assertions against React props and state, and instances of class components
- End-to-end (E2E) tests
  - Test complete user flows in the browser, as if you were a user
  - Most often useful for high-level regression tests and critical paths
  - Testing in different environments (browsers, devices) can be useful at this point
  - Heavy load, often best done in CI
  - Good to run during development for high-level changes such as refactors, changing URLs or entrypoints
  - `Cypress`, `Browserstack`
- Visual testing
  - Scripts that crawl through URLs or component libraries and take screenshots
  - Tests pass or fail when the images are compared to references
  - Heavy load, often best done in CI
  - [Happo](https://happo.io/) for cloud-based visual regression testing
- Accessibility Testing
  - Can be done through unit/integration testing and/or end to end.
  - `pa11y`, `axe-core`, `Cypress audit`

### Developer Experience

The following browser extensions can be installed to assist with debugging React and Redux applications:

- [React Developer Tools](https://github.com/facebook/react-devtools#installation)
- [Redux DevTools Extension](http://extension.remotedev.io/#redux-devtools-extension)

We generally adhere to the [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript), unless they conflict with project specific Prettier or lint rules.

- [Prettier](https://prettier.io) is recommended.
  - [Prettier editor integration](https://prettier.io/docs/en/editors.html) to make it easy to format and autosave.
  - Prefer single quotes for non-JSX code (CLI: `--single-quote` API: `singleQuote: true`)
  - Prefer trailing commas for cleaner PRs and error reduction (CLI: `--trailing-comma true` API: `trailingComma: true`)
  - A `.prettierrc` will be in the project for custom settings.

### Philosophy

This is an attempt to document the process of implementing a web UI based on visual assets, functional requirements, and content specifications. Hopefully the steps below provide a framework for accomplishing work with a high fidelity to the original designs, but they are not a substitute for attention to detail and thorough understanding of HTML and CSS.

#### Start with Markup

When implementing a new UI or doing a design pass on existing code, it's usually a good idea to refer to the HTML output before looking at any CSS. HTML syntax may be simple, but it is also meaningful and can make the difference between a web app that is accessible and secure and one that is not. The HTML also defines the structure of the content and design elements on a page, and while CSS can be used to manipulate the visual output to a high degree, it can only go so far.

You can use browser dev tools to inspect elements and view the executed markup for a page. The markup should be structured, organized, and readable, even by someone who is not familiar with HTML. Elements that are related to each other should often be contained within a parent element, and [semantic HTML](https://developer.mozilla.org/en-US/docs/Glossary/semantics#Semantics_in_HTML) should be used wherever possible. Take into consideration the organization of the content in the component or the page, and verify that the appropriate tags are being used. For example, if some content is a list, use a `<ul>`, `<ol>`, or `<dl>`, and if some content is tabular data, use `<table>`. `<div>` and `<span>` are both generic elements that can be used to divide content into groups or apply decorative styling, but on their own they have no inherent meaning, so _usually_ they should be viewed as extraneous. It is fine to use `<div>` and `<span>`, but there should be a clear reason when doing so.

Some HTML elements have quirks around how the browser renders them (such as [`<legend>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/legend)) or strict rules around what child elements are allowed and how they must be structured (such as [`<table>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table)). It's important to familiarize yourself with elements like these in order to use them effectively. Fortunately, React will usually print out a console error when it detects invalid HTML, and it's important to notice and correct these errors since they can be an indicator of potential browser compatibility issues.

Ultimately, structuring the markup in a way that corresponds to the content of the page will make implementing a design easier, because it will define patterns and objects that _also_ exist in the language of the design. For instance, if the design indicates a certain margin in between groups of text content, it might make sense to group that content using a `<section>`, `<div>` or other element, even if there's no other visual indication of separation such as a border or background color. Identifying the repeating components and subcomponents of a design will help establish the foundation upon which you can start styling with CSS.

#### Style with CSS (modules)

Before writing any CSS, it's important to understand the CSS that already exists within the application, and determine how your changes will build on top of that. By default, CSS is **globally scoped**, meaning any CSS that is imported _anywhere_ has the potential to apply to markup in your application _everywhere_. For example, if you have the following component...

```
// component.css
.myComponent {
  background-color: yellow;
}

p {
  font-size: 16px;
  color: blue;
}


// MyComponent.jsx
import styles from './component.css'

const MyComponent = () => <div className="myComponent"><p>This is a component!</p></div>
```

... it doesn’t matter whether or not that component is currently visible in the application -- that `p` style will apply to every `<p>` tag in your app on every page.

That isn't to say you should _never_ write global CSS -- it is extremely useful when defining the default styles for the app, and the more CSS that can be shared and applied globally, the smaller your bundle size might be. However, if you are trying to write styles for a specific component or page, it is usually safest to use **CSS modules**.

```
// component.module.css
.myComponent {
  background-color: yellow;
}

p {
  font-size: 16px;
  color: blue;
}

// MyComponent.jsx
import styles from './component.module.css'

const MyComponent = () => <div className={styles.myComponent}><p>This is a component!</p></div>
```

The above code snippet looks very similar, but with one key difference: the file name ends in `.module.css`. That tells the F/E compiler to _hash_ any class names contained in that file. That means in the effective code, `myComponent` will end up looking something like `component_myComponent_1a2b3c`. Additionally, the `.module.css` file exports the hashed values as a JS object, so they can be referenced in JSX component code (see how `styles.myComponent` is used in the above snippet):

```
{
  myComponent: 'component_myComponent_1a2b3c'
}
```

The compiled CSS & HTML will end up looking like this:

```
// CSS
.component_myComponent_1a2b3c {
  background-color: yellow;
}

// HTML
<div class="component_myComponent_1a2b3c"><p>This is a component!</p></div>
```

However, you might notice the `p` style block in that file will still apply globally, since it is not nested under any CSS class. So the CSS module file should finally be updated to:

```
// component.module.css
.myComponent {
  background-color: yellow;
}

.myComponent p {
  font-size: 16px;
  color: blue;
}
```

All of the above also applies to SASS/SCSS files (`.scss, .module.scss`).

#### CSS: Less is More

Another reason to start with defining the HTML is because you will immediately get to see how far that gets you without writing any CSS at all. Most of the time, base styles such as typography and layout should be inherited by global CSS or top-level components. If additional styling on a page or component is needed, it's usually a good idea to verify with the designer whether it is a change that should occur globally or not, and if not then that's usually a signal that a new UI component is needed.

When adding a new UI component, it's easiest to first build it in a component library tool such as [Storybook](https://storybook.js.org/), outside of the context of the application. That will ensure there is no tight coupling to API data or other contexts, and the UI can be viewed and tested in isolation. Build the component with stories for each test case in mind, and expose props that might be needed when using the component in the application (such as for passing in API data and event handlers). Add a CSS module file for the component, make sure to scope all styles under a class, and add style declarations only as needed.

When it comes to adding CSS declarations, here are some guidelines:

- Use existing variables/mixins for colors, spacing units, etc.
- Avoid setting global margins on components. Setting margins on elements inside of components is fine, but use the sibling selectors (`+` and `~`) where appropriate.

  - For example, you can control the margin between specific elements. In this snippet, the space between an `h2` and `p` will be 15px, but the space between an `h2` and a `ul` will be 20px:

    ```
    h2 + p { margin-top: 15px; }
    h2 + ul { margin-top: 20px; }
    ```

Ultimately, it's important to understand what each line of CSS is doing. Adding lines until something looks right is usually a recipe for unknown consequences, and can have effects on accessibility or add unnecessary kb to the bundle.

Finally, if you are using USWDS, it _does_ expose some [utility classes](https://designsystem.digital.gov/utilities/) that can be used directly in the markup (such as `margin-x-auto`). Be cautious of using these unless something is _truly_ an exception. The reason is that it adds additional points of dependencies between the styling and the markup (components will only have the expected visual result if they also have the correct classes) and adds more variables to where applied CSS may come from. For example, if a component is pulling CSS in from global styles, _and_ a CSS modules file, _and_ inline utility class names, it adds to the complexity of what styles will be effectively applied, and makes it harder to change or debug in the future.

#### Cheatsheet

- Review the effective HTML in component code and dev tools
  - Look for structure that aligns with the content, and no invalid DOM errors
  - Avoid adding extraneous elements (such as `<div>`s that have no purpose)
- Ensure all type elements have the correct sizing and type styles
  - Applies to `<p>, <h1>, <h2>`, etc. as well as text inputs and any other elements with text content
  - **Why?** This will affect the resulting spacing, and inform any tweaks to padding & margin that may be needed
  - Always define both `font-size` and `line-height` (unitless, as a factor of `font-size`)
- Know the differences between **padding** and **margin**

  - Padding is used to add _internal_ spacing between an element’s content and its border
  - Padding does not collapse - it will always effectively be what you declare in the CSS
  - Margin is used to add _external_ spacing between two elements
  - Margins collapse: if two sibling elements declare margins that overlap, the larger margin will be the effective space between them
  - For example, there will be a 35px margin between these two `div`s:

  ```
  .divA { margin: 20px; }
  .divB { margin: 35px; }

  <div class="divA"></div>
  <div class="divB"></div>
  ```

- Compare the implementation side-by-side with the design at mobile size (< 600px wide)
  - Spacing inside of elements (padding inside of a box, margins between child elements)
  - Vertical spacing between elements
  - Background colors and borders of elements
  - Any touch targets (inputs, buttons, etc.) should have a minimum size of 42x42px (this does not apply to inline text links)
- Resize the window up to tablet and desktop sizes (> 800px wide) and compare the implementation side-by-side with the design
  - Spacing inside of elements (padding inside of a box, margins between child elements)
  - Vertical spacing between elements
  - Any layout changes as a result of the window size increasing
  - Background colors and borders of elements
  - Responsive type scales up as indicated
- Double-check implementations in different browsers and devices as needed
- [Can I Use?](https://caniuse.com/) - use to check browser support for new CSS/JS features

#### Application Lifecycle

```
+---------+     +-----------+    +-------------+
| develop |     |  compile  |    | user views  |--> user interaction, JS & API calls
|   &     |====>| to static |===>| in browser  |<-- update the DOM
|  test   |     |  assets   |    | (page load) |
+---------+     +-----------+    +-------------+
                      ^
        this can happen locally, on CI, or on a server.
        it can also be triggered by a job,
        a webhook, content update, prerender, etc.
```

#### What are You Building?

- Is your web app designed to be:
  - [ ] a single page application (SPA) -- usually a data-rich, dynamic experience where most of, if not the entire page, is rendered _after_ page-load by JS
    - [ ] If a SPA, do you need server-side rendering (such as for optimized performance, accessibility, and SEO)?
  - [ ] primarily static HTML with some isolated JS components that don't need to communicate with each other
  - [ ] static HTML with no DOM-manipulating JS required at runtime
- What browsers and devices do you need to optimize for?
  - Who is your audience? Is this app for a specific organization’s internal use or the general public?
  - What kind of access do they have? Primarily desktop or mobile? Reliable, high speed network access, or offline-first? High or low-end devices?
  - Are there specific browsers or network restrictions they are required to use when interacting with your app?
  - Also consider screen size, touch vs. no touch, screen readers, and low network/offline access. Centering thinking around "desktop vs. mobile" is usually a trap -- there are laptops with touch screens, tablets in every size, and there are no guarantees that a user won't try to access your URL from a Nintendo Switch or a Kindle. Focus on feature-detection over device-detection.
  - Should it be a [progressive web app](https://developers.google.com/web/progressive-web-apps/)?

#### How Will You Build It?

> Even if you answered “static HTML” above, that doesn’t mean you have to write and maintain HTML files by hand. You can still take advantage of tools like JS frameworks and compilers to componentize UI elements, fetch and organize content, and test the DOM output. It may just mean generating static markup at compile time, instead of serving JS directly to users.

- How will the markup (HTML) be rendered?
  - [ ] Static assets (i.e., HTML/JS files uploaded to a web server)
    - If static assets, what kind of client-side code will you be writing?
      - [ ] Native HTML / CSS / JS (including external scripts or libraries loaded into the DOM)
      - [ ] Code requiring a compile step to be browser-compatible (such as ES6+, TypeScript, and SCSS)
        - See "Additional considerations if using a build tool" below
  - [ ] A server application will be responsible for returning HTML
    - How will the server compile markup? Will it use a templating language (i.e., `.erb` in a Rails application)?
    - Do you need to augment server-rendered markup with CSS or client-side JS?
    - Will there be any DOM manipulation after page load?
    - Try to identify which UI elements will be rendered or manipulated by the server vs. client-side JS
    - Consider serving markup from a Node.JS server in order to share templates and code across the stack.
- Do you need to include other assets such as fonts, images, or SVG?

#### Additional Considerations

- [ ] What tool to use? (webpack, gulp, rollup, parcel, etc.)
- [ ] What environment to build in (Node version)
- [ ] Do you need loaders for any or all of HTML, CSS, JS, static files?
- For JS:
  - What JS version(s) do you want to write in and target? (i.e., ES6 > ES5)
  - What will you use to transpile JS (i.e., Babel)
  - Do you need additional polyfills or plugins for your target output?
  - Do you want static type checking? (TypeScript / flow / PropTypes)
  - What will you use for running scripts and managing dependencies (npm or yarn)?
  - Will you use a JS framework (React, vue, etc.)?
- For CSS:
  - How do you want to write CSS?
  - What classname conventions do you want to use? (BEM, OOCSS)
  - Normalize (resets native browser CSS to one standard)
  - Autoprefixer (automatically adds browser prefixes to newer CSS features that may not have consistent support or syntax)
  - Pre-/post-compilers (SASS/SCSS, LESS, PostCSS)
  - CSS modules
  - CSS-in-JS (styled components, etc.)
- [ ] Global state management (Redux, context, etc.)
  - [ ] side effects (sagas, thunks, hooks?)
- [ ] Client-side routing
- [ ] Managing head/meta/title tags
- [ ] XHR/fetch service
  - What kind of API(s) do you need to interact with? (REST, GraphQL)
- [ ] Static asset loading (HTML, CSS, images, fonts, SVGs, etc.)
- Forms
  - Validating
  - Submitting
  - Showing output
- File uploads
- Static content from the code
  - i18n
- Dynamic content from a CMS, API, etc.
- User-generated content (UGC)
  - Escaping entities
  - Formatting
- How will the front end code fit in with the rest of the application ecosystem, other systems and services?
  - [ ] Where will front end assets be hosted? Do they need their own CI/CD pipeline?
  - [ ] Will you use a CDN, and how will you manage caching?
  - [ ] How will you manage non-code assets, like images and fonts?
  - [ ] If making API calls to an internal backend, what will the various environments and domains be? Will you need to set up CORS and/or CSRF protection?
- Build tool config/integrations
  - [ ] an asset manifest
  - [ ] sourcemaps
  - [ ] versioning/hashing
  - [ ] code splitting/chunking/dynamic imports
  - [ ] absolute imports
  - [ ] bundle analyzer
  - [ ] minification

### Resources

- HTML
  - [HTML elements reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
- CSS
  - [CSS modules](https://github.com/css-modules/css-modules)
  - [What are CSS modules and why do we need them?](https://css-tricks.com/css-modules-part-1-need/)
  - [CSS reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
  - [A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
  - [CSS-tricks.com Guides](https://css-tricks.com/guides/)
  - [USWDS](https://designsystem.digital.gov/)
- JSX
  - [In-depth](https://facebook.github.io/react/docs/jsx-in-depth.html)
  - [Gotchas](https://facebook.github.io/react/docs/jsx-gotchas.html)
  - [Official site](https://jsx.github.io/)
- Virtual DOM
  - [Disambiguation](http://jbi.sh/what-is-virtual-dom/)
  - [Glossary](https://facebook.github.io/react/docs/glossary.html)
- React Router
  - [Github repo](https://github.com/reactjs/react-router)
  - [A Comprehensive Introduction](https://www.themarketingtechnologist.co/react-router-an-introduction/)

## Backend

### GraphQL API

This guide was heavily influenced by [https://graphql.org/learn/best-practices/](https://graphql.org/learn/best-practices/)

#### Principles

One of the most important things to keep in mind when building a GraphQL API is that GraphQL is not REST. In particular, GraphQL is most powerful when used as a way to model your problem domain. This is probably not an exact 1:1 mapping with your database models.

GraphQL is ... a graph. Graphs offer a [different way of thinking](https://graphql.org/learn/thinking-in-graphs/) or modeling your data than you may be used to.

See also [GraphQL Rules](https://graphql-rules.com) for additional recommendations and best practices

#### Schema First

Prefer schema first tooling that allows producers and consumers agree upon a data shape prior to implementation. This allows a discussion about the problem domain that is independent of the technology being used on either side of the API.

By designing your GraphQL schema to fit the way you want to think about the data instead of your implementation, you can evolve your implementation without changing clients.

#### Versioning and Backwards Compatibility

The [Versioning](https://graphql.org/learn/best-practices/#versioning) section of GraphQL Best Practices describes why GraphQL APIs should be backwards compatible and not versioned. [Building Evolvable Schemas](https://www.apollographql.com/blog/graphql-schema-design-building-evolvable-schemas-1501f3c59ed5/) has some concrete advice on how to structure your schema.

[Nullability also influences schema evolution](https://medium.com/@calebmer/when-to-use-graphql-non-null-fields-4059337f6fc8), so think carefully about which fields to require.

#### Mutations Communicate Intent

GraphQL mutations should be specific enough to communicate the intent of the change. Avoid [anemic mutations](https://medium.com/@__xuorig__/graphql-mutation-design-anemic-mutations-dd107ba70496)

#### Errors and Nullability

GraphQL is designed for returning as much data as possible, even if an error occurs. That can be [surprising](https://medium.com/@calebmer/when-to-use-graphql-non-null-fields-4059337f6fc8), and surprisingly powerful. That means both data and errors can be returned.

#### Pagination

[Pagination](https://graphql.org/learn/pagination/) can heavily influence schema design. The concept of [GraphQL Connections](https://relay.dev/graphql/connections.htm) is yet another new and powerful concept to grasp when designing a schema. By thinking about this early, you can avoid having to make breaking changes to your schema.

Simplicity is nice when first starting out and prototyping, but it is _strongly_ recommended to use the connection concept when using the schema in production.

#### Caching

GraphQL prefers to use GUID for objects to facilitate [Caching](https://graphql.org/learn/caching/).

#### Errors

Error handling in GraphQL is [not fully standardized](https://blog.atomist.com/error-handling-in-graphql/).

Some folks are using [unions and interfaces to handle errors](https://blog.logrocket.com/handling-graphql-errors-like-a-champ-with-unions-and-interfaces/) to encode errors in the response data instead of in the basically untyped `errors` field. This makes the most sense for errors that are specific to the operation being made that you want the client to handle gracefully. It also encourages you to include errors as part of your domain modeling, which is a good thing.

### REST API Design

Most of this structure was pulled from [https://apiguide.readthedocs.io/en/latest/index.html](https://apiguide.readthedocs.io/en/latest/index.html) which is an API guide written by the AusDTO which appears to be the Aussie version of the U.S. Digital Services.

This guide is for developers of an API, including:

- Engineers starting on a project looking to develop a REST API
- Feature leads for API development
- Individual developer implementing / extending / testing an API

We will first be focusing on the **Building REST APIs** section. And will decide our principles in collaboration with the GraphQL documentation team.

- Developer empathy
- Functionality
- Ubiquitous standards
- Special technologies
- Endpoint stability
- Security
- Documentation

#### Building REST APIs

Use HTTP methods and status codes correctly

When using HTTP methods like PUT or GET in your REST API, it's important to comply with their definitions under the [HTTP/1.1 Standard](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).

The most important ones will be covered here.

**GET**

The GET method requests a specified resource. Requests using GET should only retrieve data.

Example: This request returns a list of moves from the server.

```
GET /v1/moves HTTP/1.1
Host: api.move.mil
```

**POST**

The POST method is used to send data to create/update a type of resource.

Example: This request creates a shipment by sending a body with the shipment data.

```
POST /v1/shipments/ HTTP/1.1
Host: api.move.mil
Content-Type: application/json
Body:
{
    "shipmentType": "UHAUL",
    "destinationAddress": {
        "streetAddress1": "812 S 129th Street",
        "city": "San Diego",
        "state": "CA",
        "postalCode": "92102"
    },
}
```

**PATCH**

The PATCH method is used to partially update a resource.

Example: This request updates two fields on a shipment that exists on the server.

```
PUT /v1/shipments/01b9671e-b268 HTTP/1.1
Host: api.move.mil
Content-Type: application/json
Body:
{
    "shipmentType": "UPS",
    "deliveryDate": "2020-11-08"
}
```

**PUT**

The PUT method is used to send data to create/update a specified resource but it is generally used to replace an existing resource, rather than create a new one.

Example: Update an address by replacing with a complete address resource.

```
PUT /v1/mto-shipment/c548a243-9705/address/701a2bf8 HTTP/1.1
Host: api.move.mil
Content-Type: application/json

{
  "streetAddress1": "3373 NW Martin Luther King Jr Blvd",
  "city": "Alameda",
  "state": "CA",
  "postalCode": "94501",
  "country": "USA"
}
```

The PUT method is idempotent, which means calling the same PUT request multiple times **must** always produce the same result.

Calling PUT five times will repeatedly replace the same resource, with the same result. Calling POST five times will create 5 instances of the resource.

See this [article](https://restfulapi.net/rest-put-vs-post/) for more discussion.

**DELETE**

The DELETE method deletes the specified resource.

**URL Design**

Under REST principles, a URL identifies a resource. The following URL design patterns are considered REST best practices:

- URLs should include nouns, not verbs.
- Use plural nouns only for consistency (no singular nouns).
- Use HTTP methods (HTTP/1.1) to operate on these resources:
- Use HTTP response status codes to represent the outcome of operations on resources.

An example of this is as follows:

```
  POST /prime/v1/shipments
```

- We use POST as that is the HTTP method used for creation.
- The resource being created is a shipment, therefore we use the plural noun `shipments`.
- This endpoint will respond with a `201 - Created` which is the HTTP status cdoe for successful creation.

A **bad example** would be as follows

```
  PUT /prime/v1/shipment/create
```

- PUT is not used to create new resources but to replace existing ones.
- The resource is using the singular not plural word `shipment`
- It also uses a verb `create` in the URL.

Check here for more examples of [good and bad RESTful URLs](https://apiguide.readthedocs.io/en/latest/build_and_publish/use_RESTful_urls.html#good-restful-url-examples).

#### State change

In practice, state change actions often need their own endpoint, as there are side effects to state change. The pattern represented above works well for creating, updating or deleting objects, but not always for managing state.

To that end, we do sometimes have endpoints that specifically change state and therefore have a "verb" url. It is understood that only one thing is changing about the resource when this endpoint is hit.

```
  PATCH /prime/v1/shipments/shipmentID/updateStatus
```

This is not considered REST best practice but if you are building an API where the goal is guide the user through a very specific flow, this can be useful. Be thoughtful about when you use it.

#### URL Depth

The `resource/identifier/resource` URL pattern is usually sufficient to support most resource graphs. If your URL depth goes deeper than `resource/identifier/resource`, it may be evidence that the granularity of your API is too coarse.

For e.g. if you have an address on a shipment on a move, avoid using urls like

```
/api/v1/move/moveID/shipments/shipmentID/agents
```

Instead consider using

```
/api/v1/shipments/shipmentID/agents
```

#### API Payload formats

To interact with an API, a consumer needs to be able to produce and consume messages in the appropriate format. For a successful interaction both parties would need to be able to process (parse and generate) these messages.

It is best to use standardized formats such as JSON or XML throughout the API, both on successful or erroneous results.

In case of an error, you return a consistent error payload. In case of success, you return a payload matching the following conventions.

- **POST**

  Usually, the URL specifies the resource type in plural `api/v1/shipments` but the response payload will be the single `shipment` that was created.

- **PUT** and **PATCH**

  Usually, the url will specify a specific resource `api/v1/shipments/shipmentID` and the response payload will be that specific resource updated.

- **GET**

  The URL may specify the resource type in plural `api/v1/shipments` in which case the response payload will be a list of `shipments`.

  OR the URL may specify a specific resournce `api/v1/shipments/shipmentID` in which case the response payload will be that specific shipment.

These guidelines were adapted from the [Australian Digital Service's API Design Guide](https://apiguide.readthedocs.io/en/latest/build_and_publish/use_RESTful_urls.html#).

#### Passing Parameters

One of the first things you'll need to figure out, after you've decided on the HTTP Method to use, is how to supply data to the endpoint.

There are four different ways to do so, which can be confusing. They are:

- Path
- Query
- Body
- Headers

Let's dive into each of these and understand what they are. We'll look at the following example request to update a shipment.

```
PATCH /v1/shipments/01b9671e-b268?expand=services HTTP/1.1
Host: api.move.mil
Content-Type: application/json
If-Match: MjAyMC0xMi0wMVQxODo1NjoxMy4zNjkxNzRa
Body:
{
    "shipmentType": "UPS",
    "deliveryDate": "2020-06-08"
}
```

#### Types of Parameters

**Path Parameter**

This parameter is in the URI of the path, the web address so to speak.

**Typically, path parameters are used to pass in a resource identifier**. This is handy as it means you don't have to send a body for a simple GET request.

In our example request, which is a PATCH request, the path is:

```
api.move.mil/v1/shipments/01b9671e-b268
```

The code at the end `01b9671e-b268` identifies the shipment we are trying to update. You may have more than one ID in the path but it's recommended to keep the URL length and depth constrained

**Query Parameter**

The next type of parameter is also tacked on to the address, but is passed in after the main URL.

**Queries are usually used for pagination, filtering and expansion of nested objects.**

In our example request, the query parameter is `expand` and the value is `services`:

```
?expand=services
```

This could be used to request the server to expand a nested object called services. You can send more than one query parameter, but must follow the [rules for query string formatting](https://en.wikipedia.org/wiki/Query_string).

One important thing to keep in mind is that since the query is in the path, it will be exposed in some situations and therefore is **not the right place for sensitive data**.

No matter whether you are using https/TLS, the user may inadvertently share the path and expose a session token or other vital data.

Read here for more details on [Information exposure through URL query strings](https://owasp.org/www-community/vulnerabilities/Information_exposure_through_query_strings_in_url).

**Body Parameter**

**The body of the post is where the bulk of the parameters are passed in.**

Usually we use a JSON representation to provide structure to the body. JSON is very flexible and a well-understood standard, which makes it perfect for this use. We also return data back to the caller in this format.

In the example, the body that we send is:

```
{
    "shipmentType": "UPS",
    "deliveryDate": "2020-06-08"
}
```

This is requesting a change to two fields, named `shipmentType` and `deliveryDate`.

In an https/TLS request, the body will be safely encrypted and never exposed, so it is **safe to send sensitive data**.

**Header Parameter**

**Headers are typically used provide data that is not specific to the current request, and may be processed upstream from the handler.**

Headers are especially useful for data that is needed prior to processing the request body, or by an entity other than the receiver of the request.

For e.g. caching and proxying relies on headers. Proxy servers might even change some headers before passing on the request.

Another example is content type negotiation. The server needs to know the payload will be in JSON and utf-8 _before_ it tries to parse the payload.

Headers tend to come from **a set of common known headers**, rather than completely custom options. Some are even mandatory.

Some examples are:

- `Host` : specifies the domain of the server it is communicating with. Mandatory.
- `Content-Type` : specifies the type of content in the body and optionally, the charset.
- `Authorization` : specifies the authorization scheme and any associated data or token.

Read here to learn more about the [most common HTTP Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers).

In our example, we have the following headers:

```
Host: api.move.mil
Content-Type: application/json
If-Match: MjAyMC0xMi0wMVQxODo1NjoxMy4zNjkxNzRa
```

This shows

- The mandatory `Host` header used to send the hostname.
- The commonly used `Content-Type` header specifies that we are using JSON.
- The `If-Match` header is used for Concurrency Control or Optimistic Locking.

#### Resources

- [Internationalization of API error messages](https://stackoverflow.com/questions/30109787/internationalization-of-api-error-messages-on-front-end-or-back-end)
- [Best practices for localization](https://www.at-it-translator.com/best-practicestips-for-software-application-and-game-localization/)
- [String Internationalization](https://docs.ckan.org/en/2.9/contributing/string-i18n.html)
- [Best practices for API error handling](https://nordicapis.com/best-practices-api-error-handling/)
- [Rest API Error Handling](https://www.baeldung.com/rest-api-error-handling-best-practices)
