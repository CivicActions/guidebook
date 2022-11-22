if (document.getElementById("rtd-search-form")) {
  document
    .getElementById("rtd-search-form")
    .firstElementChild.setAttribute("aria-label", "Search docs");
}

if (document.getElementById("content_search")) {
  document
    .getElementById("content_search")
    .getElementsByTagName("input")[0]
    .setAttribute("aria-label", "Search the Docs");
}
