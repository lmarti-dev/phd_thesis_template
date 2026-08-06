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

// Helper function to draw a panel with border and labels
#let draw-panel(x-offset, y-offset, title, step-num, panel-content) = {
  import draw: *
  group({
    translate((x-offset, y-offset, 0))
    panel-content
    // Border
    rect((-0.6, -0.5), (3.8, 2.75), stroke: (dash: "dotted", thickness: .5pt))
    content(
      (1.2, 2.5),
      box(text(align(center, title), size: 10pt), inset: 4pt, fill: white),
      anchor: "south",
      fill: g_gray,
      padding: 0.1,
    )
    content((3.35, 2.8), text(font: calligraphic_font, size: 16pt)[#step-num], anchor: "south")
  })
}
