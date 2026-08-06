#import "../utils/template.typ": *
#import "../bib_state.typ": bib_state
#context bib_state.get()



= Example text: Quantum physics
<sec:introduction>

#chap-quote("Quantum mechanics is not going to be replaced by something that's easier.", attribution: "Carlton Caves")




In June 1925, Heisenberg fled the Göttingen pollen and beached Helgoland, a collection of orange rocks on the North Sea. He was very productive there, and, in the resulting publication~@heisenberg_umdeutung, he stated that the product of some physical values, when using the calculation rules of the contemporary theory of quanta, is not commutative --- this is recognized by many as the birth of modern quantum mechanics. #margin-note[Note that Heisenberg reached this insight about the non-commutative character of quantum mechanics without the use of matrices!]

In June 2025, a centennial conference was held on the same island to celebrate the result and ponder its consequences. It illuminated the amount of work built on top of this achievement, and simultaneously, the depth of the still unknown. Technological advancement has been remarkable: arrays of atoms can be precisely controlled~@lukin_Exploring_2025@evered_2026; interactions between gravity and quantum physics are a future milestone rather than a far-off dream~@ye_Scaling_2025, and, of special interest to this thesis, quantum computers are, though today not significantly more powerful than classical computers in many regards, a reality~@mike_and_ike.

== Quantum computers

These quantum devices, as foretold in a slightly overused quotation of Richard Feynman, would be used to simulate the dynamical evolution of quantum systems, because "nature isn't classical", unfortunately~@trabesinger_Quantum_2012. It has not however been proven that quantum computers can perform computations that classical computers cannot perform~@aaronson_BQP_2009, but it is widely believed that quantum dynamics cannot, in general, be efficiently simulated on classical computers, and the conjecture is used as a basis for claims of theoretical quantum advantage~@local-minima-chen@haah_2023. In fact, if one could efficiently simulate quantum dynamics on a classical device such as a laptop or a supercomputer, then any quantum algorithm could be efficiently run on the device by simulating the quantum computer that runs the progam.

If that is not the case, quantum computers have a good chance of exceeding classical capabilities. For that to happen, we must design new quantum algorithms that conform to the constraints of quantum devices, and this requires us to radically change our way of thinking about algorithms. In short, the quantumness of quantum computers must be fully leveraged and understood for them to surpass classical computers: a plane can drive on a road just like a car, but it's more useful when it flies.

