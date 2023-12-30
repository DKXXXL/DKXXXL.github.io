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

Basically we want to understand modality and those two presheaves mentioned in Ref 1
***

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

does it mean our dependent right adjoint is among the internal language 

