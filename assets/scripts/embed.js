(function () {
  function fitAll() {
    document.querySelectorAll('.cf-embed__framewrap').forEach(fitOne);
  }

  function fitOne(wrap) {
    // distance from top of viewport to top of wrapper
    const rect = wrap.getBoundingClientRect();
    const viewportH = window.innerHeight || document.documentElement.clientHeight;

    // leave a little breathing room below
    const bottomMargin = 24; // px
    const height = Math.max(360, Math.floor(viewportH - rect.top - bottomMargin));

    wrap.style.height = height + 'px';
  }

  // initial + on resize + after Material reloads content
  window.addEventListener('load', fitAll, { once: true });
  window.addEventListener('resize', fitAll);

  // MkDocs Material swaps content on navigation; re-fit after DOM updates
  document.addEventListener('DOMContentLoaded', fitAll);
  document.addEventListener('md-content-updated', fitAll);
})();