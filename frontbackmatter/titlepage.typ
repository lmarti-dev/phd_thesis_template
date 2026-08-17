#import "../utils/template.typ": *
#import "../bib_state.typ": bib_state
#context bib_state.get()

#page(footer: none)[

  #write_title[#thesis_title]
  #v(20%)
  #align(
    center,
    text(
      [The Faculty of Sciences \
        University of ABC
        for \
        the doctoral degree \

        *Doctor rerum typorum (Dr. rer. typ.)* \

        submitted by \
        #upper()[*Otto Matic*] \
        born in \
        #upper()[*Hachtel*]
      ],
      tracking: 1pt,
    ),
  )
]
