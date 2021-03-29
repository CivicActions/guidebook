# Building a React App from Scratch

**This is a WIP: Updated Recommendations Coming Soon!**

## Tools

View Layer: [React](https://facebook.github.io/react/)

Application State Management: [Redux](http://redux.js.org/) + [React-Redux](https://github.com/reactjs/react-redux) ([Tutorial](https://egghead.io/lessons/javascript-redux-the-single-immutable-state-tree))

Javascript: [ES6](https://leanpub.com/understandinges6/read) with [Babel](http://babeljs.io/) compiler

Web Framework: [Express](http://expressjs.com/)

Linter: [ESLint](https://github.com/eslint/eslint)

React Source Code: [Examples](https://react.rocks/tag/Bootstrap)

Module Bundler: [Webpack](https://webpack.github.io/)

[ESLint Loader](https://github.com/MoOx/eslint-loader)

[Babel Loader](https://github.com/babel/babel-loader)

Style Guides:

- [Example 1](https://github.com/airbnb/javascript)
- [Example 2](https://github.com/airbnb/javascript/tree/master/react)

[The ReactJS Controller View Pattern](http://blog.andrewray.me/the-reactjs-controller-view-pattern/)

## Tutorials

[React.js Tutorial Pt 1: A Comprehensive Guide to Building Apps with React.js](http://tylermcginnis.com/reactjs-tutorial-a-comprehensive-guide-to-building-apps-with-react/)
[Tyler McGinnis](https://tylermcginnis.com/reactjs-tutorial-a-comprehensive-guide-to-building-apps-with-react/)
[Sitepoint](http://www.sitepoint.com/how-to-build-a-todo-app-using-react-redux-and-immutable-js/)
[The Superhero battler app](http://blog.krawaller.se/posts/a-react-redux-example-app/)
[Teropa](http://teropa.info/blog/2015/09/10/full-stack-redux-tutorial.html)
[React Tutorial Using the MERN Stack](https://hashnode.com/post/react-tutorial-using-mern-stack-ciiyus9m700qqge53mer0isxz)
[Full Stack Redux Tutorial](http://teropa.info/blog/2015/09/10/full-stack-redux-tutorial.html)
[React & Flux](http://survivejs.com/webpack_react/react_and_flux/)

Resources for above tutorials:

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

Key Javascript Concepts

[Scope & Context](http://ryanmorr.com/understanding-scope-and-context-in-javascript/)

[ES6 Fat Arrow Functions](https://strongloop.com/strongblog/an-introduction-to-javascript-es6-arrow-functions/)

[ES6 Spread Operators](http://www.datchley.name/es6-rest-spread-defaults-and-destructuring/)

[ES6 Object Literal Shorthand](http://www.benmvp.com/learning-es6-enhanced-object-literals/)

Other good articles

[Redux Shill](https://blog.andyet.com/2015/08/06/what-the-flux-lets-redux/)
[MVC context](http://blog.andrewray.me/the-reactjs-controller-view-pattern/)

## Testing

Breanne’s recommendation, after research
Either Jasmine on its own, or Karma. Here’s why:

### Jasmine alone

- Jasmine is an incredibly common standard, and we’d gain a lot by learning to use it
- Flexible; works directly with a number of JS libraries and with others with a little adaptation work
- Lovely, clear, and abundant documentation
- Getting help, either online or within Truss, would probably be fairly straightforward

### Karma, integrating Jasmine and possibly other test frameworks

- Allows us to learn to use three different testing frameworks (Jasmine, Mocha, and QUnit), with the option of writing an adapter for any other framework we’d like
- Tests on multiple browsers and devices
- Lets you use React import syntax
- Integrates with a number of different CIs, if we were so inclined
- We could add Enzyme, for easier use of React components, and a nice complement to Jasmine

## Notes on each option

A little on [React’s test utilities](https://facebook.github.io/react/docs/test-utils.html)

- They still require a testing framework to use, but they can provide the data needed to perform the tests.
- Lets you simulate clicks, enter and submit text in an input field, find components that have particular class names, tags, types,
- Shallow rendering lets you render components one level deep without worrying about child components.

## [Jasmine](http://jasmine.github.io/)

[Jasmine Testing](http://revelry.co/react-testing-with-jasmine/)

- Seems to be the most widely used, certainly a standard in front-end testing
- Readable, easy-to-interpret function names
- Does not have instructions or helper code specifically for React/Redux, but does for many other JS libraries. The other instructions may be enough, but we might end up doing more tailoring to work with it than we would with, say, Karma.
  - [However...](http://revelry.co/react-testing-with-jasmine/react-addons-test-utils)
  - And [this repo](https://github.com/tommyh/jasmine-react) lets you use Jasmine with the more typical React syntax for creating components
    -Seems to be a pretty standard tool, so we might benefit from using it in learning a more transferrable skill

Handy, and also sounds like someone explaining a heist in a Guy Ritchie movie: [React Using Jasmine and Webpack](https://egghead.io/lessons/react-unit-testing-a-react-component-using-jasmine-and-webpack)

## [Karma](http://karma-runner.github.io/0.13/index.html)

[Karma Testing](https://www.toptal.com/react/how-react-components-make-ui-testing-easy)

- **Test runner** (uses multiple external testing frameworks)
- Describe your tests with Jasmine, Mocha, QUnit, or write a simple adapter for any framework
- Uses the same modules (`<TodoList />`, etc.) involved in rendering to run the tests, no translation or alteration needed
- Run from the command line
- Test your code on real browsers and real devices such as phones, tablets or on a headless PhantomJS instance.
- Most tests render, find a specific node, and test the contents
- Emulates multiple browsers
- Integrates with a number of CIs and other JS frameworks

## [Enzyme](https://github.com/airbnb/enzyme)

[Documentation](https://github.com/airbnb/enzyme/blob/master/docs/guides/react-native.md)

- [Use with Jasmine](https://github.com/blainekasten/jasmine-enzyme)
- Made for React
- Works with Karma and other test runners
- Shallow and full DOM rendering
- Uses the same modules (`<TodoList />`, etc.) involved in rendering to run the tests, no translation or alteration needed
- Could be a good addition to Jasmine if we elect to use Karma

## [Jest](https://facebook.github.io/jest/)

- Facebook’s own testing suite
- Facebook would like you to use it
- Other people are not so into it
- Doesn’t support running in multiple browsers
- Good reasons why not [here:](https://www.toptal.com/react/how-react-components-make-ui-testing-easy)

## [Mocha](http://mochajs.org)

- Test framework running on Node.js and in the browser
- Asynchronous testing
- Access through the terminal
- Speed tests available for some tests
  before() and after() hooks reminiscent of setup and teardown in Xcode
- Nyan reporter (yep)

## [Chutzpah](http://mmanela.github.io/chutzpah/)

[Documentation](https://github.com/mmanela/chutzpah/wiki)

- Test runner which enables you to run unit tests using QUnit, Jasmine, Mocha, CoffeeScript and TypeScript
- Access through the terminal
- Basically, yeah, another test runner.
