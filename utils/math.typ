

#let ket(state) = { $lr(|#state chevron.r, size: #{ 50% + 0pt })$ }
#let abs(x) = { $lr(|#x|)$ }
#let frob(x) = { $lr(||#x||_F)$ }
#let bra(state) = { $lr(chevron.l #state|, size: #{ 50% + 0pt })$ }
#let expect(state) = { $lr(chevron.l #state chevron.r, size: #{ 50% + 0pt })$ }
#let braket(s1, s2) = { $lr(chevron.l #s1|#s2 chevron.r, size: #{ 50% + 0pt })$ }
#let ketbra(s1, s2) = { $lr(| #s1 chevron.r chevron.l #s2 |, size: #{ 50% + 0pt })$ }
