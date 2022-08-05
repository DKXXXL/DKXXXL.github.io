---
layout: post
title:  "Presheaf topos, II, has a HOAS inside"
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
> Writing `𝒱(τ)` for the representable presheaf `y(τ) : Pr(Ren-Cat)` of variables, we can equivalently use a higher-order notation for terms from inside the topos, with constructors
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
4. Will there be any problem using HOAS as syntax ? As Naive Logical Relation demonstrated.





