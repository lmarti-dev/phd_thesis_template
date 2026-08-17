typst compile main.typ pdf/default_style.pdf --font-path=./fonts
typst compile main.typ pdf/old_style.pdf --font-path=./fonts --input body-font="Old Standard" --input math-font="OldStandard-Math" --input calligraphic-font=LukasSvatba --input mono-font="Courier prime" --input title-font="Old Standard"
typst compile main.typ pdf/latex_style.pdf --font-path=./fonts --input title-font="CMU Serif Extra" --input calligraphic-font="CMU Serif Extra" --input body-font="CMU Serif" --input mono-font="CMU Typewriter Text"

