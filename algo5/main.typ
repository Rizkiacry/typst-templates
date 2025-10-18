#import "@local/versatile-apa:7.1.4": *

#show heading: it => {
  set text(red)
  it
}

#show raw: r => box(fill: luma(230), inset: (x: 3pt, y: 1pt), radius: 2pt, r)

#set heading(numbering: "1.1.")

#let heading_level = state("heading_level", 0)
#let heading_text_indent = state("heading_text_indent", 0pt)

#show heading: it => {
  heading_level.update(it.level)
  let indent = 1.5em * (it.level - 1)
  let number_width = 3em
  let text_indent = indent + number_width
  heading_text_indent.update(text_indent)

  grid(
    columns: (indent, number_width, 1fr),
    "", // empty column for indentation
    it.counter.display(it.numbering),
    it.body
  )
}

#show par: it => context {
  let level = heading_level.get()
  if level > 0 {
    heading_level.update(0) // Reset
    let indent = heading_text_indent.get()
    block(inset: (left: indent), it)
  } else {
    it
  }
}

// Document titles should be formatted in title case (https://capitalizemytitle.com/)
#let doc-title = [American Psychological Association (APA) Style Template for Typst]

#let logo-content = image("../laporan_image1_logo.jpg", width:10cm)

#show: versatile-apa.with(
  title: doc-title,
  authors: (
    (
      name: "ZAIN AKBAR RIZKIA",
    ),
  ),
  student-id: "202531091",
  course: "C",
  instructor: "MEILIA NUR INDAH SUSANTI, ST., M.Kom",
  pc-number: "MT-31",
  assistants: (
    "MUHAMMAD KHASYI ATHALLAH",
    "RAFI INDRA PRAMUDHITO Z.",
    "ARIF RIZKI KURNIADI",
    "GANGSAR ANJASMORO",
  ),
  logo: logo-content,
  faculty: "FAKULTAS TELEMATIKA ENERGI",
  department: "TEKNIK INFORMATIKA",
  institute: "INSTITUT TEKNOLOGI PLN-JAKARTA",
  academic-year: "2025/2026",

  // The following fields are not used in the new cover page, but are kept for compatibility
  affiliations: (),
  due-date: datetime.today().display(),
  running-head: [],
  author-notes: [],
  keywords: ("APA", "template", "Typst"),
  font-family: "Libertinus Serif",
  font-size: 12pt,
  region: "us",
  language: "en",
  paper-size: "a4",
  implicit-introduction-heading: false,
  abstract-as-description: true,
)

#outline()
#pagebreak()

#include "sections/laporan.typ"

#pagebreak()

#bibliography(
  "bibliography/laporan_references.bib",
  style: "csl/apa.csl",
  full: true,
  title: auto,
)
