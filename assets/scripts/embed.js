// docs/javascripts/embeds.js
(function () {
  const fitOne = (wrap) => {
    if (!wrap) return;
    const rect = wrap.getBoundingClientRect();
    const vh = window.innerHeight || document.documentElement.clientHeight;
    const bottomGap = 24; // px space below
    const h = Math.max(360, Math.floor(vh - rect.top - bottomGap));
    wrap.style.height = h + 'px';
  };

  const fitAll = () => {
    document.querySelectorAll('.cf-embed__framewrap').forEach(fitOne);
  };

  // Run on load & resize
  window.addEventListener('load', fitAll, { once: true });
  window.addEventListener('resize', fitAll);

  // Re-run after MkDocs Material swaps page content
  document.addEventListener('md-content-updated', fitAll);

  // Extra safety: watch the main content node for changes
  const contentRoot = document.querySelector('[data-md-component="content"]') || document.body;
  new MutationObserver(() => requestAnimationFrame(fitAll))
    .observe(contentRoot, { childList: true, subtree: true });
})();
