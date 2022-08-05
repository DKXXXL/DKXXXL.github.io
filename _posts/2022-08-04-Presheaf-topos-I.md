---
layout: post
title:  "Presheaf topos, I, is a topos"
date:   2022-08-04 00:56:11 -0400
categories: Type-Theory
---

Intuitively, topos are "those models that can interpret language expressing proposition (i.e. a type `Prop`)". 
This concept is very verstile as there are some topos whose truth are weird -- for example (Hofman 99)[https://ieeexplore.ieee.org/document/782616] come up with a topos that doesn't admit *principle of unique choice*, which is quite common in constructive logic and of course with a computational interpretation.
```haskell
PUC = ∀ A B (R : A → B → Prop). 
        (∀ a : A ∃!b : B. R(a, b)) →
        ∃ (f : A → B), 
            ∀a : A, R(a, f(a))
```
We decide to start with presheaf topos, because it is more concrete and with more intensional information, and has been proved useful in our NbE.

# Definition of Presheaf topos

# Presheaf topos is a topos

## Definition of topos

## What each definition mean, concretely?
<!-- talk about the meaning of each definition
    in presheaf topos and in 
 -->

## How Ω is a Proposition anyway?

<!-- we need to show some examples here
      how each proposition is interpreted using topos
    for example, 
 -->