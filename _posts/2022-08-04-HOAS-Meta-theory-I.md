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

Despeyroux, Joëlle, Amy Felty, and André Hirschowitz. "Higher-order abstract syntax in Coq." International Conference on Typed Lambda Calculi and Applications. Springer, Berlin, Heidelberg, 1995.

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
3. Will there be any problem/restriction using HOAS as syntax? Say the style as Naive Logical Relation demonstrated.
4. (Sterling & Spitters, 2018) and (Hofmann 99) both emphasizes in the presheaf topos we have `𝓕^(yτ)(Γ) ≅ 𝓕(Γ × τ)` as *a simpler characterization of exponential by representable*, why?
5. (Sterling & Spitters, 2018) says in section 3.2 these are constructors, that means we have an eliminator! What does that look like? (For example, for `Nf ? (Arr σ τ)`, does everything in this presheaf definable by this `λ`?) Does that mean, the presheaf `Nf ? T` can be seen (inductively) constructed via these constructors? 
6. Is λ commuting with renaming? and why is Rnf commutes with λ in the proof of reify and reflect yoga for function?


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

Question 3 is still the problem: 
The meaning of using HOAS to model syntax, say we have
```haskell
data tm where
  lam : (tm → tm) → tm
  app : tm → tm → tm 
```
then use this `tm` should be equivalent to use first order syntax to define `tm` -- 
1. we should have constructors
2. we should have a good eliminator, that can do all the thing the eliminator for the first order syntax can do -- pretty printing, evaluation, NbE, and so on.

These above questions seems hard but inappropriate to ask in this post because 

But Question 3 itself is problemtic
1. (Sterling & Spitters, 2018) **is not using HOAS as syntax**, it is sticking to explicit substitution (in first order syntax). So it is far from the signature in Naive Logical Relation
2. This HOAS seem more like a syntactic sugar -- mainly because the model we are constructing is presheaf (over renaming) model and each arrows in renaming category can yoneda embed into presheaf model and act as renaming action, thus the above high-order notation `λ` can have good substitution property


***

For 4 and 5, it is because `Nf ? τ` is a presheaf object over renaming, and thus using we have `(Nf Γ T)^𝒱(σ) ≅ Nf (Γ, σ) T` while the latter one is exactly the premise of `lam` to construct `Nf Γ (Arr _ _)`, thus we can have `λ` as another constructor. Similar for `v`, since `𝒱τ` is exactly `Ren-Cat(?, τ)`, which is part of the premise to construct `Ne ? τ`, thus `v` is the same constructor in another form.

Now with this concrete example, this following quote why this *simpler characterization of exponential by representable* is useful in (Hofmann 99) become understandable:
> In a nutshell the idea is as follows. Interpret the metalanguage in an appropriate functor category `Pr(C)` where `C` is chosen such that all metalanguage types appearing in negative
positions (such as tm in the typing of lam in the definition) are representable. Then use Equation 17 to analyse the types of constants.

I actually don't really know what this final word 'type of constants' mean, I guess he meant to say type of "first order structure" (i.e make function space back into first order, just like how `(Nf Γ T)^𝒱(σ) ≅ Nf (Γ, σ) T`)


***

For Question 6, let's first see why it is commuting



***

# Review: Hofmann's HOAS, 3rd Style syntax

Question 4 is not here in 3rd style, because this HOAS is not breaking strict-positivity condition. We still have initial-algebraic semantic -- actually,  (Despeyroux et al 1995) has an example of preservation (of type safe proof), and I believe there are multiple example in the literature that using this style to do meta-theory.

In fact, I don't see the advantage of using this style -- I prefer HOAS because in Naive Logical Relation, we see most substitution lemma/naturality condition is omitted by shifting from explicit sub to HOAS. But here using 3rd Style syntax, we still have to prove substitution lemma again. 

Then the only question remain is that, what is (Hofmann 99) section 7 (3rd style) aiming at? Since (Despeyroux et al 1995) has shown in Coq an induction principle, and we have initial algebraic semantic for sure.


# Review: Adequacy of Hofman's HOAS, intrinsically