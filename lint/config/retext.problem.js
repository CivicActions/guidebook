"use strict";

// This is inspired by https://github.com/sparkartgroup/quality-docs/

var unified = import("unified");
var remark2retext = import("remark-retext");
var english = import("retext-english");
var quotes = import("retext-quotes");
var sentenceSpacing = import("retext-sentence-spacing");
var repeated = import("retext-repeated-words");
var indefinite = import("retext-indefinite-article");

module.exports = attacher;

function attacher() {
  this.use(
    remark2retext,
    unified()
      .use(english)
      .use(sentenceSpacing, { preferred: 1 })
      .use(quotes, { preferred: "straight" })
      .use(repeated)
      .use(indefinite)
  );
}
