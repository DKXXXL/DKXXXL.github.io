---
layout: post
title:  "Presheaf topos, III, reflects a lot"
date:   2022-08-04 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

Given a category, say CCC category, we can embed it into its presheaf topos and start researching it.

On the other hand, we can also use Agda + QIIT to define QIIT inside Agda and do research. 

Actually these two routines are similar and actually the second one is more natural---usually people first define their meta-theoretical framework and then define their object using that framework, not the other way around.

So why we do other way around? What is the benefit? 


Because Presheaf Topos is a very good framework (with a lot of structure already). Sometimes it can *reflects* a lot of structure back to the base category to investigate stuff, and this is what we want to discuss here.

Also act like a post that trains about yoneda, representable functor and etc.

***

## Presheaf topos reflects representable exponential

* For `C`, sicne `Pr(C)` has exponential `X'` and if `X' ≅ Hom(-, X)` for

***
Can Presheaf Topos reflects more? like limit and colimit?

***

fully faithful functor [reflects limit and colimit](https://ncatlab.org/nlab/show/full+and+faithful+functor)

## What does 3 mean? Detailedly?

Quesion: can we embed CCC into PSh(CCC) and starts doing reasoning about CCC?



If this is too trivial, (since there is no abstraction/polymorphism inside CCC), can we do something similar to some (im)predicative polymorphic lambda calculus?

For example, can we prove some equivalence argument (in System F that would be parametricity), like church encoding of boolean is "the same" as boolean?



## Programming in Presheaf Topos

## Presheaf Topos on CCC

## HOAS in Presheaf Topos