"use strict";

// This is inspired by https://github.com/sparkartgroup/quality-docs/

import { unified } from "unified";
import remark2retext from "remark-retext";
import english from "retext-english";
import contractions from "retext-contractions";
import readability from "retext-readability";
import simplify from "retext-simplify";
import equality from "retext-equality";

var ignoreWords = [];

export default attacher;

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
      .use(equality, { ignore: ignoreWords || [] }),
  );
}
