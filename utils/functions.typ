#import "./packages.typ": *
#import "./inputs.typ": *

#let margin-note-counter = counter("margin-note")
#margin-note-counter.step()

#let margin-note(body, style: "italic") = {
  (
    [#place(
      right,
      dx: 27.5%,
      dy: -5%,
      block(
        width: 25%,
        align(
          left,
          par(justify: false, text(
            size: 0.75em,
            top-edge: .2em,
            fill: luma(20%),
            font: body_font,
            style: style,
            body,
          )),
        ),
      ),
    )]
  )
  margin-note-counter.step()
}


#let chap-quote(body, attribution: "", block: true) = {
  quote(text(body, style: "italic"), attribution: attribution, block: block)
}


#let algorithm(body, caption: none) = {
  figure(
    pseudocode-list(body, hooks: .5em),
    caption: caption,
    supplement: "Algorithm",
    numbering: "1",
    kind: "Algorithm",
  )
}

#let call(fnname, ..args) = [#text(upper(fnname), font: mono_font, size: body_font_size * .75)#{
    if args.pos().len() != 0 {
      [#text("(", font: mono_font)#args.pos().join(", ")#text(")", font: mono_font)]
    }
  } ]

#let subroutine(body, caption: none) = {
  figure(
    pseudocode-list(body, hooks: .5em),
    caption: caption,
    supplement: "Subroutine",
    numbering: "1",
    kind: "Subroutine",
  )
}

#let write_title(s) = align(center, par(text(upper(s), font: title_font, size: 18pt, tracking: 1.5pt), justify: false))

#let refable-box(body, kind: "Box", fill: rgb("#efefef"), title: none) = {
  if title == none {
    title = [*#kind #{ context counter(figure.where(kind: kind)).display() }*]
  } else {
    title = [*#title* _(#{ context counter(figure.where(kind: kind)).display() })_]
  }
  figure(
    box(
      align(left)[
        #title \
        #emph(body)
      ],
      fill: fill,
      inset: 10pt,
      width: 100%,
    ),
    kind: kind,
    supplement: kind,
  )
}

#let theorem(body) = refable-box(body, kind: "Theorem")
#let proposition(body) = refable-box(body, kind: "Proposition")
#let postulate(body, title: none) = refable-box(body, kind: "Postulate", title: title)
#let proof(body) = [_Proof_: #body $qed$]


#let current_heading(printable: false) = {
  context {
    let prev_headings_selector = selector(heading).before(here())
    let level_counter = counter(prev_headings_selector)

    // This will return an array with all headings
    // before the current position, we only need the
    // last one, though.
    let headings = query(prev_headings_selector)

    if headings.len() == 0 {
      return
    }

    let last_heading = headings.last()
    let nstyle = last_heading.numbering
    if nstyle == none {
      nstyle = auto
    }

    let curr_page = here().page()
    let header1s = query(selector(heading.where(level: 1)))
    // let outlook = query(selector(outlook))
    let anchor = header1s.map(it => { it.location().page() })
    if curr_page not in anchor and level_counter.get().at(0) != 0 {
      text(
        fill: muted_color,
        size: body_font_size * .6,
        font: title_font,
        tracking: .5pt,
      )[
        #level_counter.display(nstyle) --- #upper(last_heading.body)
      ]
    }
  }
  
}


#let to_string(it) = {
  if it == none { return none }
  if type(it) == str {
    it
  } else if type(it) != content {
    str(it)
  } else if it.has("text") {
    it.text
  } else if it.has("children") {
    it.children.map(to_string).join()
  } else if it.has("body") {
    to_string(it.body)
  } else if it == [ ] {
    " "
  }
}


// can add a line after the header with:

// #h(8pt)#box(line(length: auto, stroke: (
//   paint: muted_color,
//   thickness: .5pt,
// )))

#let comment(body) = text(body, fill: red)


#let appnum(..args) = {
  
  let nums = args.pos().slice(1)
  nums.at(0)=numbering("A",nums.at(0))
  nums.map(str).join(".")
}
  }
#let appendix(body) = {
  
  set heading(numbering: appnum, supplement: [Appendix])
  body
}



#let collapse_acronym(expression, acronym) = {
  let seen = state("seen-" + acronym, false)
  show regex(expression): it => context {
    let is_first = not seen.get()
    seen.update(true)
    if is_first {
      text(fill: red)[#expression (#acronym)]
    } else {
      text(fill: blue, acronym)
    }
  }
}



#let restart_page_numbering(doc,s:"i",n:1) = {
  set page(numbering: s)
  counter(page).update(n)
  doc
}