#import "../../utils/template.typ": *
#import "../../bib_state.typ": bib_state
#context bib_state.get()

#import "../../utils/cetz_helper.typ":*

#figure(
  canvas({
    import draw: *
    toric_grid

    line((0.5, 1), (1.5, 1), ..line_style(g_green))
    line((1, 0.5), (1, 1.5), ..line_style(g_green))


    line((2, 1), (3, 1), (3, 2), (2, 2), (2, 1), ..line_style(g_blue))


    for pos in ((0.5, 1), (1.5, 1), (1, 0.5), (1, 1.5)) {
      circle(pos, ..circle_style(g_green))
      content(pos, text(size: 6pt, $Z$))
    }
    for pos in ((2.5, 1), (3, 1.5), (2.5, 2), (2, 1.5)) {
      circle(pos, ..circle_style(g_blue))
      content(pos, text(size: 6pt, $X$))
    }
  }),
  caption: [The spins are on the edges of a dual lattice, the blue face represents the $B$ operator, and the green cross represents the $A$ operator, and the arrows mean the circle is the periodic boundary, i.e. a circle with an arrow represents a circle on the other side of the lattice],
) <fig:toricgrid>
