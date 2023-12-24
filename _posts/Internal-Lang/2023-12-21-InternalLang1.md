---
layout: post
title:  "Review Internal Language"
date:   2023-12-21 00:56:11 -0400
categories: Type-Theory
---

Ref
1. Introduction to Higher Order Categorical Logic
2. https://ncatlab.org/nlab/show/internal+logic 
   1. Reference section of this nlab has a lot of materials but I don't find good ones
3. https://people.mpi-sws.org/~dreyer/courses/catlogic/jacobs.pdf
4. On the Interpretation of Type Theory in Locally Cartesian Closed Categories
   1. https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=b700ba7fdfbc8cacc04b2b1c5c151ac222bf9b87 
5. Syntax and Semantics of Dependent Types
   1. https://www.irif.fr/~mellies/mpri/mpri-ens/articles/hofmann-syntax-and-semantics-of-dependent-types.pdf
6. https://www.cs.cmu.edu/~rwh/students/sterling.pdf 
7. https://arxiv.org/pdf/2102.11649.pdf Relative Induction for TT
8. 

I don't find good materials on this topic. Let's focus on several stuff
1. Find out the first order QIIT syntax of nat model, especially for HOAS (Pi-type)
   1. this is about presheaf model and nat model
2. Ref1, Starting Chapter 2, §5
   1. this is about arbitrary topos, and morphism equality
3. Cat Logic and Type Theory, §7

***

# Nat Model, Signature


## There are three notions  
1. `Psh(∫ Ty) ≅ Psh(𝒞)/Ty` when `Ty ∈ Psh(𝒞)`
2. `Tm : Ty → 𝕌` as an internal language of `Psh(𝒞)`

Ref 7 indicates that, 2 can unfold to a classic QIIT/CwF notion. Why?


For the first one, 
1. because if we have `Tm ∈ Psh(𝒞)/Ty`, that means `Tm : Tm' → Ty : Psh(𝒞)` is an arrow.
Then in the internal language of `Psh(𝒞)` **as LCCC**, we have `_ : Ty ⊢ 𝑇𝑚 type`. 
(Note: To be rigorous, according to Ref 4, this interpretation can work only with LCCC + chosen pullback, 
anyway it can work)
1. Since we have `Tm ∈ Psh(∫ Ty)`, then by Ref 5, we have `Tm ∈ ty(Ty)`, i.e. `Ty` is the context (as a presheaf),
   1. `ty(Ty)` is the family of types in the internal language of `Psh(𝒞)` in the context `Ty`
   2. `Tm ∈ ty(Ty)` means `_ : Ty ⊢ 𝑇𝑚 type`


For the second one,
1. By (Ref 6, §3.2) provides a definition of universe in category (an extensional/categorical definition)
2. given `Tm : Ty → 𝕌 : Psh(𝒞)`, by the defintion, we have an arrow `𝑇𝑚 : Tm' → Ty : Psh(𝒞)`, 
3. which by 1, we can get a `𝑇𝑚 ∈ Psh(𝒞)/Ty ≅ Psh(∫ Ty)`, the right notion of `tm` in CwF 

So we can unfold a higher order model 

Apparently, a more concrete definition of universe is by STREICHER

***
Given `{ty : 𝕌, tm : ty → 𝕌} : Psh(𝒞)`, 
Given `X ∈ ty Γ ≅ Hom(yΓ, ty)`, then what about `∏ (a : yΓ), tm(X a)`? 
Is it what we think it is? The set `tm(X, Γ)`?


## Why Local Representable ≅ Rep Nat Trans?

## How HOAS unfolds to first order syntax (QIIT)?
Ref 7 claims that, the Higher order model can unfold to a first order model,
then we prove some concrete example, by transplanting the proof from (Ref8, Propositon 5/6)



1. `tm(𝔹) → ty : Psh(𝒞)` can be unfold to an element in `ty(Γ ▷ 𝔹) ≅ Hom (y(Γ ▷ 𝔹), ty)`
2. `tm(X) → ty : Psh(𝒞)` can be unfold to `ty(Γ ▷ X)`
3. `tm(X) → tm(Y) : Psh(𝒞)` can be unfold to `tm(Γ ▷ X, Y)` 

Note, actually LHS are all internal hom instead of real morphism. 


#
