---
layout: post
title:  "More Categorical Construct for Type Theory"
date:   2022-07-16 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

This post is to figure out 
1. indexed cat
2. fibration 
3. displayed cat
Theory of signature, including
4. displayed algebra
5. section of displayed algebra
6. family of presheaf

We list out there references:

**indexed cat and fibration** :
* [Catgeory of Containers](https://www.cs.le.ac.uk/people/ma139/docs/thesis.pdf)  Chapter 3 Thesis by Michael Gordon Abbott
 *  This is too category thereotic and I cannot yet find their advantage

**displayed cat**
* [Original Paper](https://arxiv.org/abs/1705.04296) by Benedikt Ahrens, Peter LeFanu Lumsdaine
* nlab : https://ncatlab.org/nlab/show/displayed+category 

**signature, displayed algebra, its section**
* [Constructing quotient inductive-inductive types](https://dl.acm.org/doi/10.1145/3290315) by Ambrus Kaposi, András Kovács,Thorsten Altenkirch


**Family of Presheaf** 
* Kaposi, Ambrus. Type theory in a type theory with quotient inductive types. Diss. University of Nottingham, 2017. 
  * Section 5.2.2
* Hofmann, Martin. "Syntax and semantics of dependent types." Extensional Constructs in Intensional Type Theory. Springer, London, 1997. 13-54.
  * Section 4.1

***
# Indexed Cat and Fibration
They are talked about in the earlier post 

# Displayed Cat



# Signature, Displayed Algebra, its section



## Theory of Signature
* "Constructing quotient inductive-inductive types" introduces the concept of theory of signature
* the theory of signature is an internal type theory (i.e. a type theory defined in an ambient type theory)

The motivation of introducing theory of signature is that,
* once we admit the theory of signature as a concrete QIIT type, then we can have all finite QIIT type
  * Just like once we have W-type, we have (can encode) all inductive type
* The trick is to use theory of signature to encode all kinds of signatures, and mapping signature to appropriate type for notions of algebra, algebra morphism and etc
* A concrete example is at Section 1.1, if we want equation inside signature, Section 1.2 is sufficient

## Displayed Algebra (over other algebra), and its section
Section 1.1 has roughly illustrated how displayed algebra looks like. Basically a predicate over type (as motive) and terms for 

For example, for `ℕ ≡ (N : 𝕌, zero : N , suc : N → N)` as a signature, we have its algebra `ℕᴬ ≡ ∑ N : Set, ∑ zero : N, ` (Note that ℕ is expressed inside theory of signature (an internal type theory), while ℕᴬ is a type in the ambient type theory)

Then for an algebra `a : ℕᴬ` a display algebra for a particular algebra `a`, would be `ℕᴰ(a) ≡ ∑ Nᴾ : N → Set, ∑ Nᴾ z, (x : N) → Nᴾ x → Nᴾ (succ x)`


One can see that, displayed algebra is basically just the "dependent part of the dependent pair". Or if I speak more clearly, `(∑ (a : ℕᴬ) . ℕᴰ(a)) : Set ` itself is an algebra. So basically it is a systematic and clearer concept when we do logical relation. 

The section is the required coherence condition to make it possible to have `f : ℕᴬ → (∑ (a : ℕᴬ) . ℕᴰ(a))` an algebra homomorphism, such that `π₁ ∘ f = id`. Roughly speaking, section is an appropriate

### Why is it called section? 
What's the relationship of this section with that section in the context of fibration?

## Family of Presheaf 
Family of presheaf is just a presheaf over elements of presheaf.
https://types.pl/@endexl/109327370483620195