---
layout: post
title:  "CCC/LCCC as binding structure, I"
date:   2022-08-05 00:56:11 -0400
categories: Type-Theory
---

Slogan : Context and substitution is handled by CCC/LCCC, we should not make it impact other parts

We try this idea starting from CCC/STLC substitution calculus 



-- following is not working either
```agda
record SubstCal where 
  Type : Set
  Ctx  : Set
  Tms : Ctx → Type → Set
 
  ⋆   : Ctx 
  _▷_ : Ctx → Type → Ctx
   
  Exp  : Type → Type → Type
  ⊤    : Type

record STLC where
  ty = Type 
  tm A = Tms ⋆ A

  _⇒_ : ty → ty → ty
  -- lam : (tm A → tm B) → tm (A ⇒ B)
  lam : Exp ()
```
***
-- following is failing as well
```haskell


record CCC where 
  Obj  : Set
  Hom  : Obj → Obj → Set
  Exp  : Obj → Obj → Obj
  Prod : Obj → Obj → Obj

-- We use CCC as the binding, the following seems not working

record Lang where
  El : Obj → Set

  ty : Obj       -- code of Universe
  tm : ty → Obj  


  _⇒_ : El ty → El ty → El ty
  lam : El (Exp (tm A) (tm B)) → El (tm (A ⇒ B))
  app : tm (A ⇒ B) → tm A → tm B
```
***

-- let's try again, admit we are working in Obj

```haskell

-- Syntax Level stuff
record CCC where 
  Obj  : Set
  ⋆ : Obj
  Hom  : Obj → Obj → Set
  Exp  : Obj → Obj → Obj -- internal hom
  Prod : Obj → Obj → Obj
  Adjun : Hom(Prod A B, C) ≅ Hom(A, Exp B C)

  

-- We again use CCC as the binding
record Lang where
  El : Obj → Set
  -- we need following to construct  
  mp : El (Exp A B) → El A → El B
  -- modus ponens
  -- El O = Hom(⋆, O), maybe?
  -- But note: if El = Hom(⋆, -) and tm = Exp(⋆, -), then we cannot create terms in open ctx
  --  thus at least one is making things into "presheaf", i.e. parametrici on the first argument, either El or tm. We choose El here


  ty : Set --- this will make ty = Obj
  --  this seems working, but it doesn't align with Sterling's formulation
  tm : ty → Obj  
  -- tm A = Exp ⋆ A
  -- tm is working as well

  -- an alternative choice is
  -- ty : Obj 
  -- tm : ty → Obj -- let's see later what it leads to

  -- the following should be directly Exp
  ⥇ : Obj → Obj → Obj

  -- HOAS stuff
  -- lam : (tm A → tm B) → tm (A ⇒ B), this is the standard definition
  --   it can be 

  -- we use a ∷ A to indicate a : El A
  _⇒_ ∷ ty ⥇ ty ⥇ ty
  lam ∷ (tm A ⥇ tm B) ⥇ tm (A ⇒ B)
  app ∷ tm (A ⇒ B) ⥇ tm A ⥇ tm B

  

  𝔹 ∷ ty
  tt ∷ tm 𝔹
  -- tt : El (tm 𝔹)
  ff ∷ tm 𝔹
```

Canonicity should be saying 
```Haskell
-- El (tm 𝔹) 
∀ b : El(tm 𝔹), b ≡ tt + b ≡ ff

```

This seems good enough because, it seems like every
open term `Γ ⊢ t : T` is exactly `t : Hom(Γ, T)`

Say
```
Γ , A ⊢ t : T
--------------
Γ ⊢ lam t : A ⇒ T
```
is corresponding to 

`t : Hom(Prod Γ A, T)`

~>  `λt : Hom(Γ, A ⥇ T)`

assume we have `Exp (Exp ⋆ A) (Exp ⋆ B) ≅ Exp A B` which makes sense because `A ≅ (Exp ⋆ A)`

~>  recall that `lam ∷ (tm A ⥇ tm B) ⥇ tm (A ⇒ B)` 
~>  where `⥇` is exactly `Exp`
~>  and we have `mp : El (Exp A B) → El A → El B`
~>  thus we need `El ((tm A ⥇ tm B)) ≅ El (Exp A B) ≡ Hom(?, A ⥇ B)`, which is exactly `λt`
~> `mp lam (λt) ∷ Hom Γ (A ⇒ B)` we are done here

Maybe we can make `tm` also more transparent


***

In the above signature is a bit off compared to Sterling's. let's see what is going on
```Haskell
  𝕌 : Obj 
  -- I know this 𝕌 doesn't make sense here in STLC but bare with me,
  --  this 𝕌 is to let us define type 'code' inside
  --   but do we really want it? due to the following ty
  ty : Obj -- ty = 𝕌 basically
  tm : ty → Obj -- tm A = Exp ⋆ A, but universe lifting happens here

```
Apparently, `𝕌 = Set 0` and `Obj = Set 1`

The most nervous part is that, we will have again
```haskell
_⇒_ ∷ ty ⥇ ty ⥇ ty
lam ∷ (tm A ⥇ tm B) ⥇ tm (A ⇒ B)
```
but this time `⇒` and `⥇` are operating on the different levels now (One is between ty the other is between Obj), so it is hard to say if this is deducible.

To resolve this, we actually want `⇒` and `⥇` operating on the same level, that means their input argument `tm A` and `A` should be the same level. That means `tm A = Exp ⋆ A` and `A` has to be at the same level. Basically saying `tm` has to have type `tm : Obj → Obj` make `ty = Obj`

Sterling doesn't have this issue because his `el` is actually identity and thus doesn't have this issue. (He doesn't do things like here where we 'close' terms into (almost) ground term)

So we will stick to earlier decision
