#import "@local/versatile-apa:7.1.4": *

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

#include "sections/introduction.typ"

#pagebreak()
#include "sections/lists.typ"

#pagebreak()

#bibliography(
  "bibliography/laporan_references.bib",
  style: "csl/apa.csl",
  full: true,
  title: auto,
)

