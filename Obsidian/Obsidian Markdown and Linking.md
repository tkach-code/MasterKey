# Obsidian Markdown and Linking

Obsidian uses standard Markdown with powerful extensions for linking and embedding.

## Standard Markdown

### Text Formatting

```markdown
**bold**
*italic*
~~strikethrough~~
==highlight==
`inline code`
```

### Headings

```markdown
# Heading 1
## Heading 2
### Heading 3
```

### Lists

```markdown
- Unordered item
- Another item
  - Nested item

1. Ordered item
2. Another item

- [ ] Task (unchecked)
- [x] Task (completed)
```

### Code Blocks

````markdown
```python
def hello():
    print("Hello, world!")
```
````

### Tables

```markdown
| Column 1 | Column 2 |
|----------|----------|
| Cell 1   | Cell 2   |
```

### Blockquotes

```markdown
> This is a quote.
> It can span multiple lines.

> [!note]
> This is a callout block.
```

## Wiki-Links

The core of Obsidian's power — linking notes together.

```markdown
[[Note Name]]                    → link to a note
[[Note Name|Display Text]]      → link with custom text
[[Note Name#Heading]]            → link to a specific heading
[[Note Name#^block-id]]          → link to a specific block
```

### Creating Links

- Type `[[` and start typing — Obsidian autocompletes note names
- Link to a note that doesn't exist yet — Obsidian creates it when you click
- Links work across folders automatically

## Embeds (Transclusion)

Pull content from one note into another:

```markdown
![[Note Name]]                   → embed entire note
![[Note Name#Heading]]           → embed a specific section
![[image.png]]                   → embed an image
![[image.png|300]]               → embed image with width 300px
![[document.pdf]]                → embed a PDF
```

## Callouts

Styled blocks for highlighting information:

```markdown
> [!note]
> Standard note callout.

> [!tip]
> Helpful tip or suggestion.

> [!warning]
> Important warning.

> [!info]
> Informational callout.

> [!question]
> A question to consider.

> [!example]
> An example to illustrate.

> [!success]
> Something that worked.

> [!failure]
> Something that didn't work.

> [!bug]
> A known issue.
```

Callouts can be foldable:
```markdown
> [!tip]- Click to expand
> This content is hidden by default.

> [!note]+ Click to collapse
> This content is visible by default.
```

## Tags

```markdown
#tag                    → inline tag
#nested/tag             → nested tag

---
tags: [tag1, tag2]      → YAML frontmatter tags
---
```

## Frontmatter (YAML)

Metadata at the top of a note:

```markdown
---
title: My Note
date: 2024-01-15
tags: [obsidian, learning]
aliases: [alternate name, another name]
cssclass: custom-style
---
```

- **aliases** — alternative names that wiki-links resolve to
- **tags** — searchable tags
- **cssclass** — apply custom CSS to this note

## Footnotes

```markdown
This has a footnote[^1] and another[^2].

[^1]: First footnote content.
[^2]: Second footnote content.
```

## Related

- [[Obsidian Overview]] - What Obsidian is
- [[Obsidian Organization]] - Structuring your vault
- [[Obsidian Navigation and Search]] - Finding notes
- [[Home]]

#obsidian #beginner
