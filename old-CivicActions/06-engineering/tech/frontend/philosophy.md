# [Engineering Playbook](../../README.md) / [Web Development](../README.md) / [Front End](./README.md) / Implementing UI

This is an attempt to document the process of implementing a web UI based on visual assets, functional requirements, and content specifications. Hopefully the steps below provide a framework for accomplishing work with a high fidelity to the original designs, but they are not a substitute for attention to detail and thorough understanding of HTML and CSS.

## Contents

1. [Start with the markup](#start-with-the-markup)
2. [Style with CSS (modules)](#style-with-css-modules)
3. [CSS: less is more](#css-less-is-more)
4. [Cheatsheet](#cheatsheet)

## Start with the markup

When implementing a new UI or doing a design pass on existing code, it's usually a good idea to refer to the HTML output before looking at any CSS. HTML syntax may be simple, but it is also meaningful and can make the difference between a web app that is accessible and secure and one that is not. The HTML also defines the structure of the content and design elements on a page, and while CSS can be used to manipulate the visual output to a high degree, it can only go so far.

You can use browser dev tools to inspect elements and view the executed markup for a page. The markup should be structured, organized, and readable, even by someone who is not familiar with HTML. Elements that are related to each other should often be contained within a parent element, and [semantic HTML](https://developer.mozilla.org/en-US/docs/Glossary/semantics#Semantics_in_HTML) should be used wherever possible. Take into consideration the organization of the content in the component or the page, and verify that the appropriate tags are being used. For example, if some content is a list, use a `<ul>`, `<ol>`, or `<dl>`, and if some content is tabular data, use `<table>`. `<div>` and `<span>` are both generic elements that can be used to divide content into groups or apply decorative styling, but on their own they have no inherent meaning, so _usually_ they should be viewed as extraneous. It is fine to use `<div>` and `<span>`, but there should be a clear reason when doing so.

Some HTML elements have quirks around how the browser renders them (such as [`<legend>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/legend)) or strict rules around what child elements are allowed and how they must be structured (such as [`<table>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table)). It's important to familiarize yourself with elements like these in order to use them effectively. Fortunately, React will usually print out a console error when it detects invalid HTML, and it's important to notice and correct these errors since they can be an indicator of potential browser compatibility issues.

![Image of console error reading "Warning: validateDOMNesting(...): <td> cannot appear as a child of <table>."](./validateDOMNesting_error.png)

Ultimately, structuring the markup in a way that corresponds to the content of the page will make implementing a design easier, because it will define patterns and objects that _also_ exist in the language of the design. For instance, if the design indicates a certain margin in between groups of text content, it might make sense to group that content using a `<section>`, `<div>` or other element, even if there's no other visual indication of separation such as a border or background color. Identifying the repeating components and subcomponents of a design will help establish the foundation upon which you can start styling with CSS.

### Resources

- [HTML elements reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)

## Style with CSS (modules)

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

### References

- [CSS modules](https://github.com/css-modules/css-modules)
- [What are CSS modules and why do we need them?](https://css-tricks.com/css-modules-part-1-need/)

## CSS: less is more

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

### References

- [CSS reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
- [A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [CSS-tricks.com Guides](https://css-tricks.com/guides/)
- [USWDS](https://designsystem.digital.gov/)

## Cheatsheet

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

  - TODO: Add a diagram that illustrates collapsing margins

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

### References

- [Can I Use?](https://caniuse.com/) - use to check browser support for new CSS/JS features

# [Engineering Playbook](../../README.md) / [Web Development](../README.md) / [Front End](./README.md) / Project Checklist

## A Front End Application Lifecycle

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

## What are you building?

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

## How will you build it?

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

### Additional considerations if using a build tool

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

### Additional considerations if building a SPA

- [ ] Global state management (Redux, context, etc.)
  - [ ] side effects (sagas, thunks, hooks?)
- [ ] Client-side routing
- [ ] Managing head/meta/title tags
- [ ] XHR/fetch service
  - What kind of API(s) do you need to interact with? (REST, GraphQL)
- [ ] Static asset loading (HTML, CSS, images, fonts, SVGs, etc.)

### User Interaction

- Forms
  - Validating
  - Submitting
  - Showing output
- File uploads

### Managing & Displaying Content

- Static content from the code
  - i18n
- Dynamic content from a CMS, API, etc.
- User-generated content (UGC)
  - Escaping entities
  - Formatting

### Maintaining code standards & developer tools

- [ ] Linting/formatting (eslint, prettier, stylelint)
- [ ] Commit hooks (husky)
- Browser dev tools
- React developer tools
- Redux debugger

### Working with Design

- Pre-fab frameworks (i.e., Bootstrap, MaterialUI, etc.)
- Component-driven development
  - Maintain component libraries for documentation and testing (i.e., Storybook)
  - Build and view UI components outside the context of the application (don't need to connect to API, database, etc.)
  - Iterate on UI elements over time
  - Automate cross-browser/device testing by using this with visual testing tools (see below)
- How do you want to render icons? SVGs? FontAwesome?

## Testing

- Unit tests
  - Test small pieces or components in isolated environments
  - Good to run continuously during development, as well as part of CI checks
  - Jest, Testing Library
- Integration tests
  - Test larger chunks of the app and how they work together with partial or complete context
  - Good to run continuously during development, as well as part of CI checks
  - Jest, Testing Library, Enzyme
- End-to-end (E2E) tests
  - Test complete user flows in the browser, as if you were a user
  - Most often useful for high-level regression tests and critical paths
  - Testing in different environments (browsers, devices) can be useful at this point
  - Heavy load, often best done in CI
  - Good to run during development for high-level changes such as refactors, changing URLs or entrypoints
  - Cypress, Saucelabs, Browserstack
- Visual testing
  - Scripts that crawl through URLs or component libraries and take screenshots
  - Tests pass or fail when the images are compared to references
  - Heavy load, often best done in CI
  - Happo, Loki, Percy
- Accessibility Testing
  - Can be done through unit/integration testing and/or end to end.
  - pa11y, axe-core, Cypress audit

## Deploying

- How will the front end code fit in with the rest of the application ecosystem, other systems and services?
  - [ ] Where will front end assets be hosted? Do they need their own CI/CD pipeline?
  - [ ] Will you use a CDN, and how will you manage caching?
  - [ ] How will you manage non-code assets, like images and fonts?
  - [ ] If making API calls to an internal backend, what will the various environments and domains be? Will you need to set up CORS and/or CSRF protection?

## Optimization

- Build tool config/integrations
  - [ ] an asset manifest
  - [ ] sourcemaps
  - [ ] versioning/hashing
  - [ ] code splitting/chunking/dynamic imports
  - [ ] absolute imports
  - [ ] bundle analyzer
  - [ ] minification
