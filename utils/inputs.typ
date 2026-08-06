// LTeX: enabled=false

#let title_fonts = (
  tex_gyre: "Tex Gyre Heros",
  miriam: "Miriam Libre",
)
#let body_fonts = (
  old_standard: "Old Standard",
  etbembo: "ETBembo",
  gentium: "Gentium Book Basic",
)

#let math_fonts = (
  latex: "New Computer Modern Math",
  oldschool: "OldStandard-Math",
  fancy: "Erewhon Math",
)
#let mono_fonts = (
  roboto: "Roboto Mono",
)

#let calligraphic_fonts = (
  svatba: "LukasSvatba",
  auriocus: "AuriocusKalligraphicus",
  skrivana: "JanaSkrivana",
)


#let title_font = title_fonts.tex_gyre
#let body_font = body_fonts.gentium
#let math_font = math_fonts.latex
#let mono_font = mono_fonts.roboto
#let calligraphic_font = calligraphic_fonts.auriocus


#let body_font_size = 11pt
#let body_font_size_s = body_font_size*.8

#let highlight_color_1 = rgb("#228848")
#let highlight_color_2 = rgb("#0061A0")
#let fau_blue = rgb("#04316a")
#let highlight_color_3 = fau_blue
#let highlight_color_4 = rgb("#041E42")
#let muted_color = rgb("#818181")


#let acrodict = (
 "super useful acronym": "SUA",
 "another acronym":"ANAC",
)


#let printable = false
#let draft = false
#let debug = false

#let thesis_title = "A thesis typeset with Typst"
#let year = 2026
#let author = "Lucas Marti"

