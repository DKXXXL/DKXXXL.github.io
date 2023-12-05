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

* For initial algebra `X` of `F`, given arbitrary arbitrary `F(K) → K`, we have a unique arrow `f : X → K`

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

§ 3.1 also illustrates how to construct `p` given `p₁` and `p₂`
```
p(0) = p₁
p(n+1) = p₂(n, p(n))
```
Basically let `R := ℕ × R`


* For final coalgebra `X` of `F`, given arbitrary arbitrary `K → F(K)`, we have a unique arrow `f : K → X`
```
Module _ where 
// codata coNat = 1 + coNat // Nat\s functor F : X ↦ 1 + X  
codata coNat = c : (1 + coNat) → coNat
Definition infinite = S infinite
corec (R : Set) → (R → 1 + R) → R → coNat
corec R f x = 0 if f x = left _
corec R f x = S (corec R f y) if f x = right y
```

# For bi-algebra

Categorically speaking, Ref 2 tells us, given a initial & terminal bi algebra `X ≅ F(X, X)` (in a algebraic compact category)
where `F` is contravariant and covariant at the first and second position,

then for arbitrary bi algebra `K`
(thus with two morphisms `f : K → F(K, K), g : F(K, K) → K`, the two morphisms don't have to be inverses to each other
  just consider this as a algebra and a coalgebra).

we will have two unique morphism `r₁ : X → K, r₂ : K → X`, not really related as well -- because `X` is both intial and terminal algebra.

***
While in our case in the SGDT, we construct the pair `r₁ : X → K, r₂ : K → X` using guarded recursion -- 
basically we construct a function `((X → K) × (K → X)) → ((X → K) × (K → X))`, and take fixpoint of it.

The construction is as expected -- given `h₀ : ((X → K) × (K → X))`，
we construct 
`X --unroll--> F(X, X) --h₀.₁-->F(X, K)--h₀.₂-->F(K, K) --g--> K`
and the other direction is similar. 

# More about §3.1
Definition 3.3 points out, if given 
`P → F(P, P)` and  `F(IT + P, IT × P) → P`, we can have two morphism `h : P → IT, k : IT → P`.

THis is simply because we have `F(P, P) → F(IT + P, IT × P)` when constructing the above guarded recursion
***

But when do we use Definition 3.3 in Ref1? Actually everywhere, for example https://github.com/logsem/gitrees/blob/25a2d60c13d28812051d2bad922ecc9cd2d1909b/theories/gitree/core.v#L1139 indicates the `get_fun` is using it.

The correct way of understanding this special recursor, is that
1. In every covariant position, `P` is strengthened to `IT × P` where we can extract `P` as well as the original data `IT`
2. In every contravariant position, since it is contravariant, it must be in front of an arrow or something. Then 
`P → IT + P` can help to relax the input to `P`; similarly, 


The intuition is that, initially, we have to construct `▷ (X → P) → P` as a recursion handler to reduce IT to P. 
Now it is strengthened 
to instead `▷ (X → IT × P) → P`, which is more powerful and easier 
because we know more  (we also know `IT`) when constructing the consequent `P` in `▷ (X → IT × P) → P`; 
dually for the  contrvariant position (require less)


