---
layout: post
title:  "Proof Term Generation on miniKanren"
date:   2020-05-06 00:56:11 -0400
categories: Math
---
# Proof Term Generation during miniKanren search
* The reason we want it is because
  1. when universal quantifier want to halt, the domain exhaustiveness is checked but miniKanren
     * but we need to *PROVE* the exhaustiveness for proof-checker
     * It is non-trivial in the other way as when checking exhaustiveness, we are **maturing all the stream** to conclude **that is unsatisfiable**
     * note that due to the nature of relative-complement algorithm, we will have
  2. It also gives a proof on implication (of quantifier-free statement), as negation of unsatisfiable means validity.    
     1. This is helpful for proof-term generation for several algorithm like ToDNF, ToAssymetric (that will transform a state into DNF or assymetrical form). Because the algorithm itself is too mechanical so maybe an automatic searching of proof for them is more engineering friendly
* The key point of giving a proof on unsatisifiability is to justifies the inconsistency of a given state. i.e. #f = bottom. 
  * In other words, we need to give a syntactical proof of bottom once state becomes #f.
  * and then unsatisfiability is just a finite stream of inconsistent state, where we need to somehow "aggregate" all the bottom proof for each state of the stream into a proof of unsatisfiability.
* But interestingly, as you may see, the above "unsatisfiability" proof is always about "quantifier free" statement. So generally speaking, the "unsatisfiability" proof should be able to handled by vanilla miniKanren.
  * work on vanilla miniKanren has the best advantage -- we don't need to over complicate the current "miniKanren-with-forall" anymore. 
  * it can also be understood as a proof-checker with an Elaborator
  * for example, in generated proof term, we might have something like $x=1 \land c=2 => ...$ with no quantifier anywhere and the implication is understood as semantic implication (i.e. classical implication).
    * then our elaborator will use miniKanren again to construct proof for this "quantifir-free statement", and "elaborate" into core proof term (the curry howard correspondence)
* So our next step is to engineer the elaborator