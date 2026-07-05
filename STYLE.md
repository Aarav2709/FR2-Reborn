# Code Style Guidelines

This document outlines some of the styling choices used throughout the codebase.
It is somewhat opinionated and ever-evolving.

## Common

### .editorconfig

- Content must not exceed 80 characters, unless there's a URL, heading, table,
  or the like.
- Files must end with a newline
- Use two-space indention

### Other

- Avoid using abbreviations in file names, e.g. `syntax-highlighting.css` is
  preferred over `code-hl.css`.
- Avoid using uncommon code comment prefixes such as `HACK:`, `FIX:`, and etc.
- Double quotes are always preferred over single quotes.
- Mark to-do code comments with `TODO:`
- Multi sentence code comments must end with a full stop and use proper
  punctuation
- One-sentence code comments must not end with a full stop

## CSS

- Avoid using abbreviations in classes and IDs, e.g. `.article-list` is
  preferred over `.art-ls`, `#comments-heading` over `#comm-head`, and etc.
- Keep zeros in non-whole values (0.5rem and not .5rem)
- Rules must be sorted according to [Concentric CSS](https://rhodesmill.org/brandon/2011/concentric-css/)
- Use logical properties such as `margin-block-start` rather than `margin-top`
- Use older color syntax for better compat, e.g. `hsla(0, 50%, 70%, 0.5)`
  instead of `hsl(0 50% 70% / 0.5)`.

## HTML

- Don't omit "optional" tags
- Include the `type` attribute for scripts and stylesheets
- Use [XHTML](https://developer.mozilla.org/en-US/docs/Glossary/XHTML) even if
  HTML minifier turns it into HTML5
- Use double quotes unless they are nested, in which case use single quotes.
- Use IDs for elements you're certain won't occur more than once per page
- Use parent-id/class + child-suffix-id/class for children IDs and classes if
  styling is deeply tied with parent (`.some-widget` and `.some-widget-title`)
- Use semantic HTML unless there's a _very_ good reason not to

## JavaScript

- Use [camelCase](https://developer.mozilla.org/en-US/docs/Glossary/Camel_case)
  for function and variable names
- Use double quotes unless they are nested, in which case use single quotes.

## Markdown

- Don't set IDs on headings unless absolutely needed
- Don't use indention-based code blocks, use backticks instead.
- Indent multi-line list items with two spaces, e.g:
  ```
  - This line is so long, it wraps
    to a new line.
  ```
- Italic text should be written as `*italic*`, as opposed to the somewhat common
  `_italic_` convention. This is to keep it consistent with the way `**bold**`
  text is written.
- Keep empty newlines before and after # Headings
- List items should end with a full stop if it's a full sentence
- Only use one Level 1 heading per page
- Prefer use of normal characters instead of "proper", e.g. use straight quotes
  instead of curly quotes, triple dot instead of an ellipsis, triple dash
  instead of an em dash, and etc. These will be converted to proper variants
  during render, see [CommonMark's smart punctuation](https://pulldown-cmark.github.io/pulldown-cmark/third_party/smart_punct.html).
- Set langauge on code blocks unless it's plaintext or some obscure langauge
- Short list items must not end with a full stop
- Use `<https://example.org>` link syntax if link name wouldn't provide any
  useful context

## Git

- Avoid using prefixes such as `chore:`, `fix:`, `feat:`, and the like.
- Commit body should end with a full stop and use proper capitalization
- Try to not exceed 70 character limit in commits
- Use `(fixes #some-issue)` or `(closes #some-issue)` when applicable
