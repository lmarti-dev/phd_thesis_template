// LTeX: enabled=false

#import "./functions.typ": *
#import "./cetz_utils.typ": *


#let thesis_style(doc, printable: false, debug: true, draft: true) = {
  let colora
  let colorb
  if debug {
    colora = purple
    colorb = blue
  } else {
    colora = black
    colorb = black
  }

  let in-bib = state("in-bib", false)
  let in-acronym = state("in-acronym", false)
  let in-heading = state("in-heading", false)
  let in-header = state("in-header", false)
  let in-outline = state("in-outline", false)


  set page(paper: "a4", header: {
    in-header.update(true)
    current_heading(printable: printable)
    in-header.update(false)
  })
  set page(margin: (inside: 4cm, outside: 2cm, y: 2cm)) if printable
  set page(margin: (x: 4cm, y: 2cm)) if not printable
  show figure.caption: set text(size: body_font_size_s)

  set page(background: align(center, place(dx: 1em, dy: 1em, text(
    font: mono_font,
    fill: color.rgb(255, 0, 0, 20),
    size: 2em,
    "DRAFT",
  )))) if draft

  show pagebreak.where(to: "odd"): set page(header: none)

  import "../bib_state.typ": bib_state
  bib_state.update(none)
  set math.equation(numbering: "(1)", supplement: [Eq.])
  show math.equation: set text(font: math_font)

  show math.equation.where(block: true): it => context {
    let size = measure(it)
    let sum_margins
    if printable {
      sum_margins = page.margin.inside + page.margin.outside
    } else {
      sum_margins = page.margin.left + page.margin.right
    }

    if size.width > (page.width - sum_margins) {
      {
        set math.text(fill: colorb)
        it
      }
    } else {
      it
    }
  }


  set heading(numbering: "1.1.1. i", supplement: "Sec.")
  set text(font: body_font, size: body_font_size)

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    text(upper(it), font: title_font, weight: "bold")
  }

  show outline.entry: it => {
    in-outline.update(true)
    text(
      number-type: "old-style",
    )[#it]
    in-outline.update(false)
  }
  show heading: it => {
    in-heading.update(true)
    block(
      text(
        font: body_font,
        weight: "bold",
        size: .8em,
        number-type: "old-style",
      )[#par(justify: false)[
          #text(fill: highlight_color_1)[#counter(heading).display()] #h(12pt) #text(
            tracking: 1.5pt,
          )[#upper(it.body)]]
      ],
      sticky: true,
    )
    v(3pt)
    in-heading.update(false)
  }

  show <part:acronyms>: it => {
    in-acronym.update(true)
    it
    in-acronym.update(false)
  }


  show heading.where(level: 1): it => text(
    size: 1em,
    font: title_font,
    tracking: 2pt,
    weight: "regular",
  )[

    #in-heading.update(true)
    #if printable {
      pagebreak(to: "odd")
    } else {
      pagebreak()
    }
    #upper(it.body) #h(1fr)
    #if it.numbering != none [
      #let bignumber_dx
      #if printable {
        bignumber_dx = 90%
      } else {
        bignumber_dx = 105%
      }
      #place(dx: bignumber_dx, dy: -11%)[
        #text([#counter(heading).display()], font: calligraphic_font, size: 6em, fill: highlight_color_1)
      ]
    ]
    #v(-.8em)
    #line(length: 100%)
    #v(.4em)
    #in-heading.update(false)
  ]
  // show heading.where(level: 4): it => block(below: 0pt) + box(inset: (right: 0.8em), it)

  set par(justify: true)


  set table(
    stroke: (x, y) => if y == 0 {
      (bottom: 0.7pt + black)
    },
    align: (x, y) => (
      if x > 0 { center } else { left }
    ),
  )
  set list(marker: [---])
  show raw: set text(font: mono_font, size: 1.1em)

  set figure(numbering: "1.i", supplement: [Fig.])


  // show regex("\b(" + _gate_set + ")(\b|s\b)"): set text(font: mono_font, weight: "regular")


  show cite: it => {
    show regex("(\d+)"): ww => {
      [#text(ww, fill: highlight_color_1, number-type: "old-style")]
    }
    it
  }


  show cite: it => {
    let supp = to_string(it.supplement)
    if supp != none and supp.first() == "!" {
      if supp.len() > 1 and supp.at(1) == ":" {
        supp = supp.slice(2)
      } else if supp == "!" {
        supp = none
      }
      cite(it.key, form: "prose", style: "../files/csl/short-and-sweet.csl", supplement: supp)
    } else {
      it
    }
  }
  show bibliography: it => {
    in-bib.update(true)
    show link: li => { text(underline(li), fill: highlight_color_1) }
    it
    in-bib.update(false)
  }
  if acrodict.keys().len()!=0{
  let acrostates = acrodict
    .keys()
    .fold((:), (acc, e) => {
      acc.insert(lower(e), state("seen-" + lower(e), false))
      return acc
    })


  let re = "\b((?i)" + acrodict.keys().join("|") + "|" + acrodict.values().join("|") + ")s?\b"
  let racrodict = (:)
  let vcapdict = (:)
  let kcapdict = (:)
  for c in acrodict.keys().zip(acrodict.values()) {
    racrodict.insert(lower(c.at(1)), lower(c.at(0)))
    kcapdict.insert(lower(c.at(0)), c.at(0))
    vcapdict.insert(lower(c.at(1)), c.at(1))
  }

  for item in acrodict.values() + acrodict.keys() {
    let re = "\b" + item + "s?\b"
    let is-acronym = upper(item) == item
    doc = {
      show regex(re): it => {
        let lvals = vcapdict.keys()
        let lkeys = kcapdict.keys()
        let tok = lower(it.text)
        let add_s = ""
        if tok in lvals or tok.slice(0, -1) in lvals {
          if tok.slice(0, -1) in lvals {
            tok = tok.slice(0, -1)
            add_s = "s"
          }
          tok = racrodict.at(tok)
        }
        if tok not in lkeys and tok.slice(0, -1) in lkeys {
          tok = tok.slice(0, -1)
          add_s = "s"
        }

        let word = tok
        if it.text.at(0) == upper(it.text.at(0)) {
          word = upper(word.at(0)) + word.slice(1)
        }

        let acronym = acrodict.at(kcapdict.at(tok))

        context {
          let is_body_text = not (
            in-bib.get() or in-acronym.get() or in-heading.get() or in-header.get() or in-outline.get()
          )
          if is_body_text {
            let is_first = not acrostates.at(tok).get()
            if is_first and not is-acronym {
              text(fill: colora)[#it.text (#acronym#add_s)]
              acrostates.at(tok).update(true)
            } else {
              text(fill: colorb)[#link(label("acr" + acronym), [#acronym#add_s])]
              // text(fill: colorb)[#acronym#add_s]
            }
          } else {
            it
          }
        }
      }
      doc
    }
  }}
  // show regex("(\. \w)"): it => {
  //   let letter = it.text.last()
  //   ". " + upper(letter)
  // }
  doc
}



