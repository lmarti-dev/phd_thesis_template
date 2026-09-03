
#import "utils/template.typ": *
#import "utils/inputs.typ": *

#show: thesis_style.with(debug: debug,draft: draft,printable: printable)



#include "frontbackmatter/titlepage.typ"


#show: restart_page_numbering.with(s:"i",n:2)

#include "frontbackmatter/dedication.typ"
#include "chapters/acknowledgements.typ"


#outline(title: "Table of contents")

#show: restart_page_numbering.with(n:1,s:"1")

#include "chapters/gallery.typ"



#include "chapters/quantum_physics.typ"
#include "chapters/toric_code.typ"

#pagebreak()
#include "chapters/outlook.typ"

#bibliography("sources/sources.bib", style: bib_csl) <bibliography>

#include "chapters/appendix.typ"



#include "frontbackmatter/acronyms.typ"
#include "frontbackmatter/colophon.typ"
