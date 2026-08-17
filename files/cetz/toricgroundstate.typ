#import "../../utils/template.typ": *
#import "../../bib_state.typ": bib_state
#context bib_state.get()

#figure(
  grid(
    columns: 3,
    column-gutter: 1em,

    canvas({
      import draw: *
      toric_grid

      line((0, 2), (4, 2), ..line_style(g_black))

      for i in range(0, 4) {
        let x = 0.5 + i
        circle((x, 2), ..circle_style(g_black))
      }
    }),

    canvas({
      import draw: *
      toric_grid

      line((2, 0), (2, 4), ..line_style(g_black))

      for i in range(0, 4) {
        let y = 0.5 + i
        circle((2, y), ..circle_style(g_black))
      }
    }),

    canvas({
      import draw: *
      toric_grid

      line((0, 2), (4, 2), ..line_style(g_black))
      line((2, 0), (2, 4), ..line_style(g_black))
      line((2, 0), (2, 4), ..circle_style(g_black))

      for i in range(0, 4) {
        let x = 0.5 + i
        circle((x, 2), ..circle_style(g_black))
        circle((2, x), ..circle_style(g_black))
      }
    }),
  ),
  caption: [Three of the four independent degenerate ground state groups. The fourth is the empty lattice.],
) <fig:toricgroundstate>
