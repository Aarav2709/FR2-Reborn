// Based on https://github.com/cydave/zola-theme-papermod/blob/fab7cd04833f0c78264b433a4fb1f4b999ef0399/static/js/search.js

// Debounce function definition
function debounce(func, wait, immediate) {
  var timeout;
  return function () {
    var context = this,
      args = arguments;
    var later = function () {
      timeout = null;
      if (!immediate) func.apply(context, args);
    };
    var callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
    if (callNow) func.apply(context, args);
  };
}

// Taken from mdbook
// The strategy is as follows:
// First, assign a value to each word in the document:
//  Words that correspond to search terms (stemmer aware): 40
//  Normal words: 2
//  First word in a sentence: 8
// Then use a sliding window with a constant number of words and count the
// sum of the values of the words within the window. Then use the window that got the
// maximum sum. If there are multiple maximas, then get the last one.
// Enclose the terms in <b>.
function makeTeaser(body, terms) {
  var TERM_WEIGHT = 40;
  var NORMAL_WORD_WEIGHT = 2;
  var FIRST_WORD_WEIGHT = 8;
  var TEASER_MAX_WORDS = 30;

  var stemmedTerms = terms.map(function (w) {
    return elasticlunr.stemmer(w.toLowerCase());
  });
  var termFound = false;
  var index = 0;
  var weighted = []; // contains elements of ["word", weight, index_in_document]

  // split in sentences, then words
  var sentences = body.toLowerCase().split(". ");

  for (var i in sentences) {
    var words = sentences[i].split(" ");
    var value = FIRST_WORD_WEIGHT;

    for (var j in words) {
      var word = words[j];

      if (word.length > 0) {
        for (var k in stemmedTerms) {
          if (elasticlunr.stemmer(word).startsWith(stemmedTerms[k])) {
            value = TERM_WEIGHT;
            termFound = true;
          }
        }
        weighted.push([word, value, index]);
        value = NORMAL_WORD_WEIGHT;
      }

      index += word.length;
      index += 1; // ' ' or '.' if last word in sentence
    }

    index += 1; // because we split at a two-char boundary '. '
  }

  if (weighted.length === 0) {
    return body;
  }

  var windowWeights = [];
  var windowSize = Math.min(weighted.length, TEASER_MAX_WORDS);
  // We add a window with all the weights first
  var curSum = 0;
  for (var i = 0; i < windowSize; i++) {
    curSum += weighted[i][1];
  }
  windowWeights.push(curSum);

  for (var i = 0; i < weighted.length - windowSize; i++) {
    curSum -= weighted[i][1];
    curSum += weighted[i + windowSize][1];
    windowWeights.push(curSum);
  }

  // If we didn't find the term, just pick the first window
  var maxSumIndex = 0;
  if (termFound) {
    var maxFound = 0;
    // backwards
    for (var i = windowWeights.length - 1; i >= 0; i--) {
      if (windowWeights[i] > maxFound) {
        maxFound = windowWeights[i];
        maxSumIndex = i;
      }
    }
  }

  var teaser = [];
  var startIndex = weighted[maxSumIndex][2];
  for (var i = maxSumIndex; i < maxSumIndex + windowSize; i++) {
    var word = weighted[i];
    if (startIndex < word[2]) {
      // missing text from index to start of `word`
      teaser.push(body.substring(startIndex, word[2]));
      startIndex = word[2];
    }

    // add <strong> around search terms
    if (word[1] === TERM_WEIGHT) {
      teaser.push("<strong>");
    }
    startIndex = word[2] + word[0].length;
    teaser.push(body.substring(word[2], startIndex));

    if (word[1] === TERM_WEIGHT) {
      teaser.push("</strong>");
    }
  }
  teaser.push("…");
  return teaser.join("");
}

function formatSearchResultItem(item, terms) {
  // Adjust this to match your desired result item structure
  return (
    '<div class="item">' +
    `<a href="${item.ref}">${item.doc.title}</a>` +
    `<span>${makeTeaser(item.doc.body, terms)}</span>` +
    "</div>"
  );
}

function initSearch() {
  var searchModal = document.getElementById("search-modal"); // Full-screen modal
  var searchModalContent = document.getElementById("search-modal-content"); // Actual modal box
  var searchInput = document.getElementById("search-input"); // Search input
  var searchResults = document.getElementById("search-results"); // Search results
  var searchButton = document.getElementById("search"); // Search button
  var MAX_ITEMS = 10;

  var options = {
    bool: "AND",
    fields: {
      title: { boost: 2 },
      body: { boost: 1 },
    },
  };
  var currentTerm = "";
  var index;

  var initIndex = async function () {
    if (index === undefined) {
      if (typeof window.searchIndex !== "undefined") {
        index = elasticlunr.Index.load(window.searchIndex);
      } else {
        let response = await fetch(
          `/search_index.${document.documentElement.lang}.json`,
        );
        index = elasticlunr.Index.load(await response.json());
      }
    }
    return index;
  };

  // Open search modal when clicking the search button
  if (searchButton) {
    searchButton.addEventListener("click", function () {
      searchModal.classList.add("active");
      searchModal.addEventListener(
        "transitionend",
        function handler() {
          searchInput.focus();
          searchModal.removeEventListener("transitionend", handler);
        },
        { once: true },
      );
    });
  }

  // Open search modal on "/" key press
  window.addEventListener("keydown", (event) => {
    if (
      event.key === "/" &&
      document.activeElement.tagName !== "INPUT" &&
      document.activeElement.tagName !== "TEXTAREA"
    ) {
      event.preventDefault();
      searchModal.classList.add("active");
      searchModal.addEventListener(
        "transitionend",
        function handler() {
          searchInput.focus();
          searchModal.removeEventListener("transitionend", handler);
        },
        { once: true },
      );
    }
  });

  // Close search modal on Escape key
  window.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      searchModal.classList.remove("active");
    }
  });

  // Close search modal when clicking outside search-modal-content
  searchModal.addEventListener("click", function (e) {
    if (!searchModalContent.contains(e.target)) {
      searchModal.classList.remove("active");
    }
  });

  // Prevent clicks inside modal content from closing it
  searchModalContent.addEventListener("click", function (e) {
    e.stopPropagation(); // Stops event from reaching searchModal click handler
  });

  // Search input event
  searchInput.addEventListener(
    "keyup",
    debounce(async function () {
      var term = searchInput.value.trim();
      if (term === currentTerm) return;

      searchResults.style.display = term === "" ? "none" : "flex";
      searchResults.innerHTML = ""; // Clear previous results
      currentTerm = term;
      if (term === "") return;

      var results = (await initIndex()).search(term, options);
      if (results.length === 0) {
        searchResults.style.display = "none";
        return;
      }

      // Insert formatted search result items
      for (var i = 0; i < Math.min(results.length, MAX_ITEMS); i++) {
        searchResults.innerHTML += formatSearchResultItem(
          results[i],
          term.split(" "),
        );
      }
    }, 150),
  );
}

if (
  document.readyState === "complete" ||
  (document.readyState !== "loading" && !document.documentElement.doScroll)
) {
  initSearch();
} else {
  document.addEventListener("DOMContentLoaded", initSearch);
}
