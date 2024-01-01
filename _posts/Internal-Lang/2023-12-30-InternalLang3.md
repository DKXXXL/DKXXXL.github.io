---
layout: post
title:  "Review Internal Language, III"
date:   2023-12-30 00:56:11 -0400
categories: Type-Theory
---

Ref
1. https://arxiv.org/pdf/2102.11649.pdf
2. https://arxiv.org/pdf/1804.05236.pdf
3. https://arxiv.org/pdf/2011.15021.pdf
4. https://arxiv.org/pdf/2302.05190.pdf  (this one, the internal language is used pretty limited)
5. https://arxiv.org/abs/2011.15021 it has a section §7 compares to dependent right adjoint

Basically we want to understand modality and those two presheaves mentioned in Ref 1
***
Fix a functor `F : 𝒞 → 𝒟`, so we will have 
`F! ⊣ F* ⊣ F⁎ : Psh(𝒞) → Psh(𝒟)` as functor, right adjoint, dependent right adjoint.

* How is `F! ⊣ F* ⊣ F⁎` constructed?

detailedly described in (Ref 1, Appendix A), but less type-theoretically:



* Why locally representable corresponds to representable natural transformation?

* (Ref 1 §3.1)

Fix a functor `F : 𝒞 → 𝒟`, so we will have 
`F! ⊣ F* ⊣ F⁎ : Psh(𝒞) → Psh(𝒟)` as functor, right adjoint, dependent right adjoint.

But what does it mean to have dependent right adjoint? `L ⊣ R`
(Ref 2) says clearly that a dependent right adjoint is part of CwF, 
and that is, given a fixed CwF 𝒞, with `Ty : Psh(𝒞)` and `Tm : Psh(∫ Ty)`
1. we have `L : 𝒞 → 𝒞` and 
2. if `X ∈ Ty (L Γ)`, we have `R X ∈ Ty Γ` satisfying substitution coherence
3. `Tm (L Γ) T ≅ Tm Γ (R T)`  

But apparently 1 doesn't work for the three functor because they are not endo. 
We are working with modality connecting two CwF
1. For `X ∈ Ty (F! Γ)` we have `F* X ∈ Ty Γ` ?
   1. Proved in Ref 1, Appendix A 
2. `Tm (F! Γ) T ≅ Tm Γ (F* T)` ?
   1. Proved in Ref 1, Appendix A 
   2. Note that, they seem to prove the corrrspondence of the closed term of `(x : F! Γ) → T x`
      1. instead of that of `Tm (F! Γ) T`. 
      2. This idea can work because lambda closure maintains set bijection
      3. i.e. on Pg19, the `f'` is a closed term of type  `(x' : F! Γ) → A' x'` inside `Psh(𝒟)`, i.e. a nat transformation from `1 ∈ Psh(𝒟)` to `(x' : F! Γ) → A' x'`. And the bijection seems to be between
      4. `Hom(1, (x' : F! X) → A' x')` and `Hom(1, (x : X) → (F* A') (x))`

***
Now we analyze the syntax convention in Ref 1. 
We assume `X ∈ Psh(𝒞)`, (`Y` is a dependent presheaf over `F! X ∈ Psh(𝒟)`)
1. (Ref 1) writes `(x : X, {F*})` to indicate `F! X`  (`X ∈ Psh(𝒞)`)
2. (Ref 1) given a dependent presheaf `Y` over `(x : X, {F*})`, 
   1. (`Y` is a dependent presheaf over `F! X ∈ Psh(𝒟)`)
   2. (Ref 1) write `({F*} → Y (x, {F*}))` means `F* Y ∈ DepPsh(𝒞)`
3. (Ref 1) distinguishes but bijection between
   1. "elements of `Y(x, {F*})`" over `(x: X, {F*}) = F! X`
   2. and "elements of `{F*} → Y(x, {F*})`" over `(x : X)`
   3. This is exactly the iso from dependent right adjoint
4. (Ref 1) further specifiess that isomorphism, using syntax like lambda abstraction --
   1. From `t : Y` in the context `F! X = (x : X, {F*}) ∈ Psh(D)`, 
      1. (Ref 1) write `λ {F*} ↦ t` as a term of `F* Y = ({F*} → Y)` in the context `X ∈ Psh(𝒞)`, 
   2. From `t : F* Y = ({F*} → Y)` in the context `X ∈ Psh(𝒞)`
      1. (Ref 1) write `t {F*} : Y` in the cntext of `F! X ∈ Psh(𝒟)`
   3. hinted by the syntax, we have beta and eta rules for these two isomorphism, i.e. 
      1.  `λ {F*} ↦ (t {F*}) ≡ t` and `(λ {F*} ↦ t){F*} ≡ t`
   4. it almost feels like "lock abstraction as modality"
5. Surely, this syntax can work for arbitrary dependent right adjoint `L ⊣ R : 𝒞 → 𝒟`, and we can "infer the type" as follow
   1. a context `(x : X, .., {R}) = L(x:X ,...) ∈ 𝒟`
   2. a term/type (lock) abstraction `(λ{R} ↦ -), ({R} → -) ∈ 𝒞` and thus inside `- ∈ 𝒟`
   3. a term (lock) "application"/opens `-{R} ∈ 𝒟` because it is in a context with `(...,{R},...) ∈ 𝒟`
   4. Note that, in the paper they use the syntax `({R} → - {R})` instead. I have no idea why they use this


# §3.2
Assume again `F! ⊣ F* ⊣ F⁎ : Psh(𝒞) → Psh(𝒟)`

We need to properly annotate ⊛. `A` and `B` are weirdest. `A, B` both in `Psh(𝒞)`  for sure.

The following internal language makes sense,
```
<!-- where -->
_⊛_ : (A : {F*} → 𝒰D) (B : {F*} → A {F*} → 𝒰D)
      (f : {F*} → (a : A {F*}) → B {F*} a)
      (a : {F*} → A {F*})
        → ({F*} → B {F*} (a {F*}))

```
What externally is this...? I think talk about ⊛ in `F! 1 ∈ Psh(𝒟)` might be clearer.

A very big problem is that, what actually is `{F*} → 𝒰`? I don't think it is a presheaf (but ). 
I mean `{F⁎ } → 𝒰` is a presheaf because `F! ⊣ F* ⊣ F⁎ ` and thus `F* (1) ≅ 1`  

`A ∈ Psh(𝒞)(Tm ⋅ (⧆ 𝒰D)) ≅ Psh(𝒟)(Tm 🔒 𝒰D)`


# (Ref 1) §3.4 
the key part is that, a morphism `F : 𝒞 → 𝒟` can be fully described in the internal language of `Psh(𝒞)`

We mainly want to resolve Remark 4 here.