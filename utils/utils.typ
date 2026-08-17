#import "@preview/cetz:0.4.2": canvas, decorations, draw

#import "./functions.typ": *

#let g_red = red.lighten(10%)
#let g_blue = blue.lighten(20%)
#let g_green = green.lighten(20%)
#let g_gray = gray.lighten(80%)
#let g_orange = orange.darken(10%)
#let g_black = black.lighten(40%)
#let g_yellow = yellow.darken(10%)
#let g_purple = purple.lighten(10%)

#let circle_style(g_color) = (
  radius: .17,
  fill: g_color,
  stroke: (paint: black, thickness: .1pt),
)

#let big_circle_style(g_color) = (
  radius: 0.4,
  fill: g_color,
  stroke: (paint: black, thickness: .1pt),
)

#let line_style(color) = (
  stroke: (paint: color, thickness: 3pt),
)

#let toric_grid = {
  import draw: *
  grid(
    (0, 0),
    (4, 4),
    stroke: (paint: gray, dash: "dashed", thickness: 0.5pt),
    step: .5,
  )
  grid(
    (0, 0),
    (4, 4),
    stroke: (paint: black, thickness: 0.5pt),
    step: 1,
  )

  for y in range(0, 5) {
    for i in range(0, 4) {
      let x = 0.5 + i
      circle((x, y), radius: 0.1, fill: g_gray, stroke: (paint: black, thickness: .1pt))
    }
  }

  for x in range(0, 5) {
    for i in range(0, 4) {
      let y = 0.5 + i
      circle((x, y), radius: 0.1, fill: g_gray, stroke: (paint: black, thickness: .1pt))
    }
  }

  for i in range(0, 4) {
    let x = 0.5 + i
    line((x, -0.1), (x, -0.3), mark: (end: "straight"), stroke: (paint: black, thickness: .1pt))
  }


  for i in range(0, 4) {
    let y = 0.5 + i
    line((4.1, y), (4.3, y), mark: (end: "straight"), stroke: (paint: black, thickness: .1pt))
  }
}




#let sphere(pos, color, radius) = {
  import draw: *
  circle(pos, radius: radius, fill: gradient.radial(white, color), stroke: (thickness: .5pt, paint: black))
}




#let ket(state) = { $lr(|#state chevron.r, size: #{ 50% + 0pt })$ }
#let abs(x) = { $lr(|#x|)$ }
#let frob(x) = { $lr(||#x||_F)$ }
#let bra(state) = { $lr(chevron.l #state|, size: #{ 50% + 0pt })$ }
#let expect(state) = { $lr(chevron.l #state chevron.r, size: #{ 50% + 0pt })$ }
#let braket(s1, s2) = { $lr(chevron.l #s1|#s2 chevron.r, size: #{ 50% + 0pt })$ }
#let ketbra(s1, s2) = { $lr(| #s1 chevron.r chevron.l #s2 |, size: #{ 50% + 0pt })$ }
