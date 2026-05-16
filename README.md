# Poster Back-Page Generator

A client-side web tool that adds a formatted back page to poster PDFs. Upload a poster, fill in the fields, and download a new PDF containing the original poster plus a back page with your data, a barcode, and optional images.

**No data ever leaves your browser.** Everything processes locally using pdf-lib and bwip-js.

---

## Quick Start

### Local development
```bash
./serve.sh
# Opens at http://localhost:8899
```

### GitHub Pages
The site is fully static and can be hosted on GitHub Pages — just push the repo and enable Pages in your repo settings.

---

## Usage

1. Upload a **Poster PDF** (required)
2. Optionally upload a **Bug Image** or provide a URL
3. Fill in the **Required fields**
4. Fill in any **Optional fields**
5. Click **Generate PDF**
6. The download begins automatically

### Fields

| Field | Required | Description |
|---|---|---|
| ID | ✓ | Identifier (used for barcode and filename) |
| Source | ✓ | Source of the poster |
| Category | ✓ | Category/topic |
| Length | ✓ | Physical dimensions (e.g., 11x17) |
| Original Author | | Credit for the original work |
| Website | | URL (generates QR code on back page) |
| Instagram | | Social handle (shows icon on back page) |
| WebsiteBlurb | | Short description displayed with QR code |
| Seller | | Seller name (displayed as title on back page) |
| SellerQuote | | Quote displayed under seller name |

### Back page layout

```
┌─ 11"×11" content box, centered, ¼" from top ──┐
│          ┌──────────────┐                       │
│          │  Bug Image   │   2"×2", ratio-locked │
│          └──────────────┘                       │
│     Seller Name (if filled)                     │
│     "SellerQuote"                               │
│     ID: value                                   │
│     Source: value                               │
│     ...all fields...                            │
│          ┌──────────────┐                       │
│          │   Barcode    │   Code 128 from ID    │
│          └──────────────┘                       │
│     (Website) URL text                          │
│     WebsiteBlurb text                           │
│          ┌──────────────┐                       │
│          │   QR Code    │   1.39"×1.39"         │
│          └──────────────┘                       │
└─────────────────────────────────────────────────┘
```

---

## URL Auto-Fill

Append query parameters to the page URL to pre-fill fields:

```
?ID=ABC123&Source=Archive&Category=Art&Length=11x17
&OriginalAuthor=Jane&Website=https://example.com
&Instagram=@user&Seller=Name&SellerQuote=Quote
&Bug=https://example.com/logo.png
```

Parameter names match the field labels with no spaces.

---

## Bug Image

The bug image (small logo/emblem) can be provided two ways:
- **Upload** — select a PNG or SVG file
- **URL** — provide a URL to a PNG or SVG image (default mode)

SVG images are automatically converted to PNG for PDF embedding.

---

## Local Font

The project uses **Francois One** (TrueType, ~74KB) served as a static asset from the project root. No external font CDN is needed.

---

## Requirements

- A modern browser (Chrome, Firefox, Edge)
- For local testing: Python 3 (for `serve.sh`)
- Or host on any static web server / GitHub Pages

**Opening `index.html` directly via `file://` will not work** — the font and other assets require HTTP serving.

---

## Technical Stack

| Library | Purpose |
|---|---|
| [pdf-lib](https://pdf-lib.org/) | PDF creation and manipulation |
| [bwip-js](https://github.com/metafloor/bwip-js) | Barcode and QR code generation |
| [@pdf-lib/fontkit](https://github.com/Hopding/pdf-lib) | TrueType font parsing |
| [Font Awesome](https://fontawesome.com/) | Field icons (globe, Instagram) |
| [Francois One](https://fonts.google.com/specimen/Francois+One) | Typeface for the back page (Google Fonts, SIL OFL) |
| [DejaVu Sans](https://dejavu-fonts.github.io/) | Fallback emoji rendering via canvas |

---

## License

This project is provided for personal and educational use. The Francois One font is licensed under the SIL Open Font License. See the font's license for redistribution terms.
