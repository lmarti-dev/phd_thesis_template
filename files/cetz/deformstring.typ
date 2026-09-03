#import "../../utils/template.typ": *
#import "../../bib_state.typ": bib_state
#context bib_state.get()


#import "../../utils/cetz_helper.typ":*

#figure(
  grid(
    columns: 3,
    column-gutter: 1em,

    canvas({
      import draw: *
      toric_grid


      line((1, 3), (3, 3), (3, 2), (2, 2), (1, 2), (1, 3), ..line_style(g_orange))


      for pos in ((1.5, 3), (2.5, 3), (3, 2.5), (2.5, 2), (1.5, 2), (1, 2.5)) {
        circle(pos, ..circle_style(g_orange))
        content(pos, text(size: 6pt, $1$))
      }
    }),

    canvas({
      import draw: *
      toric_grid


      line((1, 3), (3, 3), (3, 2), (2, 2), (1, 2), (1, 3), ..line_style(g_orange))


      line((2, 1), (3, 1), (3, 2), (2, 2), (2, 1), ..line_style(g_blue))


      for pos in ((1.5, 3), (2.5, 3), (3, 2.5), (2.5, 2), (1.5, 2), (1, 2.5)) {
        circle(pos, ..circle_style(g_orange))
        content(pos, text(size: 6pt, $1$))
      }


      for pos in ((2.5, 1), (3, 1.5), (2.5, 2), (2, 1.5)) {
        circle(pos, ..circle_style(g_blue))
        content(pos, text(size: 6pt, $X$))
      }
    }),

    canvas({
      import draw: *
      toric_grid


      line((1, 3), (3, 3), (3, 2), (3, 1), (2, 1), (2, 2), (1, 2), (1, 3), ..line_style(g_orange))


      for pos in ((1.5, 3), (2.5, 3), (3, 2.5), (1.5, 2), (1, 2.5), (3, 1.5), (2, 1.5), (2.5, 1)) {
        circle(pos, ..circle_style(g_orange))
        content(pos, text(size: 6pt, $1$))
      }
    }),
  ),
  caption: [We can deform any non winding path into the empty lattice, or into any other non winding path, using the $B$ operators, which "flips" a face-full of spins],
) <fig:deformstring>
