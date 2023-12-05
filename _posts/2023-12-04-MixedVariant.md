---
layout: post
title:  "Eliminator for Algebra of Mixed Variant Functor"
date:   2023-11-30 00:56:11 -0400
categories: Type-Theory
---

Ref : 
1. https://arxiv.org/pdf/2307.08514.pdf  Modular Denotational Semantics for Effects with Gu...
2. https://ncatlab.org/nlab/show/algebraically+compact+category
***

In Ref 1, § 3.1. It introduces the elimination principle for IT. But I have no idea how it comes up.

## Review

1. For initial algebra `X` of `F`, given arbitrary arbitrary `F(K) → K`, we have a unique arrow `f : X → K`

Example: 

```
Module _ where 
data Nat = 1 + Nat // Nat\s functor F : X ↦ 1 + X  
rec : (R : Set) → (1 → R) → (R → R) → Nat → R
    ≅ (R : Set) → (1 + R → R) → Nat → R
// this rec gives us the exact morphism given arbitrary (F(R) → R)
// with computation rules:
rec R R0 Rn 0 = R0
rec R R0 Rn (S n) = Rn (rec ... n)
```



2. For final coalgebra `X` of `F`, given 