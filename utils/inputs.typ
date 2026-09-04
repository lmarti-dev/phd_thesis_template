#let title_fonts = (
  tex_gyre: "Tex Gyre Heros",
)
#let body_fonts = (
  old_standard: "Old Standard",
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
  
)


#let title_font = sys.inputs.at("title-font",default:title_fonts.tex_gyre)
#let body_font = sys.inputs.at("body-font",default:body_fonts.gentium)
#let math_font = sys.inputs.at("math-font",default:math_fonts.latex)
#let mono_font = sys.inputs.at("mono-font",default:mono_fonts.roboto)
#let calligraphic_font = sys.inputs.at("calligraphic-font",default:calligraphic_fonts.auriocus)


#let body_font_size = 11pt
#let body_font_size_s = body_font_size*.8

#let highlight_color_1 = rgb("#228848")
#let highlight_color_2 = rgb("#0061A0")
#let highlight_color_3 = rgb("#04316a")
#let highlight_color_4 = rgb("#041E42")
#let muted_color = rgb("#818181")


#let acrodict = (
 "super useful acronym": "SUA",
 "another acronym":"ANAC",
 "a cro nym": "ACN",
 "technique with catchy shortened name": "TWITCASH'N"
)


#let printable = false
#let draft = false
#let debug = false

#let thesis_title = "A thesis typeset with Typst"
#let year = 2026
#let author = "John Doestermann"



#let short_csl = "/files/csl/citation_styles/short-and-sweet.csl"
#let bib_csl = "/files/csl/citation_styles/thoughtful-and-coolheaded.csl"