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

We also have nifty citation tools, for instance `@mike_and_ike[!]` will render as a prose citation, @mike_and_ike[!]. We can also add specifications, with `@mike_and_ike[!: p. 100]`, rendering as @mike_and_ike[!: p. 100]. The normal citation `@mike_and_ike[p. 100]` works as well: @mike_and_ike[p. 100]. Citations use two custom styles defined in `csl/`. The prose citation uses `short_and_sweet.csl`, while the #link(<bibliography>,"bibliography") section uses `thoughtful_and_coolheaded.csl` plus some show rules.

== Refable-boxes

In order to implement theorems and such, there's a higher-level function called `refable-box` (in the sense that it can be referenced). For example the theorem is implemented as

```typst
#let theorem(body) = refable-box(body, kind: "Theorem")
```
which gives

#theorem[Peach-flavored iced tea is superior to lemon-flavored iced tea.]

Theorems also usually are followed by proofs, which can be called right away with `#proof(body)`

#proof[ It's obvious.]

== Acronyms

Acronyms can be defined in the `acrodict` array at `inputs.typ`. Then, the template will do its best to identify them all, turn any later use of the full expression into an acronym, and add a link to a table at the end. The first use of the expression will have the acronym in parentheses afterwards. The main caveat is that the first mention in the text must be the full expression, the script will not replace an acronym with the expression, because I'm too lazy to manage capitalization edge cases. For example, super useful acronym. 


```
- Super useful acronym


```



== Algorithms
