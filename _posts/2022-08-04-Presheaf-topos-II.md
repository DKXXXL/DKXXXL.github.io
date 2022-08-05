---
layout: post
title:  "Review HOAS for meta-theory reasoning, I"
date:   2022-08-05 00:56:11 -0400
categories: Type-Theory
---
Reference: 
Hofmann, Martin. "Semantical analysis of higher-order abstract syntax." Proceedings. 14th Symposium on Logic in Computer Science (Cat. No. PR00158). IEEE, 1999.

Sterling, Jonathan, and Bas Spitters. "Normalization by gluing for free {\lambda}-theories." arXiv preprint arXiv:1809.08646 (2018).

STERLING, JONATHAN. "Naïve logical relations in synthetic Tait computability."

Hu, Jason ZS, Brigitte Pientka, and Ulrich Schöpp. "A Category Theoretic View of Contextual Types: from Simple Types to Dependent Types." arXiv preprint arXiv:2206.02831 (2022).

*** 

# Intro

The story first began at (Sterling & Spitters, 2018) -- they were using HOAS in section 3.2! I will quote the original sentence to here:
> Writing `𝒱(τ)` for the representable presheaf `y(τ) ∈ Pr(Ren-Cat)` of variables, we can equivalently use a higher-order notation for terms from inside the topos, with constructors
like the following
> 
> `v : 𝒱(τ) → Ne ? τ`
> 
> `λ : (𝒱(σ) → Nf ? τ) → Nf ? (Arr σ τ)`
> 
>  This is justified by the fact that all the generators of `Tm`, `Ne` and `Nf` commute with the presheaf renaming action. When working internally, we will implicitly use these notations as a simplifying measure.

The problem here is that -- 
1. What is 'representable presheaf of variables'?
2. What is the concrete construction of λ?
3. What does above mean? Why commutation is enough?
4. Will there be any problem/restriction using HOAS as syntax? Say the style as Naive Logical Relation demonstrated.
5. (Sterling & Spitters, 2018) and (Hofmann 99) both emphasizes in the presheaf topos
6. (Sterling & Spitters, 2018) says these are constructors, that means we have an eliminator! What does that look like? (Especially for `Nf ? (Arr σ τ)`, does everything in this presheaf definable by this `λ`?)


***

For 1, the yoneda embedding `y : Ren-Cat → Pr(Ren-Cat)` and thus `y(τ)` is one presheaf object since renaming category has all the types in it. `y(τ)`, concretely, will be the variant set of permutation -- i.e. for example `y(τ)(Γ)` is the collection `Ren-Cat(Γ, τ)`, thus `y(τ)` is variant on the context `Γ`.  

We can alias `𝒱τ = Ren-Cat ? τ` to make things easier. In a lot of mechanization, `Var _ _` is also used in `Ren-Cat` construction

Thus we know how `v : 𝒱τ ⇒ Ne ? τ` is constructed, since `v Γ : Ren-Cat(Γ, τ) → Ne Γ τ` is trivially the definition of `Ne Γ τ`. 


***

For 2, what is `λ : (Ren ? σ ⇒ Nf ? τ) ⇒ Nf ? (Arr σ τ)`? 
```haskell
λ f Γ = lam h
  where 
  h : Nf (Γ, σ) τ
  h = f (Γ, σ) π₁
```

***

For 3, let's first see why it is commuting

***

Question 4 is still the problem: 
The meaning of using HOAS to model syntax, say we have
```haskell
data tm where
  lam : (tm → tm) → tm
  app : tm → tm → tm 
```
then use this `tm` should be equivalent to use first order syntax to define `tm` -- 
1. we should have constructors
2. we should have a good eliminator, that can do all the thing the eliminator for the first order syntax can do -- pretty printing, evaluation, NbE, and so on.

These above questions seems hard and inappropriate to ask in this post because 

But Question 4 itself is problemtic
1. (Sterling & Spitters, 2018) is not using HOAS as syntax, it is sticking to explicit substitution (in first order syntax). So it is far from the signature in Naive Logical Relation
2. This HOAS seem more like a syntactic sugar -- mainly because the model we are constructing is presheaf (over renaming) model and each arrows in renaming category can yoneda embed into presheaf model and act as renaming action, thus the above high-order notation `λ` can have good substitution property

It is definitely not 
