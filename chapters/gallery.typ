#import "../utils/template.typ": *
#import "../bib_state.typ": bib_state
#context bib_state.get()


= Gallery of features

== Figures

In this template, we have figures, as shown in @fig:ex.

#figure(
  image("../files/figs/fig.pdf"),caption: "An example figure. The caption font is slightly smaller than the body font."

) <fig:ex>


== Citations

We also have nifty citation tools. The usual `@mike_and_ike` works, but we also have


- `@mike_and_ike[!]` #sym.arrow @mike_and_ike[!]. 
- `@mike_and_ike[p. 100]` #sym.arrow @mike_and_ike[p. 100]
- `@mike_and_ike[!: p. 100]`  #sym.arrow @mike_and_ike[!: p. 100]. 


Citations use two custom styles defined in `csl/`. The prose citation uses `short_and_sweet.csl`, while the #link(<bibliography>,"bibliography") section uses `thoughtful_and_coolheaded.csl` plus some show rules.

Short and sweet has a very short footprint, like so

#cite(<Kitaev_2003>,style:short_csl,form:"full")

It is used for inline "prose" citations (first line in the enum above), while thoughful and coolheaded is used in the bibliography, and looks like


#cite(<Kitaev_2003>,style:bib_csl,form:"full")

In the bibliography, there is additional styling. 

== Refable-boxes

In order to implement theorems and such, there's a higher-level function called `refable-box` (in the sense that it can be referenced). For example the theorem box is implemented as

```typst
#let theorem(body) = refable-box(body, kind: "Theorem")
```
which gives

#theorem[Peach-flavored iced tea is superior to lemon-flavored iced tea.]

Theorems also usually are followed by proofs, which can be called right away with `#proof(body)`

#proof[ It's obvious.]

Again, `refable-boxes` are valid for any kind of box, so you may define other boxes.

#postulate[The moon is made of cheese.]

The main advantage is consistent referencing.

== Acronyms

Acronyms can be defined in the `acrodict` array at `inputs.typ`,

#raw("#let acrodict = " + repr(acrodict),theme:{auto},lang:"typst")

 Then, the template will do its best to identify them all, turn any later use of the full expression into an acronym, and add a link to a table at the end. The first use of the expression will have the acronym in parentheses afterwards. The main caveat is that the first mention in the text must be the full expression, the script will not replace a first appearance acronym with the expression, because I'm too lazy to manage capitalization edge cases. For example, super useful acronym #sym.arrow.l the parentheses are added automatically. Now, if I write SUPER useful acronym again, the expression will be replaced with the acronym. If `debug` in `inputs.typ` is set to `true`, the identified acronyms are highlighted. Sometimes useful.  


== Algorithms

Algorithms use the #link("https://typst.app/universe/package/lovelace/","lovelace") package. The addition of this template is the `#call` function, which may be used to create nice function signatures, with 

```typst
  #call("WashDishes","dishes","cutlery")
```

you get #call("WashDishes","dishes","cutlery"), which in an algorithm looks like


#algorithm(caption: [Dishwashing algorithm])[
  #call("WashDishes","dishes","cutlery")
  - rinse
  - *if* not clean
    - scrub
  - repeat
]



== Margin notes

Margin notes are possible, and appear on the right. #margin-note[What did he mean?
What was his goal?
Where did he go?
]

Unfortunately they cause a line break, so place them at the end of a paragraph.

== Printing

There's a global variable, `printable`, which can be set to true to enable break to odd pages for new chapters. Margins can also be changed, though the web margins should also work in print. 