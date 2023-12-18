---
layout: post
title:  "Transpilation between languages, 1"
date:   2023-11-30 00:56:11 -0400
categories: Type-Theory
---
We deal with System F to STLC translation

***
System F's syntax
```Haskell
record SysF where
  ty : □
  tm : ty → □
  ∀  : (ty → ty) → ty 
  Λ  : (F : (ty → ty)) → ((α : ty) → tm (F α)) → tm (∀ F)
  App : (F : (ty → ty)) → tm (∀ F) → (α : ty)  → tm (F α)
  Λβ : App F (Λ F f) ≡ f
  -- do we want the following?
  Λη : Λ F (App F f) ≡ f
  ⇒  : ty → ty → ty 
  λ  : (tm A → tm B) → tm (A ⇒ B)
  app : tm (A ⇒ B) → (tm A → tm B)
  λβ : app (λ f) ≡ f
  λη : λ (app f) ≡ f
  //  observable for parametricity later
  𝔹 : ty 
  tt : tm 𝔹
  ff : tm 𝔹
  ifb : tm 𝔹 → tm T → tm T → tm T
  ifbβ₁ : ifb tt x y ≡ x 
  ifbβ₁ : ifb ff x y ≡ y 
```

```agda 
record STLC : Set where 
  ty : □
  tm : ty → □
  bool : ty 
  true :  tm bool
  false : tm bool
  arr : ty → ty → ty
  lam : (tm A → tm B) → tm (arr A B)
  app : tm (arr A B) → tm A → tm B
  lamβ : app (lam f) = f
  lamη : lam (app f) = f 
```

∀F compiles to ∀ (x : ty), tm (F x)
Λ F f compiles to f : 
𝔹 compiles to STLC.tm (𝔹)
tt compiles to 

Basically using `⟦ ⟧ : SysF → STLC`. We can totally work on the language of signature
i.e. this is a well-typed syntactic translation

```haskell
Module Compilation where
⟦ SysF.ty ⟧ : ?
⟦ SysF.ty ⟧ = □
⟦ SysF.tm ⟧ : ⟦ SysF.ty ⟧ → ?
⟦ SysF.tm T ⟧  = ⟦ T ⟧
⟦ ∀ F ⟧ : □
// ⟦ F ⟧ : □ → □ 
⟦ ∀ F ⟧ = ∏ (α : □) → ⟦ F ⟧ α
// f : ((α : ty) → tm (F α)) -->
// ⟦ f ⟧ : ∏ (α : □) → ⟦ F ⟧ α  -->
⟦ Λ F f ⟧ : ⟦ ∀ F ⟧ = ∏ (α : □) → ⟦ F ⟧ α
⟦ Λ F f ⟧ = ⟦ f ⟧
⟦ App F f α ⟧ : ⟦ tm (F α) ⟧ = ⟦ (F α) ⟧ = ⟦ F ⟧ ⟦ α ⟧
// f : tm (∀ F) -->
// ⟦ f ⟧ : ∏ (α : □) → ⟦ F ⟧ α -->
⟦ App F f α ⟧ = ⟦ f ⟧ ⟦ α ⟧

⟦ 𝔹 ⟧ : □
⟦ 𝔹 ⟧ = tm STLC.𝔹

⟦ A ⇒ B ⟧ : □
⟦ A ⇒ B ⟧ = ⟦ A ⟧ → ⟦ B ⟧  
```
things can work, but downside
1. how to prove its correctness? We need to expand base type relation
2. actually bin log rel. But if you remember how closed paramtricity works, 
3. that requires special treatment on the syntax, two make it into two part syntax in ○ world
4. In our case, it will be asymmetric
5. However, if we want several different compilation target, we need to alter the syntax world all the time
6. Can we make a verstile language?


***

## First Attempt : Use Canonicity model for y(SysF) 

And at the semantic/meta/⚈ level, we introduce a QIIT syntax for STLC to do compilation --
achieve compilation using unary LR.

This way we can introduce multiple compilation target.

```haskell
ty* = [¶ ↪ T : ty | tm T → P T → ⚈Ω ]
tm* A = [¶ ↪ t : tm A | ∑ c : P (○ A),  A.₂ t c  ]

```
This won't work. It works for base type, but in won't work for lambdas.

## Second Attempt -- binary log rel but assymetric

We glue two piece of syntax at the syntax piece. Basically look like 

## Something easier : Compile STLC to STLC
But left hand side is HOAS while RHS is syntax with contexts.

We need to solve the following problem
1. We need to specify syntax + semantic in semantic/meta-space
   1. We either use HOAS (the `var(A)`)
   2. or we use first order syntax
   3. Use the former one, how to specify the quotient and semantic? we cannot apply `var(A) → ?` with `tm(A)`
   4. the latter one we can easily specify the quotient (semantic) but it would be lengthy (with explicit subst)
      1. and it is hard to imagine how to glue it -- each syntax maps to what? a `Hom(-, syntax)`? 
      2. This requires internal natural transformation? no?
   5.  




***

Research Idea : 
1. Use Observational Type Theory to replace topos in STC
2. At Syntax World, instead of fixing with certain TT syntax, 
   1. use language of signature so that the user can use LF to indicate arbitrary TT syntax
      1. Recall how a particular TT syntax is a slice over a certain TT signature
      2. if we can internalize this step into the TT, then we can do it
   2. also make it possible for binary LR, including two different LF language   
   3. We need to think of how adequacy looks
3. We can also explore intensional analysis/meta-programming in STC
   1. we may not be able to pattern matching syntax piece yet, 
   2. but we can do code generation on semantic/Natural number in STC