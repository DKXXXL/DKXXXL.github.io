---
layout: post
title:  "Review JS's STC's Universe"
date:   2023-11-07 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

We review universe mentioned everywhere in JS's paper.

Ref:
(JS1) https://www.jonmsterling.com/papers/sterling-2022-naive.pdf

(JS2) https://www.cs.cmu.edu/~rwh/students/sterling.pdf

(JS3) https://arxiv.org/abs/1809.08646

(JS4) https://arxiv.org/abs/2010.08599 

(JS5) https://arxiv.org/pdf/2307.09497.pdf

# Motivation

When using internal language of a category as type theory, type-theorists still tends to use 
dependent type to express predicate or all kinds of information. 
`B : A → Type` something like this. However, in internal language, this `Type` needs to be interpreted
and is usually interpreted as an **Universe Object**

***


A Universe in a category is defined in (JS2, 3.2∗1), basically a "type" `𝕌` s.t. `X ⊢ T : 𝕌` (code of type) `T : X → U` can be reflected into an object `⌜ T ⌝` an object as a (dependent) type `⌜ T ⌝ → X`

## Connective 

Covered in (JS5, Definition 1.9.1)

For example, for dependent product, we have a `Π : 𝕌 → 𝕌 → U` simply because 1.9.1 tells us `𝕌` will classifies the dependent product.
In other words, Π A B = code of ∏ (⌜ A ⌝) (⌜ B ⌝). 

This idea can work on most connectives, simply when universe classifies well.

### Why natural models on connective looks like that

Unlike (JS5, Definition 1.9.1), we also have (JS2, 3.2∗3, 3.2∗4).

## JS2, Modal Universe

Most (if not all of the basic) connectives has been covered above, but unlike modal universe in (JS2, 3.6)

This is mainly because ○ (and ⚈) has two definition while most connectives mentioned above only has one definition 
(and the function mainpulating code is derived from the one definition)

However, ○ (and ⚈) has two definition on `𝕌 → 𝕌` (JS2, 3.6) and as a functor (JS2, 2.1∗8, open modality). 
We need to prove these two definitions coincide.

*** 
No we actually don't need to do it. We only need to show the internal lex monad
`○ T = ¶ → T`
will lift to external type/object `¶ → T`, which can automatically be decomposed 
as the adjoint of open immersion.

***
Ref :
1. Modalities in homotopy type theory https://arxiv.org/abs/1706.07526
2. Syntax and semantics of modal type theory § 5.2  https://jozefg.github.io/papers/phd-thesis.pdf 
3. Logical Relation as types §3.2 https://arxiv.org/pdf/2010.08599.pdf 





## Cumulative Universe

## Realignment/Refinement

(JS2) seems using strict universe and strong universe as synonym.

(JS2, 3.3∗2) describes a general form of realigment. (JS2, 3.3∗6) introduces a type-threotic style of the realignment. 

(JS2, 3.4∗8) explains (when assume enough universes in the ambient set theory), any
logos has a strong hierarchy of universes as exposed by Gratzer, Shulman, and Sterling

(JS2, 3.4∗4) defines of a strong hierarchy of universe. 

### (JS4, Notation  3.3) How does it work?

{tᵢ}(i ∈ I) 是term of ∏ᵢ FUᵢ

q ({tᵢ}(i ∈ I)) 
= {tⱼ|(Uᵢ ∩ Uⱼ)}(i ∈ I, j ∈ I)
= {tⱼ|(Uⱼ ∩ Uᵢ)}(i ∈ I, j ∈ I)
= {tₓ|(Uₓ ∩ Uj)}(j ∈ I, x ∈ I) // change name i -> j, j -> x
= {tᵢ|(Uᵢ ∩ Uj)}(j ∈ I, i ∈ I) // change name 
?= {tᵢ|(Uᵢ ∩ Uj)}(i ∈ I, j ∈ I) // change index order (is this step wrong?)



