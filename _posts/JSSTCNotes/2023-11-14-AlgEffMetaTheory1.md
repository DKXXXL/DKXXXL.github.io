---
layout: post
title:  "Review Meta-theory of Language with AlgEff"
date:   2023-11-11 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

Ref:
(JS1) https://www.jonmsterling.com/papers/sterling-2022-naive.pdf

(JS2) https://www.cs.cmu.edu/~rwh/students/sterling.pdf

(JS3) https://arxiv.org/abs/1809.08646

(JS4) https://arxiv.org/abs/2010.08599 

(JS5) https://arxiv.org/pdf/2307.09497.pdf

(JS6) https://www.jonmsterling.com/papers/sterling-2022-naive.pdf

***

We review meta-theory of  algebraic effect. 
But our focus is on how the algebraic operation is modeled in STLC. 

Our main motivation is to achieve canonicity (as implementation) and parametricity (for equational reasoning).

We start with one specific 

# Syntax


```Haskell
record SysF where
  ty : □
  tm : ty → □
  ⇒  : ty → ty → ty 
  λ  : (tm A → tm B) → tm (A ⇒ B)
  app : tm (A ⇒ B) → (tm A → tm B)
  λβ : app (λ f) ≡ f
  λη : λ (app f) ≡ f
  //  observable for parametricity later
  𝔹 : ty 
  tt : tm 𝔹
  ff : tm 𝔹
```

<!-- # Consistency (Set Theory, Classically)
assume syntax has `⊥ : ty`. According to (JS2, § 3.7), we only need to write the algebra in the Set topos.
In set topos, the idea is to interpret ty as `{⊤, ⊥}`, 
`⇒` is interpreted as `⊤ ⇒ ⊥ = ⊥` otherwise `⊤`
`∀` is interpreted as `∀` but actually similar fashion as `⇒`.


Not really useful. -->

# Consistency (Agda)

Apparently, we can also interpret `ty = Prop` in agda, 
`∀` is `∀` in Agda, and similar for others type connectives.

What's more, this allow several kinds of extension of base type can be added, because we can 
define inductive type in `Prop` 

However, we want a more categorical formulation, to stream line artin-gluing. 

# Consistency (Categorical)

The idea is to see the fact that, we have in topos,
` ∀ : (X → Ω) → Ω `, i.e. in topos, we have `∀ : Sub(X) → Sub(Y)` adjoint to pullback

For arbitrary connective, we can use impredicative encoding as model,
Ref : https://www.andrew.cmu.edu/user/awodey/talks/BigProofs.pdf 

Provides Sum and Product and natural number.

Function type is modeled by implication I think.


# Canonicity Sketch (Agda)

<!-- Basically in above consistency, we map the `SystemF` structure into a topos, to derive consistency

Here we do the similar. Note, it is not STC as it is not internal language of artin-gluing

We consider the LCCC-signature above, and map it into "a certain topos" -- 
where we use Agda as the syntax of the internal language. 

We will map each syntax piece to _ᴾ. So we first construct the algebra.

Basically we do similar thing as using QIIT in agda, but we use a much more simpler syntax (as LCCC).

We use S.ty .,.. to emphasize syntax. But note that `S.ty : □ : Set`, i.e. `S.ty` is not a type, just a syntax piece

But unlike QIIT using display/dependent algebra, we directly maps to a pair of algebra -->

There are cases we are still unsure about the realignment is working or not.
We will need to downgrade to manual gluing, but we don't want to give up HOAS.

The issue is mainly, we know that for glued algebra `Xᴾ → Yᴾ`, we should have the syntax `S.X → S.Y`
But we don't .... not if we use glued algebra

So we manually gluing Hom, and DHom, make HOAS into primitive.

So it is possible to make every special hoas glue with a syntax. And we won't make this part explicit.


```haskell
record SystemF' where
  
  Hom : □ → □ → □
  DHom : (a : □) → (a → □) → □
  // we omit the introduction and elim rule for Hom and DHom,
  // but apparently they are lambda intro

  // using this fake syntax, we can 

  ty : □
  tm : ty → □
  ∀  : Hom(ty, ty) → ty
  Λ  : (F : (ty → ty)) → ((α : ty) → tm (F α)) → tm (∀ F)
  App : (F : (ty → ty)) → tm (∀ F) → (α : ty)  → tm (F α)

```


```haskell

module Canoncity where 
tyᴾ : Set
tyᴾ = ∑ (T : Hom(1, S.ty)), ∑ P: Hom (1, tm(T)) → Prop


tmᴾ : tyᴾ → Set
tmᴾ T = ∑ t : Hom(1, S.tm Tₛ), T.₂ t

∀ᴾ  : (tyᴾ → tyᴾ) → tyᴾ 
∀ᴾ (Fₛ, F) :  ∑ (T : Hom(1, S.ty)), Hom (1, tm(T)) → Prop
∀ᴾ (Fₛ, F) = (S.∀ Fₛ, ?X)
  where F : (tyᴾ → tyᴾ)
  where ?X : Hom(1, tm(S.∀ Fₛ)) → Prop
        ?X = λ tₛ : Hom(1, tm(S.∀ Fₛ)), 
              ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ tˢ Tₛ)

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

```


# Canonicity (STC)

Basically, we replay the above sketch. 

***
Question : 
In QIIT formulation or others, we always let
`tyᴾ = ∑ (T : Hom(1, S.ty)), ∑ P: Hom (1, tm(T)) → Prop` as motive
Why tp in JS2 doesn't look like this?

***

Note that, we also have Ω as a strong universe, by propositional extensionality.

We use the same glued topos as the STLC one, and assume there is a `S` syntax model in the topos.

We will use sterling's thesis's syntax, a record syntax. 

We also use JS6's syntax and JS2's syntax for realignment/refinement.

To correctly translate the `∑ P: Hom (1, tm(T)) → Prop` into internal logic, 
we need ⚈Ω as the proposition universe. That is we assume (later to prove)
1. if p ∈ Ω, ⚈p ∈ ⚈Ω
2. ○⚈Ω ≅ 1 (basically no syntax component)


```Haskell
Module M where
ty : {𝒰 | ¶ ↪ ty}
ty = [ ¶ ↪ T : S.ty | 
        // I want it to be 
        S.tm(T) → ⚈Ω 
      ]
// this can work simply because ○ ⚈ Ω ≅ 1.
tm : {ty → 𝒰 | ¶ ↪ S.tm}
tm (T : M.ty) = [ ¶ ↪ (x : S.tm T) | T.₂ x]
  // T.₂
  

//  let's first see if function type can be recovered
⇒  : ty → ty → ty 
A ⇒ B : [ ¶ ↪ T : S.ty | tm(T) → ⚈Ω ] ⊆ { ty | ¶ ↪ S.⇒ A B }
A ⇒ B = [¶ ↪ S.⇒ A B | 
      ?b
      // [¶ ↪ (f : S.tm (S.⇒ A B)) | ⚈ ∀ (a : tm(A)),  tm (B) (app f (○ a)) ]
     ]
  where ?b : tm(S.⇒ A B) → ⚈Ω
        ?b t = ⚈ ∀ (a : tm(A)),  B.₂ (app t (○ a))
λ  : (tm A → tm B) → tm (A ⇒ B)
λ f : tm (A ⇒ B) ⊆ { ¶ ↪ S.λ f}
λ f : [ ¶ ↪ (t : S.tm T) | ⚈ ∀ (a : tm(A)),  B.₂ (S.app t (○ a))]
λ f = [ ¶ ↪ (S.λ ○f) | ?c ]
  where ?c : ⚈ ∀ (a : tm(A)),  B.₂ (f (○ a))
        f : tm A → tm B
        f a : [ ¶ ↪ (x : S.tm T) | B.₂ x]
        ?c = ⚈ (f a).₂
app : tm (A ⇒ B) → (tm A → tm B)
app t a : tm B
  where t : tm (A ⇒ B) 
          ≡  [ ¶ ↪ (x : S.tm ((A ⇒ B))) | ⚈ ∀ (a : tm(A)),  B.₂ (app x (○ a))]
app t a = [ ¶ ↪ (S.app t a) | t.₂ a]
λβ : app (λ f) ≡ f
λη : λ (app f) ≡ f

∀  : (ty → ty) → ty 
∀ (F : ty → ty) : [ ¶ ↪ T : S.ty | S.tm(T) → ⚈Ω  ]
∀ F = [ ¶ ↪ S.∀ F | ?b ]
  where ?b : S.tm(T) → ⚈Ω
        ?b t = ⚈ ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ tˢ Tₛ)

Λ  : (F : (ty → ty)) → ((α : ty) → tm (F α)) → tm (∀ F)
App : (F : (ty → ty)) → tm (∀ F) → (α : ty)  → tm (F α)

Λβ : App F (Λ F f) ≡ f
-- do we want the following?
Λη : Λ F (App F f) ≡ f


𝔹 : [ ¶ ↪ T : S.ty | 
        // I want it to be 
        S.tm(T) → ⚈Ω 
      ]
𝔹 = [ ¶ ↪ S.𝔹 | λ t, ⚈ t = S.tt ∨ t = S.ff ]
tt : tm 𝔹
   ≡ [ ¶ ↪ (x : S.tm 𝔹) | ⚈ x = S.tt ∨ x = S.ff]
tt = [ ¶ ↪ S.tt | ... ]
ff : tm 𝔹
```


## Assumption needs to be resolved:

1. if p ∈ Ω, ⚈p ∈ ⚈Ω
2. ○⚈Ω ≅ 1 (basically no syntax component)
3. ⚈ is a monad
4. ⚈ (∀a, P) can be applied with ⚈a


# Parametricity (Agda)