typst compile main.typ pdf/default_style.pdf --font-path=./fonts
typst compile main.typ pdf/old_style.pdf --font-path=./fonts --input body-font="Old Standard" --input math-font="OldStandard-Math" --input calligraphic-font=LukasSvatba --input mono-font="Courier prime" --input title-font="Old Standard"
typst compile main.typ pdf/latex_style.pdf --font-path=./fonts --input title-font="CMU Serif Extra" --input calligraphic-font="CMU Classical Serif" --input body-font="CMU Serif" --input mono-font="CMU Typewriter Text"



typst compile main.typ png/default_style_{p}.png --font-path=./fonts --format png --ppi 300 --pages 1,6,9
typst compile main.typ png/old_style_{p}.png --font-path=./fonts --input body-font="Old Standard" --input math-font="OldStandard-Math" --input calligraphic-font=LukasSvatba --input mono-font="Courier prime" --input title-font="Old Standard"  --format png --ppi 300 --pages 1,6,9
typst compile main.typ png/latex_style_{p}.png --font-path=./fonts --input title-font="CMU Serif Extra" --input calligraphic-font="CMU Classical Serif" --input body-font="CMU Serif" --input mono-font="CMU Typewriter Text"  --format png --ppi 300 --pages 1,6,9

