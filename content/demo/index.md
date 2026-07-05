+++
title = "Demo"
[extra]
styles = ["demo/demo.css"]
scripts = ["demo/demo.js"]
archive = "This page is in fact not archived. It is only here to demonstrate the archival statement."
trigger = "This page contains blackjack and hookers, and bad jokes such as this one."
disclaimer = """
- All tricks in this page are performed by the lab boys, don't try this at home.
- Don't expose yourself to 4000° kelvin.
- Don't take party escort submission position.
- Don't interact with asbestos and moon rocks.
- Don't visit [aperturescience.com](https://www.aperturescience.com).
"""
toc = true
backlinks = true
audio_button = true
+++

## Markdown

Text can be **bold**, *italic*, ~~strikethrough~~, and ***~~all at the same time~~***.

[Link to another page](@/demo/page.md).

There should be whitespace between paragraphs[^1].

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

This is a normal paragraph[^2] following a header.

😭😂🥺🤣❤️✨🙏😍🥰😊

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

> "Original content is original only for a few seconds before getting old"
> > Rule #21 of the internet

- Item 1
- Item 2
  - Item 2.1
  - Item 2.2
- Item 3
- `Item 4`

1. Perform step #1
2. Proceed to step #2
3. Conclude with step #3

- [ ] Milk
- [x] Eggs
- [x] Flour
- [ ] Coffee
- [x] Combustible lemons

[![Rough Ametrine from Bolivia.](https://files.catbox.moe/7uisx8.jpg)](https://www.geologyin.com/2021/04/the-colorful-charm-of-ametrine.html)

| Character    | Show               | Quotes                            |
| :----------- | :----------------- | :-------------------------------- |
| Derpy Hooves | My Little Pony     | I just don't know what went wrong |
| Gir          | Invader ZIM        | GUESS WHO MADE WAAAAFFLES?!!      |
| WALL-E       | WALL-E             | Ooooo 0.0                         |
| Taco         | Inanimate Insanity | SOUR CREAM!                       |

```rust
let highlight = true;
```

```scss, linenos, linenostart=10, hl_lines=3-4 8-9, hide_lines=2 7
pre mark {
  // If you want your highlights to take the full width
  display: block;
  color: currentcolor;
}
pre table td:nth-of-type(1) {
  // Select a colour matching your theme
  color: #6b6b6b;
  font-style: italic;
}
```

> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.

***

## Shortcodes

Ametrine provides a few useful [shortcodes](https://www.getzola.org/documentation/content/shortcodes/) that simplify some tasks. They can be used on all pages.

### Custom Alerts

> [!NOTE]
> As of version 0.21.0, Zola supports [GitHub flavored alerts](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts) natively, without this shortcode. It can be enabled by adding the following to `config.toml`:
>
> ```toml
> [markdown]
> github_alerts = true
> ```

Required variables are:

- `icon`: Icon from [phosphoricons.com](https://phosphoricons.com) that will be used in the alert.
- `title`: Title of the alert.

Optional variables are:

- `color`: Color that the alert should be colored into. Available colors are: `red`, `orange`, `yellow`, `green`, `blue`, and `purple`.

```jinja
{%/* alert(icon="warning", title="Fake Warning XD", color="yellow") */%}
-> Alert text <-
{%/* end */%}
```

{% alert(icon="warning", title="Fake Warning XD", color="yellow") %}
Hi, I'm a fake custom alert.

- I'm a list with an [inline](https://example.org) link.
{% end %}

### Images and Videos

By default images and videos come with some generic styling, such as rounded corners and shadow. To fine-tune these, you can use shortcodes with different variable combinations.

Available variables are:

- `url`: URL to an image.
- `url_min`: URL to compressed version of an image, original can be opened by clicking on the image.
- `alt`: Alt text, same as if the text were inside square brackets in Markdown.
- `full`: Forces image to be full-width.
- `start`: Float image to the start of paragraph and scale it down.
- `end`: Float image to the end of paragraph and scale it down.
- `pixels`: Uses nearest neighbor algorithm for scaling, useful for keeping pixel-art sharp.
- `transparent`: Removes rounded corners and shadow, useful for images with transparency.
- `drop_shadow`: Uses drop shadow instead of box shadow, useful for images with transparency.
- `no_hover`: Removes zoom on hover.
- `spoiler`: Blurs image until hovered over/pressed on, useful for plot rich game screenshots.
- `spoiler` with `solid`: Ditto, but makes the image completely hidden.

```jinja
{{/* image(url="image.png", alt="This is an image", no_hover=true) */}}
```

<figure>
{{ image(url="https://i1.theportalwiki.net/img/2/23/Ashpd_blueprint.jpg", alt="Portal Gun blueprint", no_hover=true) }}
<figcaption>Image with an alt text and without zoom on hover</figcaption>
</figure>

<figure>
{{ image(url="https://upload.wikimedia.org/wikipedia/commons/b/b4/JPEG_example_JPG_RIP_100.jpg", url_min="https://upload.wikimedia.org/wikipedia/commons/3/38/JPEG_example_JPG_RIP_010.jpg", alt="The gravestone of J.P.G.", no_hover=true) }}
<figcaption>Image with compressed version, an alt text, and without zoom on hover</figcaption>
</figure>

<figure>
{{ image(url="https://files.catbox.moe/lk7nee.jpg", alt="Portal Gun blueprint", spoiler=true) }}
<figcaption>Image with an alt text, hidden behind a spoiler</figcaption>
</figure>

Alternatively, you can append the following URL anchors. It can be more handy in some cases, e.g. such images will render normally in any Markdown editor, opposed to the Zola shortcodes.

- `#full`: Forces image to be full-width.
- `#start`: Float image to the start of paragraph and scale it down.
- `#end`: Float image to the end of paragraph and scale it down.
- `#pixels`: Uses nearest neighbor algorithm for scaling, useful for keeping pixel-art sharp.
- `#transparent`: Removes rounded corners and shadow, useful for images with transparency.
- `#drop-shadow`: Uses drop shadow instead of box shadow, useful for images with transparency.
- `#no-hover`: Removes zoom on hover.
- `#spoiler`: Blurs image until hovered over/pressed on, useful for plot rich game screenshots.
- `#spoiler` with `#solid`: Ditto, but makes the image completely hidden.

<br />
<figure>

[![Toolbx header image](https://containertoolbx.org/assets/toolbx.gif#full#pixels#transparent#drop-shadow#no-hover)](https://containertoolbx.org)
<figcaption>Full-width image with an alt text, pixel-art rendering, drop shadow, and with no rounded corners and zoom on hover</figcaption>
</figure>

<br />

![2005 Ford Mustang V6 Premium Convertible](https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/2005_Ford_Mustang_V6_Premium_Convertible.jpg/330px-2005_Ford_Mustang_V6_Premium_Convertible.jpg#start)
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri tamen permagna accessio potest, si aliquod aeternum et infinitum impendere malum nobis opinemur.

For videos it's all the same except for a few differences: `no_hover` and `url_min` variables are not available.

Additionally, the following [attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attributes) can be set:

- `autoplay`: Start playing the video automatically.
- `controls`: Display video controls such as volume control, seeking and pause/resume.
- `loop`: Play the video again once it ends.
- `muted`: Turn off the audio by default.
- `playsinline`: Prevent the video from playing in fullscreen by default (depends on the browser).

```jinja
{{/* video(url="video.webm", alt="This is a video", controls=true) */}}
```

<figure>
{{ video(url="https://upload.wikimedia.org/wikipedia/commons/transcoded/0/0e/Duckling_preening_%2881313%29.webm/Duckling_preening_%2881313%29.webm.720p.vp9.webm", alt="Duckling preening", controls=true) }}
<figcaption>Duckling preening</figcaption>
</figure>

### CRT

Alright, this one doesn't simplify anything, it just puts ASCII art into a CRT-like box.

> [!NOTE]
> As this element is intended to be purely decorative (e.g. for displaying ASCII art), it is hidden from screen readers unless a `label` is supplied. Ensure that no vital content is wrapped in it.

```jinja
{%/* crt(label = "ASCII illustration of public library halls.") */%}
-> ASCII art <-
{%/* end */%}
```

{% crt(label = "ASCII illustration of public library halls.") %}
 _____________________________________________
|.'',        Public_Library_Halls         ,''.|
|.'.'',                                 ,''.'.|
|.'.'.'',                             ,''.'.'.|
|.'.'.'.'',                         ,''.'.'.'.|
|.'.'.'.'.|                         |.'.'.'.'.|
|.'.'.'.'.|===;                 ;===|.'.'.'.'.|
|.'.'.'.'.|:::|',             ,'|:::|.'.'.'.'.|
|.'.'.'.'.|---|'.|, _______ ,|.'|---|.'.'.'.'.|
|.'.'.'.'.|:::|'.|'|???????|'|.'|:::|.'.'.'.'.|
|,',',',',|---|',|'|???????|'|,'|---|,',',',',|
|.'.'.'.'.|:::|'.|'|???????|'|.'|:::|.'.'.'.'.|
|.'.'.'.'.|---|','   /%%%\   ','|---|.'.'.'.'.|
|.'.'.'.'.|===:'    /%%%%%\    ':===|.'.'.'.'.|
|.'.'.'.'.|%%%%%%%%%%%%%%%%%%%%%%%%%|.'.'.'.'.|
|.'.'.'.','       /%%%%%%%%%\       ','.'.'.'.|
|.'.'.','        /%%%%%%%%%%%\        ','.'.'.|
|.'.','         /%%%%%%%%%%%%%\         ','.'.|
|.','          /%%%%%%%%%%%%%%%\          ','.|
|;____________/%%%%%Spicer%%%%%%\____________;|
{% end %}

Alternatively, if you have [syntax highlighting](https://www.getzola.org/documentation/content/syntax-highlighting/) enabled and you need to preserve whitespace, you can use a code block with `crt=true` added right after three backticks.

> [!NOTE]
> The downside of this approach is that it will keep the ASCII art accessible to screen readers, which is bad for accessebility. Whitespace issue should hopefully be fixed with the release of Zola 0.23.0. See [#116](https://codeberg.org/daudix/ametrine/issues/116).

````
```crt=true
  /\
 /  \
/____\
```
````

```crt=true
  /\
 /  \
/____\
```

### Emoji

Use any custom emoji from Mastodon. Uses the instance set in the `[extra.fediverse]` section of page/section front-matter or `config.toml`, otherwise falls back to [mastodon.social](https://mastodon.social).

Available variables are:

- `name`: Name of the emoji.
- `path`: Path or filename of the local, [colocated](https://www.getzola.org/documentation/content/overview/#asset-colocation) emoji.
- `big`: Makes the emoji bigger.

```jinja
{{/* emoji(name="neofox_googly_shocked") */}}
```

Hello there, I'm an {{ emoji(name="neofox_googly_shocked") }} inline custom emoji.

```jinja
{{/* emoji(name="neofox_floof_explode", big=true) */}}
```

{{ emoji(name="neofox_floof_explode", big=true) }}

### Audio

Places a useless audio button with a funny hover animation. Needs `extra.audio_button` to be enabled on page, section, or config level for it to work.

```jinja
{{/* audio(name="Party!", url="party-horn.mp3") */}}
```

Hi everyone! You know what I like doing? That's right, throwing {{ audio(name="Parties", url="party-horn.mp3") }}! Actually I don't I just wanted to show off audio button.

### YouTube

Allows to embed a YouTube video using youtube-nocookie.

Available variables are:

- `autoplay`: Whether the video should autoplay.
- `start`: On which second video should start.

```jinja
{{/* youtube(id="0Da8ZhKcNKQ") */}}
```

{{ youtube(id="0Da8ZhKcNKQ") }}

### Vimeo

Allows to embed a Vimeo video.

Available variables are:

- `autoplay`: Whether the video should autoplay.

```jinja
{{/* vimeo(id="869483483") */}}
```

{{ vimeo(id="869483483") }}

### Mastodon

Allows to embed a Mastodon post.

Available variables are:

- `host`: The instance on which the post resides. If not set, it will fallback to the one set in the `[extra.fediverse]` section of page/section front-matter or `config.toml`.
- `user`: The poster. If not set, it will fallback to the one set in the `[extra.fediverse]` section of page/section front-matter or `config.toml`.
- `id`: The ID of the post, located at the end of the post URL.

```jinja
{{/* mastodon(host="vmst.io", user="daudix", id="113375516179365586") */}}
```

{{ mastodon(host="vmst.io", user="daudix", id="113375516179365586") }}

## Description List

```html
<dl>
<dt>Something</dt>
<dd>And its description</dd>
</dl>
```

<dl>
<dt>Name</dt>
<dd>Godzilla</dd>
<dt>Born</dt>
<dd>1952</dd>
<dt>Birthplace</dt>
<dd>Japan</dd>
<dt>Color</dt>
<dd>Green</dd>
</dl>

## Form Input

```html
<input type="checkbox" />
<label>Checkbox</label>
```

<ul>
  <li>
    <input type="checkbox" />
    <label>Milk</label>
  </li>
  <li>
    <input type="checkbox" />
    <label>Eggs</label>
  </li>
  <li>
    <input type="checkbox" />
    <label>Flour</label>
  </li>
  <li>
    <input type="checkbox" checked />
    <label>Coffee</label>
  </li>
  <li>
    <input type="checkbox" disabled />
    <label>Combustible lemons</label>
  </li>
</ul>

With `switch` class:

```html
<input class="switch" type="checkbox" />
<label>Checkbox</label>
```

<ul>
  <li>
    <input class="switch" type="checkbox" />
    <label>Milk</label>
  </li>
  <li>
    <input class="switch" type="checkbox" />
    <label>Eggs</label>
  </li>
  <li>
    <input class="switch" type="checkbox" />
    <label>Flour</label>
  </li>
  <li>
    <input class="switch" type="checkbox" checked />
    <label>Coffee</label>
  </li>
  <li>
    <input class="switch" type="checkbox" disabled />
    <label>Combustible lemons</label>
  </li>
</ul>

With `switch` and `big` classes:

```html
<input class="switch big" type="checkbox" />
<label>Checkbox</label>
```

<ul>
  <li>
    <input class="switch big" type="checkbox" />
    <label>Milk</label>
  </li>
  <li>
    <input class="switch big" type="checkbox" />
    <label>Eggs</label>
  </li>
  <li>
    <input class="switch big" type="checkbox" />
    <label>Flour</label>
  </li>
  <li>
    <input class="switch big" type="checkbox" checked />
    <label>Coffee</label>
  </li>
  <li>
    <input class="switch big" type="checkbox" disabled />
    <label>Combustible lemons</label>
  </li>
</ul>

With `radio` type:

```html
<input type="radio" name="test" />
<label>Radio</label>
```

<ul>
  <li>
    <input type="radio" name="test" />
    <label>Milk</label>
  </li>
  <li>
    <input type="radio" name="test" />
    <label>Eggs</label>
  </li>
  <li>
    <input type="radio" name="test" />
    <label>Flour</label>
  </li>
  <li>
    <input type="radio" name="test" checked />
    <label>Coffee</label>
  </li>
  <li>
    <input type="radio" name="test" disabled />
    <label>Combustible lemons</label>
  </li>
</ul>

With `color` type:

```html
<label>Color:</label>
<input type="color" value="#000000" />
```

<label for="color">Color:</label>
<input id="color" type="color" value="#b57edc" />

<label for="color">Disabled:</label>
<input id="color" type="color" value="#b57edc" disabled />

With `range` type:

```html
<input type="range" max="100" value="33">
```

<input type="range" max="100" value="33" id="range">
<!-- For the demo purposes only -->
<small id="range-value"></small>
<!-- End -->

## Figure Captions

```markdown
<figure>
  -> Whatever content <-
  <figcaption>Caption of content above</figcaption>
</figure>
```

<figure>

  ![The Office](https://i.ibb.co/MPDJRsT/ImMAXM3.png)
  <figcaption>The Office where Stanley works, it has yellow floor and beige walls</figcaption>
</figure>

## Accordion

```markdown
<details>
  <summary>Accordion title</summary>
  -> Contents here <-
</details>
```

<details>
  <summary>Reveal accordion</summary>

  Get it? I know, it's an awful pun.
  ![Piano Accordion](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/PianoAccordeon.jpg/916px-PianoAccordeon.jpg#transparent#no-hover)

</details>

## Side Comment

```html
<small>Small, cute text that doesn't catch attention.</small>
```

<small>Small, cute text that doesn't catch attention.</small>

## Abbreviation

```html
<abbr title="American Standard Code for Information Interchange">ASCII</abbr>
```

The <abbr title="American Standard Code for Information Interchange">ASCII</abbr> art is awesome!

## Aside

```html
<aside>

-> Contents here <-
</aside>
```

<aside>

Quill and a parchment

![Quill and a parchment](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/%D7%A7%D7%9C%D7%A3%2C_%D7%A0%D7%95%D7%A6%D7%94_%D7%95%D7%93%D7%99%D7%95.jpg/326px-%D7%A7%D7%9C%D7%A3%2C_%D7%A0%D7%95%D7%A6%D7%94_%D7%95%D7%93%D7%99%D7%95.jpg)
</aside>

A quill is a writing tool made from a moulted flight feather (preferably a primary wing-feather) of a large bird. Quills were used for writing with ink before the invention of the dip pen, the metal-nibbed pen, the fountain pen, and, eventually, the ballpoint pen.

As with the earlier reed pen (and later dip pen), a quill has no internal ink reservoir and therefore needs to periodically be dipped into an inkwell during writing. The hand-cut goose quill is rarely used as a calligraphy tool anymore because many papers are now derived from wood pulp and would quickly wear a quill down. However it is still the tool of choice for a few scribes who have noted that quills provide an unmatched sharp stroke as well as greater flexibility than a steel pen.

## Keyboard Input

```html
<kbd>⌘ Command</kbd>.
```

To switch the keyboard layout, press <kbd>⌘ Super</kbd> + <kbd>Space</kbd>.

## Mark Text

```html
<mark>Marked text</mark>
```

You know what? I'm gonna say some <mark>very important</mark> stuff, so <mark>important</mark> that even **bold** is not enough.

## Deleted and Inserted Text

```html
<del>Something deleted</del> <ins>Something added</ins>
```

<del>Text deleted</del> <ins>Text added</ins>

## Progress Indicator

```html
<progress></progress>
<progress value="33" max="100"></progress>
```

<progress></progress>
<progress value="33" max="100"></progress>

## Sample Output

```html
<samp>Sample Output</samp>
```

<samp>Sample Output</samp>

## Inline Quotation

```html
<q>Someone said something</q>
```

Blah blah <q>Inline Quote</q> hmm.

## Unarticulated Annotation

```html
<u>Gmarrar mitsakes</u>
```

<u>Yeet</u> the <u>sus</u> drip while <u>vibing</u> with the <u>TikTok</u> <u>fam</u> on a cap-free boomerang.

## Titles

```html
<strong class="title">Title-Looking Text</strong>
```

<strong class="title">Title-Looking Text</strong>

## External Links

```html
<a class="external" href="https://example.org">External link</a>
```

<a class="external" href="https://example.org">Link to site</a>

## Spoilers

```html
<span class="spoiler">Some spoiler</span>
```

You know, <span class="spoiler">Ametrines are very pretty.</span> I know, crazy.

With `solid` class:

```html
<span class="spoiler solid">Some spoiler</span>
```

You know, <span class="spoiler solid">Ametrines are very pretty.</span> I know, crazy.

## Buttons

```html
<div class="buttons">
  <a href="#top">Go to Top</a>
  <a class="suggested external" href="https://example.org">Example</a>
</div>
```

<div class="buttons">
  <a href="#top">Go to Top</a>
  <a class="suggested external" href="https://example.org">Example</a>
</div>

With `centered` and `big` classes:

```html
<div class="buttons centered big">
  <button class="suggested">Do Something…</button>
</div>
```

<div class="buttons centered big">
  <button class="suggested">Do Something…</button>
</div>

Standalone:

```html
<button class="suggested">Do Something…</button>
<a class="button external" href="https://example.org">Example</a>
```

<button class="suggested">Do Something…</button>
<a class="button external" href="https://example.org">Example</a>

Disabled:

```html
<button disabled class="suggested">Do Something…</button>
<a aria-disabled="true" class="button external" href="https://example.org">Example</a>
```

<button disabled class="suggested">Do Something…</button>
<a aria-disabled="true" class="button external" href="https://example.org">Example</a>

## Accent Color

For demo purposes only, usually it should be changed from the config file.

<!-- For the demo purposes only -->
<input type="range" max="360" value="0" id="range-h" class="hollow">
<input type="range" max="100" value="0" id="range-s" class="hollow">
<input type="range" max="100" value="0" id="range-l" class="hollow">

<code>hsl(<span id="range-h-value"></span>, <span id="range-s-value"></span>, <span id="range-l-value"></span>)</code>
<!-- End -->

[^1]: Footnote
[^2]: [Footnote (link)](https://example.org)
