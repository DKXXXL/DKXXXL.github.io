In this post, we review/sort out the definition and construction of proof-relevant impredicative universe.

Ref
1. https://arxiv.org/pdf/2210.02169 def 2.1
2. https://www2.mathematik.tu-darmstadt.de/~streicher/REAL/REAL.pdf realizability topos
3. https://www2.mathematik.tu-darmstadt.de/~streicher/NOTES/UniTop.pdf definition of Universe
4. https://www.danielgratzer.com/papers/phd-thesis.pdf definition of universe
5. https://www.math.mcgill.ca/rags/LCCC/LCCC.pdf LCCC interpretation of dependent type
6. https://cstheory.stackexchange.com/a/37712/40632 correct formulation of impredicativity
7. https://proofassistants.stackexchange.com/a/1836/455 correct impredicative data encoding
8. Revisiting the categorical interpretation of dependent type theory 
9. https://www.cs.cmu.edu/~rwh/students/sterling.pdf Sterling Thesis
10. Semantics of Type Theory 
11. Categorical Logic and Type Theory 
***

# Review Impredicativity
[Ref 6] and [Ref 1, Def 2.1]
The key point is that, even impredicativity doesn't gives us `Ω : Ω` which is automatically causing inconsistency.

(What about `U : El U`?)

The correct formulation of impredictive `Type` is `A : BigType`, `B : Type`, then `(∀ A B) : Type`. 
This is useful in a lot of situation.

# Cumulative Universe
[Ref 4, Def 3.2.15] covers the definition of Cumulative Universe -- 
basically 
1. a sequent of `𝒮0 ⊆ 𝒮1 ...` 
2. and for each `i`, the terminal map `𝒰i → 1` locates in `𝒮_{i+1}`. 

Thus this two interprets to two judgement 
`Γ ⊢ T : typei ⇒ Γ ⊢ T : type(i+1)` and `⊢ 𝒰i : type (i + 1)`

# We have cumulative universe 𝒮0 ⊆ 𝒮1 ..
and thus especially for `x : 𝒰0 ⊢ T type 0`  we have  `⊢ ((x : 𝒰0) → T x) type 1`

**Categorically speaking**, we have `U0 : 𝒰0 → 1 ` ∈ `𝒮1`, and we have `𝑇 : T → 𝒰0`  ∈ `𝒮0 ⊆ 𝒮1` as the type judgement.
`∏U0 : 𝒞/𝒰0 → 𝒞` and thus by definition of the universe `∏U0 𝑇 : 𝒞` and in `𝒮1`

# If we have impredicative universe 𝒮, 𝒰
contrary to above, when given `x : 𝒰 ⊢ T type`  we have  `⊢ ((x : 𝒰) → T x) type`


Correspondingly, **Categorically speaking**, we should have `U : 𝒰 → 1` ∈ `𝒮` 

# We have dependent product closed under 𝒮's generic family 𝒰

Now we know what it means to have dependnet product in 𝒮, as 𝒰 is so strong and classifies everything in 𝒮, we should have a similar definition:
"What it means that 𝒰 equips dependent product type?"

This is covered by [Ref 4, Lemma 3.2.13] and [Ref 9, §3.2∗4].


# We have dependent product closed under 𝒮's generic family 𝒰, impredicative
For impredictive universe, the previous section should be re-formulated as:

<!-- So the correct categorical formulation of impredicative universe, with respect to that generic mapping 𝒰, is  -->


# Realizability Topos has this impredicative universe

