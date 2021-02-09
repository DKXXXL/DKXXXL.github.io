---
layout: post
title:  "Proof Term Generation on miniKanren"
date:   2020-05-06 00:56:11 -0400
categories: Math
---
# Proof Term Generation during miniKanren search
## The reason we want it is because
  1. when universal quantifier want to halt, the domain exhaustiveness is checked but miniKanren
     * but we need to *PROVE* the exhaustiveness for proof-checker
     * It is non-trivial in the other way as when checking exhaustiveness, we are **maturing all the stream** to conclude **that is unsatisfiable**
     * note that due to the nature of relative-complement algorithm, we will have
  2. It also gives a proof on implication (of quantifier-free statement), as negation of unsatisfiable means validity.    
     1. This is helpful for proof-term generation for several algorithm like ToDNF, ToAssymetric (that will transform a state into DNF or assymetrical form). Because the algorithm itself is too mechanical so maybe an automatic searching of proof for them is more engineering friendly
## Elaborator as part of proof checker
* The key point of giving a proof on unsatisifiability is to justifies the inconsistency of a given state. i.e. #f = bottom. 
  * In other words, we need to give a syntactical proof of bottom once state becomes #f.
  * and then unsatisfiability is just a finite stream of inconsistent state, where we need to somehow "aggregate" all the bottom proof for each state of the stream into a proof of unsatisfiability.
* But interestingly, as you may see, the above "unsatisfiability" proof is always about "quantifier free" statement. So generally speaking, the "unsatisfiability" proof should be able to handled by vanilla miniKanren.
  * work on vanilla miniKanren has the best advantage -- we don't need to over complicate the current "miniKanren-with-forall" anymore. 
  * it can also be understood as a proof-checker with an Elaborator
  * for example, in generated proof term, we might have something like $x=1 \land c=2 => ...$ with no quantifier anywhere and the implication is understood as semantic implication (i.e. classical implication).
    * then our elaborator will use miniKanren again to construct proof for this "quantifir-free statement", and "elaborate" into core proof term (the curry howard correspondence)
* So our next step is to engineer the elaborator

## forall/exists and state-info justification
* Recall that how to generate proof term for existential quantifier?
  * the routine is that, after solving the goal with existential quantifier, since that state is still consistent thus
  * we will extract a concrete ground value from the state,
    * and thus dependent pair in the proof term is trivial as there are no variables at all! so equality or other primitives are trivial to type check
      * we only have something like `1 == 1` and `has-type (1 . 2) pair?` 
      * *the information in the state is trivial*, even though the state has something like `x == y`, we don't bother because this won't appear inside proof-term, we only will have `1==1` in the proof term, where `1` is a result of extracting `x`. 
* But same story cannot apply to for-all proving.
  * For example, when dealing with forall proving, 
    * we will use existential quantifier at one point
      * to **get the range of domain** that the current goal will be solved (as partial solution)
      * and then we continue to use "relative-complement" 
      * to continue on **the remaining of the domain**
      * basically it will look like solving 
        * `forall x:D. G` by solving `forall x:D1. G` and `forall x:D2. G`
        * where $D \equiv D_1 \lor D_2$
  * Code for forall is below
```Scheme
(let* ([ignore-one-hole-st (st . <-pfg . (_1 _2) _2)])
  (bind-forall  asumpt
                (set-add (state-scope st) var)
                ;;; NOTE: the following "(ex var ..)" ex var is non-trivial and not removable.
                (TO-DNF (TO-NON-Asymmetric asumpt (pause asumpt ignore-one-hole-st (ex var (conj domain_ goal)))) )  
                var 
                (forall var domain_ goal)))]
```
* But the problem comes -- the existential quantifier here won't be instantiated into a concrete value, then the primitive operation like equality/(value)type checking cannot be trivially proof-checking
* i.e. we need to generate proof-term for primitive operations, where those primitive operations are already handled by state information, but now we need to generate proof term for state information
  * those proof-term includes telling proof-checker how to do rewrite, how to generate equality on two terms
* Generally speaking -- proof-term for state information becomes necessary once (proof-term for) existential quantifier becomes non-trivial
  * this idea can apply to vanilla miniKanren as well -- as sometimes we will have a state reified into `(_.0)` the proof term for them should be a proof term *why the state is equivalent to the goal*
* The proof-term for a state:
  * as we have a bunch of equalities, `walk*` is the function responsible for rewriting, so it should generate proof-term about rewrite
  * other parts are similar, we should generate term for each added items into the state
***

You should notice that, the above two features should somehow be unified but I currently have no idea to do it in an engineer-able way.
## Conclusion:
1. We will need to extend the vanilla miniKanren (with type-constraint/inequality) (but without universal quantifier) to handle falsification proof-term generation on quantifier-free statement
   1. as elaborator for proof-term checker
2. We will need to extend the miniKanren (with for-all) to have proof-term information on each generated state