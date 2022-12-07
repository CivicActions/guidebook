if (document.getElementById("rtd-search-form")) {
  document
    .getElementById("rtd-search-form")
    .firstElementChild.setAttribute("aria-label", "Search docs");
}

if (document.getElementById("mkdocs-search-query")) {
  document
    .getElementById("mkdocs-search-query")
    .setAttribute("aria-label", "Search the Docs");
}
