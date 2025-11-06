// docs/javascripts/embeds.js
(function () {
  function explicitHeight(wrap) {
    // 1) data attribute wins
    if (wrap.dataset && wrap.dataset.cfHeight) return wrap.dataset.cfHeight.trim();

    // 2) CSS var fallback
    const h = getComputedStyle(wrap).getPropertyValue('--cf-embed-height').trim();
    return h || null;
  }

  const fitOne = (wrap) => {
    if (!wrap) return;

    // Respect hard override if provided
    const fixed = explicitHeight(wrap);
    if (fixed) {
      wrap.style.height = fixed;   // e.g., "180vh" or "1200px"
      return;
    }

    // Auto-fit to remaining viewport height
    const rect = wrap.getBoundingClientRect();
    const vh = window.innerHeight || document.documentElement.clientHeight;
    const bottomGap = 24; // px
    const h = Math.max(360, Math.floor(vh - rect.top - bottomGap));
    wrap.style.height = h + 'px';
  };

  const fitAll = () => {
    document.querySelectorAll('.cf-embed__framewrap').forEach(fitOne);
  };

  window.addEventListener('load', fitAll, { once: true });
  window.addEventListener('resize', fitAll);
  document.addEventListener('md-content-updated', fitAll);

  const root = document.querySelector('[data-md-component="content"]') || document.body;
  new MutationObserver(() => requestAnimationFrame(fitAll))
    .observe(root, { childList: true, subtree: true });
})();
