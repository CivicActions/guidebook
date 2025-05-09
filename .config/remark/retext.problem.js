"use strict";

// This is inspired by https://github.com/sparkartgroup/quality-docs/

import { unified } from "unified";
import remark2retext from "remark-retext";
import english from "retext-english";
import quotes from "retext-quotes";
import sentenceSpacing from "retext-sentence-spacing";
import repeated from "retext-repeated-words";
import indefinite from "retext-indefinite-article";
import remarkGfm from "remark-gfm";

export default attacher;

function attacher() {
  this.use(
    remarkGfm,
    remark2retext,
    unified()
      .use(english)
      .use(sentenceSpacing, { preferred: 1 })
      .use(quotes, { preferred: "straight" })
      .use(repeated)
      .use(indefinite),
  );
}
