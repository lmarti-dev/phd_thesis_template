#import "../utils/template.typ": *
#import "../bib_state.typ": bib_state
#context bib_state.get()

#page(footer: none)[

  #write_title[#thesis_title]
  #v(20%)
  #align(
    center,
    text(
      [The Faculty of Natural Sciences \
        University name
        for \
        the doctoral degree \

        *Doctor rerum naturalium (Dr. rer. nat.)* \

        submitted by \
        #upper()[*John Doe*] \
        born in \
        #upper()[*Smallville*]
      ],
      tracking: 1pt,
    ),
  )
]
