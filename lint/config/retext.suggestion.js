"use strict";

// This is inspired by https://github.com/sparkartgroup/quality-docs/

var unified = import("unified");
var remark2retext = import("remark-retext");
var english = import("retext-english");
var contractions = import("retext-contractions");
var readability = import("retext-readability");
var simplify = import("retext-simplify");
var equality = import("retext-equality");

var ignoreWords = [];

module.exports = attacher;

function attacher() {
  this.use(
    remark2retext,
    unified()
      .use(english)
      .use(contractions, { straight: true })
      .use(readability, {
        age: 18,
        minWords: 15,
        severity: "fatal",
        threshold: 5 / 7,
      })
      .use(equality, { ignore: ignoreWords || [] })
  );
}
