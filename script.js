/* UniDeb Unofficial — shared interactivity
   Adds: live search, file-type icons, copy-link buttons,
   collapsible + counted sections, per-page progress tracking
   (localStorage), scroll-reveal animation, an image lightbox,
   a back-to-top button, and a "/" keyboard shortcut for search.
   Nothing here touches the "Semester 1" files themselves. */

(function () {
  "use strict";

  document.addEventListener("DOMContentLoaded", () => {
    initFileIcons();
    initCopyButtons();
    initSections();
    initFileSearch();
    initSubjectSearch();
    initProgress();
    initReveal();
    initLightbox();
    initBackToTop();
    initKeyboardShortcuts();
  });

  /* ---------- File-type icons ---------- */
  function extIcon(href) {
    const clean = (href || "").split("?")[0].split("#")[0];
    const ext = clean.split(".").pop().toLowerCase();
    const map = {
      pdf: "📄",
      py: "🐍",
      txt: "📝",
      md: "📝",
      html: "🌐",
      htm: "🌐",
      jpg: "🖼️",
      jpeg: "🖼️",
      png: "🖼️",
      gif: "🖼️",
      webp: "🖼️",
      xlsx: "📊",
      xls: "📊",
      csv: "📊",
      ppt: "📽️",
      pptx: "📽️",
      zip: "🗜️",
      rar: "🗜️",
      xml: "⚙️",
      iml: "⚙️",
      gitignore: "⚙️",
      java: "☕",
      js: "📜",
      doc: "📃",
      docx: "📃",
      sql: "🗄️",
      mhtml: "🌐",
    };
    return map[ext] || "📄";
  }

  function initFileIcons() {
    document.querySelectorAll(".file-list li a:not(.resource-folder)").forEach((a) => {
      const icon = document.createElement("span");
      icon.className = "file-icon";
      icon.setAttribute("aria-hidden", "true");
      icon.textContent = extIcon(a.getAttribute("href"));
      a.prepend(icon);
    });

    document.querySelectorAll(".resource-folder").forEach((a) => {
      const icon = document.createElement("span");
      icon.className = "file-icon";
      icon.setAttribute("aria-hidden", "true");
      icon.textContent = "📁";
      a.prepend(icon);
    });
  }

  /* ---------- Copy-link buttons ---------- */
  function showToast(msg) {
    let toast = document.getElementById("toast");
    if (!toast) {
      toast = document.createElement("div");
      toast.id = "toast";
      document.body.appendChild(toast);
    }
    toast.textContent = msg;
    toast.classList.add("show");
    clearTimeout(showToast._t);
    showToast._t = setTimeout(() => toast.classList.remove("show"), 1600);
  }

  function initCopyButtons() {
    const anchors = document.querySelectorAll(".file-list li a");
    anchors.forEach((a) => {
      const wrapper = document.createElement("div");
      wrapper.className = "file-row";
      a.parentNode.insertBefore(wrapper, a);
      wrapper.appendChild(a);

      const btn = document.createElement("button");
      btn.type = "button";
      btn.className = "copy-btn";
      btn.title = "Copy link to this file";
      btn.setAttribute("aria-label", "Copy link");
      btn.textContent = "⧉";
      btn.addEventListener("click", () => {
        const url = new URL(a.getAttribute("href"), location.href).href;
        if (navigator.clipboard && navigator.clipboard.writeText) {
          navigator.clipboard
            .writeText(url)
            .then(() => showToast("Link copied"))
            .catch(() => showToast("Could not copy link"));
        } else {
          showToast("Could not copy link");
        }
      });
      wrapper.appendChild(btn);
    });
  }

  /* ---------- Collapsible + counted sections ---------- */
  function initSections() {
    const sections = document.querySelectorAll(".section");
    if (!sections.length) return;

    const storeKey = "unideb-collapsed-" + location.pathname;
    let collapsed = {};
    try {
      collapsed = JSON.parse(localStorage.getItem(storeKey) || "{}");
    } catch (e) {
      collapsed = {};
    }

    sections.forEach((sec) => {
      const h2 = sec.querySelector("h2");
      if (!h2) return;

      const key = h2.childNodes[0] ? h2.childNodes[0].textContent.trim() : h2.textContent.trim();
      const count = sec.querySelectorAll(".file-list > li, .image-gallery > *").length;

      const meta = document.createElement("span");
      meta.className = "h2-meta";

      if (count) {
        const badge = document.createElement("span");
        badge.className = "count-badge";
        badge.textContent = count + (count === 1 ? " item" : " items");
        meta.appendChild(badge);
      }

      const chevron = document.createElement("span");
      chevron.className = "chevron";
      chevron.setAttribute("aria-hidden", "true");
      chevron.textContent = "▾";
      meta.appendChild(chevron);

      h2.appendChild(meta);
      h2.classList.add("collapsible");
      h2.setAttribute("role", "button");
      h2.setAttribute("tabindex", "0");

      const body = Array.from(sec.children).filter((el) => el !== h2);

      function apply() {
        const isCollapsed = !!collapsed[key];
        sec.classList.toggle("collapsed", isCollapsed);
        body.forEach((el) => {
          el.style.display = isCollapsed ? "none" : "";
        });
      }

      function toggle() {
        collapsed[key] = !collapsed[key];
        localStorage.setItem(storeKey, JSON.stringify(collapsed));
        apply();
      }

      h2.addEventListener("click", toggle);
      h2.addEventListener("keydown", (e) => {
        if (e.key === "Enter" || e.key === " ") {
          e.preventDefault();
          toggle();
        }
      });

      apply();
    });
  }

  /* ---------- Search: file list pages ---------- */
  function itemText(item) {
    let text = item.textContent.trim();
    if (!text) {
      const img = item.tagName === "IMG" ? item : item.querySelector("img");
      if (img) text = img.alt || "";
    }
    return text.toLowerCase();
  }

  function initFileSearch() {
    const input = document.getElementById("fileSearch");
    if (!input) return;

    const sections = document.querySelectorAll(".section");
    const noResults = document.createElement("p");
    noResults.className = "no-results";
    noResults.textContent = "No files match your search.";
    input.closest(".search-bar").after(noResults);

    input.addEventListener("input", () => {
      const q = input.value.trim().toLowerCase();
      let anyPageMatch = false;

      sections.forEach((sec) => {
        const items = sec.querySelectorAll(".file-list > li, .image-gallery > *");
        let anyVisible = false;

        items.forEach((item) => {
          const match = !q || itemText(item).includes(q);
          item.style.display = match ? "" : "none";
          if (match) anyVisible = true;
        });

        if (items.length) {
          sec.style.display = anyVisible ? "" : "none";
          if (anyVisible) anyPageMatch = true;
        } else {
          anyPageMatch = true;
        }
      });

      noResults.style.display = q && !anyPageMatch ? "" : "none";
    });
  }

  /* ---------- Search: homepage subject cards ---------- */
  function initSubjectSearch() {
    const input = document.getElementById("subjectSearch");
    if (!input) return;

    const cards = document.querySelectorAll(".subject-card");
    input.addEventListener("input", () => {
      const q = input.value.trim().toLowerCase();
      cards.forEach((card) => {
        const match = !q || card.textContent.toLowerCase().includes(q);
        card.style.display = match ? "" : "none";
      });
    });
  }

  /* ---------- "Opened" progress tracking ---------- */
  function initProgress() {
    const links = document.querySelectorAll(".content a[href]");
    if (!links.length) return;

    const pageKey = "unideb-opened-" + location.pathname;
    let opened = [];
    try {
      opened = JSON.parse(localStorage.getItem(pageKey) || "[]");
    } catch (e) {
      opened = [];
    }

    function isOpened(href) {
      return opened.indexOf(href) !== -1;
    }

    function markOpened(href) {
      if (!isOpened(href)) {
        opened.push(href);
        localStorage.setItem(pageKey, JSON.stringify(opened));
      }
    }

    function updateBar() {
      const bar = document.getElementById("progressBar");
      if (!bar) return;
      const total = links.length;
      let done = 0;
      links.forEach((a) => {
        if (isOpened(a.getAttribute("href"))) done++;
      });
      const pct = total ? Math.round((done / total) * 100) : 0;
      bar.querySelector(".progress-fill").style.width = pct + "%";
      bar.querySelector(".progress-text").textContent =
        done + " / " + total + " resources opened (" + pct + "%)";
    }

    function applyStyles() {
      links.forEach((a) => {
        a.classList.toggle("opened", isOpened(a.getAttribute("href")));
      });
      updateBar();
    }

    links.forEach((a) => {
      a.addEventListener("click", () => {
        markOpened(a.getAttribute("href"));
        applyStyles();
      });
    });

    applyStyles();
  }

  /* ---------- Scroll-reveal ---------- */
  function initReveal() {
    if (!("IntersectionObserver" in window)) return;
    const items = document.querySelectorAll(".section, .subject-card");
    if (!items.length) return;

    const obs = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const el = entry.target;
            el.classList.add("is-visible");
            obs.unobserve(el);
            el.addEventListener(
              "transitionend",
              () => el.classList.remove("reveal", "is-visible"),
              { once: true }
            );
          }
        });
      },
      { threshold: 0.08 }
    );

    items.forEach((item) => {
      item.classList.add("reveal");
      obs.observe(item);
    });
  }

  /* ---------- Image lightbox ---------- */
  function initLightbox() {
    const imgs = Array.from(document.querySelectorAll(".image-gallery img"));
    if (!imgs.length) return;

    let current = 0;

    const overlay = document.createElement("div");
    overlay.className = "lightbox-overlay";
    overlay.innerHTML =
      '<button type="button" class="lightbox-close" aria-label="Close">✕</button>' +
      '<button type="button" class="lightbox-prev" aria-label="Previous image">‹</button>' +
      '<img class="lightbox-img" src="" alt="" />' +
      '<button type="button" class="lightbox-next" aria-label="Next image">›</button>' +
      '<div class="lightbox-caption"></div>';
    document.body.appendChild(overlay);

    const imgEl = overlay.querySelector(".lightbox-img");
    const caption = overlay.querySelector(".lightbox-caption");
    const prevBtn = overlay.querySelector(".lightbox-prev");
    const nextBtn = overlay.querySelector(".lightbox-next");

    if (imgs.length <= 1) {
      prevBtn.style.display = "none";
      nextBtn.style.display = "none";
    }

    function show(idx) {
      current = (idx + imgs.length) % imgs.length;
      const img = imgs[current];
      imgEl.src = img.getAttribute("src");
      imgEl.alt = img.alt || "";
      const label = img.alt || "";
      caption.textContent = imgs.length > 1 ? label + " (" + (current + 1) + "/" + imgs.length + ")" : label;
      overlay.classList.add("open");
    }

    function close() {
      overlay.classList.remove("open");
    }

    imgs.forEach((img, idx) => {
      img.style.cursor = "zoom-in";
      img.addEventListener("click", (e) => {
        e.preventDefault();
        show(idx);
      });
      const parentA = img.closest("a");
      if (parentA) {
        parentA.addEventListener("click", (e) => e.preventDefault());
      }
    });

    prevBtn.addEventListener("click", () => show(current - 1));
    nextBtn.addEventListener("click", () => show(current + 1));
    overlay.querySelector(".lightbox-close").addEventListener("click", close);
    overlay.addEventListener("click", (e) => {
      if (e.target === overlay) close();
    });

    document.addEventListener("keydown", (e) => {
      if (!overlay.classList.contains("open")) return;
      if (e.key === "Escape") close();
      if (e.key === "ArrowRight") show(current + 1);
      if (e.key === "ArrowLeft") show(current - 1);
    });
  }

  /* ---------- Back to top ---------- */
  function initBackToTop() {
    const btn = document.createElement("button");
    btn.type = "button";
    btn.id = "backToTop";
    btn.setAttribute("aria-label", "Back to top");
    btn.textContent = "↑";
    document.body.appendChild(btn);

    window.addEventListener("scroll", () => {
      btn.classList.toggle("visible", window.scrollY > 400);
    });

    btn.addEventListener("click", () => {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  }

  /* ---------- Keyboard shortcuts ---------- */
  function initKeyboardShortcuts() {
    document.addEventListener("keydown", (e) => {
      const tag = document.activeElement ? document.activeElement.tagName : "";
      const typing = tag === "INPUT" || tag === "TEXTAREA";

      if (!typing && e.key === "/") {
        const input = document.getElementById("fileSearch") || document.getElementById("subjectSearch");
        if (input) {
          e.preventDefault();
          input.focus();
        }
      }

      if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === "k") {
        const input = document.getElementById("fileSearch") || document.getElementById("subjectSearch");
        if (input) {
          e.preventDefault();
          input.focus();
        }
      }
    });
  }
})();
