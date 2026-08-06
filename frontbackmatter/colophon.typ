#import "../utils/template.typ": *
#import "../bib_state.typ": bib_state
#context bib_state.get()


#heading(level: 1, numbering: none)[Colophon]
<colophon>
This thesis was written in #link("https://github.com/typst/typst")[Typst] rather than the usual LaTeX, on a template built _ab initio_. The template was nonetheless strongly inspired by the venerable `ClassicThesis` LaTeX package.

I used the fonts
- Arial for the cover,
- #title_font for titles,
- #body_font for body text,
- #math_font for math,
- #mono_font for monospace, and
- #calligraphic_font for chapter numbers and some diagrams.

This document was last compiled on #datetime.today().display("[weekday] [day]/[month]/[year]"), with Typst #sys.version.
