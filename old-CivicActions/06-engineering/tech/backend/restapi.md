# [Engineering Playbook](../../../README.md) / [Web Development](../../README.md) / [API Guide](../README.md) / REST API Design

Most of this structure was pulled from [https://apiguide.readthedocs.io/en/latest/index.html](https://apiguide.readthedocs.io/en/latest/index.html) which is an API guide written by the AusDTO which appears to be the Aussie version of the U.S. Digital Services.

I pulled in all the questions that were solicited from our meetings within the team into the different headings, to help illuminate what goes in the section but also to ensure our guide answers our own questions.

## Overview

### Audience

This guide is for developers of an API, including:

- Engineers starting on a project looking to develop a REST API
- Feature leads for API development
- Individual developer implementing / extending / testing an API

## Principles

I like the concept of shared principles, so I'm including this section here. But ideally we share principles between the GraphQL and REST API guides, and this moves up a level.

These principles were copied from [https://apiguide.readthedocs.io/en/latest/principles/index.html](https://apiguide.readthedocs.io/en/latest/principles/index.html) and don't need to be our principles, but they are listed here to prompt thought and discussion.

We will first be focusing on the **Building REST APIs** section. And will decide our principles in collaboration with the GraphQL documentation team.

- Developer empathy
- Functionality
- Ubiquitous standards
- Special technologies
- Endpoint stability
- Security
- Documentation
- Dogfooding (need better terminology)

## Building REST APIs

- [HTTP Methods](HTTP-Methods.md) - Use HTTP methods and status codes correctly

# [Engineering Playbook](../../../../README.md) / [Web Development](../../../README.md) / [API Guide](../../README.md) / [REST API Design](../README.md) / HTTP Methods

When using HTTP methods like PUT or GET in your REST API, it's important to comply with their definitions under the [HTTP/1.1 Standard](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).

The most important ones will be covered here.

## GET

The GET method requests a specified resource. Requests using GET should only retrieve data.

Example: This request returns a list of moves from the server.

```
GET /v1/moves HTTP/1.1
Host: api.move.mil
```

## POST

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

## PATCH

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

## PUT

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

## DELETE

The DELETE method deletes the specified resource.

- [URL Design](URL-Design.md) - How to pick the right URL for your endpoint.

  - URL Depth
  - Using plurals for the objects
  - Noun vs. verb endpoints
  - Good and bad RESTful url examples

  # URL Design

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

## State change

In practice, state change actions often need their own endpoint, as there are side effects to state change. The pattern represented above works well for creating, updating or deleting objects, but not always for managing state.

To that end, we do sometimes have endpoints that specifically change state and therefore have a "verb" url. It is understood that only one thing is changing about the resource when this endpoint is hit.

```
  PATCH /prime/v1/shipments/shipmentID/updateStatus
```

This is not considered REST best practice but if you are building an API where the goal is guide the user through a very specific flow, this can be useful. Be thoughtful about when you use it.

## URL Depth

The `resource/identifier/resource` URL pattern is usually sufficient to support most resource graphs. If your URL depth goes deeper than `resource/identifier/resource`, it may be evidence that the granularity of your API is too coarse.

For e.g. if you have an address on a shipment on a move, avoid using urls like

```
/api/v1/move/moveID/shipments/shipmentID/agents
```

Instead consider using

```
/api/v1/shipments/shipmentID/agents
```

## API Payload formats

To interact with an API, a consumer needs to be able to produce and consume messages in the appropriate format. For a sucessful interaction both parties would need to be able to process (parse and generate) these messages.

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

- [Style Guide](Style-Guide.md) - Simple style guide for a REST API

  - Cases for url and body
  - Linter to enforce rules

  # Style Guide

In addition to consistent design of the API, a consistent style is also important.

The details of a style guide are often a matter of personal opinion, but the most important aspect is simply consistency.

Here's one example for the Milmove Prime API.

- All URLs must be in `kebab-case`, however any params listed in the URL documentation must be in `camelCase`.
- All resources must be plural.
- All JSON response payloads must use `camelCase` for all keys.
- All simple resource identifier keys, with no prefix, should be lowercase `id`.
- All keys postfixed with ID in response payloads should be capitalize ID, so `shipmentID` is correct - not `shipmentId` or `shipmentid`.
- All timestamps are post-fixed with `At`, such as `updatedAt`, `createdAt`.

It does not matter if you choose a different style than what is described here, just that you define it and stick with it.

## Linters

A good way to ensure compliance is to use a linter. If you are using a `yaml` format such as OpenAPI to define the REST API, you can use [Spectral](https://stoplight.io/open-source/spectral) as a linter.

In this [sample ruleset we use on Milmove](https://github.com/transcom/mymove/blob/master/swagger/.spectral.yml), you can see examples that enforce some rules of the above style guide.

- [Data Design](Data-Design.md)

  - Path, Query, Body and Header Parameters
  - Security considerations related to parameter location

  # Data-Design

## Passing Parameters

One of the first things you'll need to figure out, after you've decided on the [HTTP Method](HTTP-Methods.md) to use, is how to supply data to the endpoint.

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

## Types of Parameters

### Path Parameter

This parameter is in the URI of the path, the web address so to speak.

**Typically, path parameters are used to pass in a resource identifier**. This is handy as it means you don't have to send a body for a simple GET request.

In our example request, which is a PATCH request, the path is:

```
api.move.mil/v1/shipments/01b9671e-b268
```

The code at the end `01b9671e-b268` identifies the shipment we are trying to update. You may have more than one ID in the path but it's recommended to keep the [URL length and depth constrained](URL-Design.md#url-depth).

### Query Parameter

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

### Body Parameter

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

### Header Parameter

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
- The `If-Match` header is used for [Concurrency Control or Optimistic Locking](Concurrency-Control.md).

## Conclusion

It's important to follow conventions related to the positioning of parameters. Many other tools and frameworks will depend on these conventions which will make client implementation and integration simpler and more robust.

- [Error Response Strategy](Error-Response-Strategy.md) - **COMPLETED**

# Key Takeaways

- Use a consistent error response strategy
- Have a default list of errors
- Your error code should not change, unlink messages, which can change.
- Consider readability by providing a list of errors and using strings for messages instead of integers.

## Terms

**Error/Code** — A unique, machine readable, identifier for the error.\
**Message** — A brief human-readable message.\
**Detail** — A lengthier explanation of the error.\
**Parameters / Path** — a description of which part of the request triggered the error.

### Strategy on returning consistent errors across the API

- You should always return consistent errors. This way your error
  handling code on the front end can be somewhat generic, instead of
  having to adapt to different response types based on the API.

- This is an argument in favor of returning a list of error objects,
  rather than a single error object, so that the front end doesn’t
  have to check every time what the shape of the error response is

### Example of error strategies for each type of error (i.e. server, client, validation, etc.)

#### Errors

Any logic or presentation of the error in the front end should be
based on the code here, never match against the message. Some people
use `ints` for this but a short string is more readable:

- 2123 vs. “MISSING_PARAMETER”

#### Messages

Messages are mainly used by developers who are reading a raw response,
errors presented to users can be switched on the “code” parameter.

Provide detail. It’s best to always return a list of errors, lists are
easier to read.

Consider adding parameters to your messages. This is most commonly
used for validation errors, describing what parameter in the request
is wrong. E.g. “submitter.email”

### Examples

_From Bing, a good error response:_

```json
{
  "SearchResponse": {
    "Version": "2.2",
    "Query": {
      "SearchTerms": "api error codes"
    },
    "Errors": [
      {
        "Code": 1001,
        "Message": "Required parameter is missing.",
        "Parameter": "SearchRequest.AppId",
        "HelpUrl": "http://msdn.microsoft.com/en-us/library/dd251042.aspx"
      }
    ]
  }
}
```

_From go, a bad error response:_

```
    Server error.
```

### Reporting validation errors

Validation issues can be global, per object, and per field and a single request can have multiple errors.
This is why it is important to be able return an array of errors.

We reccomend having a list of errors be the default, even in cases when there is only one error returned.
This simplifies client side code to be able to assume the top level format of error bodies.

You can tie individual errors to the invalid request using a “parameters/path” key

```json
{
  "errors": [
    {
      "Code": "PARAMETER_MISSING",
      "Message": "First name is missing.",
      "Parameter": "geek.firstname"
    },
    {
      "Code": "TOO_SHORT",
      "Message": "Phone number must be at least 10 digits.",
      "Parameter": "geek.phone_number"
    }
  ]
}
```

### Internationalizing errors

#### Best practice is to handle internationalization in the Front End

React uses the React-Intl library. Examples of how errors are

### Handling errors in API requests that affect multiple "objects"

If an API request could affect multiple “objects”, how are errors handled? Are all changes rolled back?

From [Rest Api Error Handling](https://alidg.me/blog/2016/9/24/rest-api-error-handling)

1. Define ranges for error codes
2. Define Resource Based Error Codes.
   That is, we use a string prefix for each error code and that prefix is determined by the resource itself.
   Example:

```json
{
  "status_code": 400,
  "reason_phrase": "Bad Request",
  "errors": [
    { "code": "geeks-2", "message": "The first_name is mandatory" },
    { "code": "geeks-3", "message": "The last_name is mandatory" }
  ]
}
```

### TODO: LIST TRADEOFFS in this document

## Topics for Discussion

- HTTP Status Code - how are we using them across [MilMove], are they used differently, provide examples..

### Resources

[Internationalization of API error messages](https://stackoverflow.com/questions/30109787/internationalization-of-api-error-messages-on-front-end-or-back-end)\
[Best practices for localization](https://www.at-it-translator.com/best-practicestips-for-software-application-and-game-localization/)\
[String Internationalization](https://docs.ckan.org/en/2.9/contributing/string-i18n.html)\
[Best practices for API error handling](https://nordicapis.com/best-practices-api-error-handling/)\
[Rest API Error Handling](https://www.baeldung.com/rest-api-error-handling-best-practices)

- How are requests for multiple nested objects handled? - **Sandy/Shimona to deliver 20201209**

  - Which IDs for which objects are required? It’s possible that in a nested set-up that some IDs for children could be found by the system without user input
  - Which IDs should be in the path?
    - May be able to reference this MilMove ADR: [0045-nesting-swagger-paths.md](https://github.com/transcom/mymove/blob/master/docs/adr/0045-nesting-swagger-paths.md)
  - Which object is considered the parent? Which object is most important from a data integrity perspective?
    - May be able to reference this MilMove ADR: [0049-etag-for-child-updates.md](https://github.com/transcom/mymove/blob/master/docs/adr/0049-etag-for-child-updates.md)
  - If an update fails for one of the nested objects, how will that affect the entire transaction? Should the entire update fail in that case?

- Versioning

  - How are we versioning the api and how does that effect work on any one endpoint?
  - When is it ok to make a breaking API change? How is that communicated?

- Batching, filtering and paginating results

  - How is filtering handled? And sorting!

- Security

  - What security considerations should I be aware of
  - What is/are valid authentication strategies for contacting the API?
  - Is CORS applicable? What client(s) can access it?
  - Is MTLS supported or required, how is authorization and revocation handled
  - How are permissions handled? What if there are different levels of permissions?

- Data coherence strategies

  - [Concurrency Control](Concurrency-Control.md) - **COMPLETED**
    - Optimistic Locking
  - Is the API data cached? Should the client cache it? When should it be refreshed?

  # [Engineering Playbook](../../../../README.md) / [Web Development](../../../README.md) / [API Guide](../../README.md) / [REST API Design](../README.md) / Concurrency Control

When you have more than one client using your API, you might want to think about concurrency control.

Consider any data a client can read and update on the server, let's call that a resource.

Most clients retrieve a copy of the resource, update it locally and then send the update some time later. If you have more than one client, it's possible for a client to send an update that is now out of date with changes on the server. It will unintentionally overwrite changes that others have made.

## Optimistic Locking

Optimistic locking is one strategy for handling this issue in your API.

In an optimistic locking scheme, you only allow a resource to be updated after you verify that the resource hasn't been modified since the client last checked.

You can do this with an _eTag_. An eTag is an identifier for the version of the underlying resource.

When the client requests a resource, you return an eTag that identifies the version they received. When they wish to update that resource, the eTag they send must match the current version in the database.

Read more, with diagrams, about [Optimistic Locking here](https://medium.com/swlh/api-concurrency-control-strategies-cd546c2cdc16).

### Optimistic Locking Example

#### Step 1 - Client requests resource

When the client requests information about a shipment, they get an etag for that version of the record.

Request:

```
GET /v1/shipments/99783f4d-ee83 HTTP/1.1
Host: api.move.mil
Content-Type: application/json
```

Response, notice the `eTag` value:

```
HTTP/1.1 200 OK
Content-Type: application/json
Body:
{
  "eTag": "MjAyMC0xMi0wMVQxODo1NjoxMy4zNjkxNzRa",
  "shipmentType": "UHAUL",
  "deliveryDate": "2020-06-01"
  "destinationAddress": {
    "streetAddress1": "812 S 129th Street",
    "city": "San Diego",
    "state": "CA",
    "postalCode": "92102"
  },
}

```

This eTag was created by hashing the last updated date of the record.

#### Step 2 - Client updates resource

Then when the client wishes to update this resource, they send the eTag in the `If-Match` header of the PUT or PATCH request.

Request, notice the `If-Match` in the header:

```
PATCH /v1/shipments/01b9671e-b268 HTTP/1.1
Host: api.move.mil
Content-Type: application/json
If-Match: MjAyMC0xMi0wMVQxODo1NjoxMy4zNjkxNzRa
Body:
{
    "shipmentType": "UPS",
    "deliveryDate": "2020-06-08"
}
```

If the eTag matches the resource in our database (which we can check by rehashing the lastUpdated date), we return a `200 Success` Response.

If the eTag does not match, we do not update the resource and we return the `412 Precondition Failed` response.

This would only happen if another client had updated the data in the meanwhile. The client must then re-request the data to get the latest eTag.

- Document your API
  - How are we documenting the api and what level of documentation is expected?
  - How should I indicate how an endpoint is supposed to be used? Is there a description template?

> Heavily borrowed from [https://apiguide.readthedocs.io/en/latest/preface.html](https://apiguide.readthedocs.io/en/latest/preface.html)
