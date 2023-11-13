---
layout: post
title:  "Review System F Meta-theory"
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

We review meta-theory of System F, in LCCC LF style.
We have already told you that write out all substitution lemmas is a nightmare
especially for the case there are two different binder and two 
different kinds of substitution

# Syntax


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

Basically in above consistency, we map the `SystemF` structure into a topos, to derive consistency

Here we do the similar. Note, it is not STC as it is not internal language of artin-gluing

We consider the LCCC-signature above, and map it into "a certain topos" -- 
where we use Agda as the syntax of the internal language. 

We will map each syntax piece to _ᴾ. So we first construct the algebra.

Basically we do similar thing as using QIIT in agda, but we use a much more simpler syntax (as LCCC).

We use S.ty .,.. to emphasize syntax. But note that `S.ty : □ : Set`, i.e. `S.ty` is not a type, just a syntax piece

But unlike QIIT using display/dependent algebra, we directly maps to a pair of algebra

```haskell
record SystemF' where
  Hom : □ → □ → □
  ty : □
  tm : ty → □
  ∀  : Hom(ty, ty) → ty
  Λ  : (F : (ty → ty)) → ((α : ty) → tm (F α)) → tm (∀ F)
  App : (F : (ty → ty)) → tm (∀ F) → (α : ty)  → tm (F α)

```


```haskell

module Canoncity where 
tyᴾ : Set
tyᴾ = ∑ (T : Hom(1, S.ty)), Hom (1, tm(T)) → Prop

tmᴾ : tyᴾ → Set
tmᴾ T = T.₂

∀ᴾ  : (tyᴾ → tyᴾ) → tyᴾ 
∀ᴾ F :  ∑ (T : Hom(1, S.ty)), Hom (1, tm(T))
∀ᴾ F = (S.∀ (λx,  ))

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

Basically, we use Ω as the universe, and we start gluing. 

Note that,  we also have Ω as a strong universe, by propositional extensionality.

We use same glued topos as the STLC one, and assume there is a `S` syntax model in the topos.

We use sterling's thesis's syntax, a record syntax. We use JS6's syntax and JS2's syntax for realignment/refinement


```Haskell
Module M where
ty : {𝒰 | ¶ ↪ ty}
ty = [ ¶ ↪ T : S.ty | { Ω | ¶ ↪ tm(T) } ]
tm : M.ty → 𝒰
tm (T : M.ty) = T.₂

-- let's first see if function type can be recovered
⇒  : ty → ty → ty 
A ⇒ B : [ ¶ ↪ T : S.ty | { Ω | ¶ ↪ tm(T) } ] ⊆ { ty | ¶ ↪ S.⇒ A B }
A ⇒ B = [¶ ↪ S.⇒ A B | ?b ]
  where ?b : { Ω | ¶ ↪ tm(S.⇒ A B) }
        ?b = [ ¶ ↪ (f : S.tm(S.⇒ A B)) | ?B ]
λ  : (tm A → tm B) → tm (A ⇒ B)
app : tm (A ⇒ B) → (tm A → tm B)
λβ : app (λ f) ≡ f
λη : λ (app f) ≡ f

∀  : (ty → ty) → ty 
∀ (F : ty → ty) : [ ¶ ↪ T : S.ty | { Ω | ¶ ↪ tm(T) } ]
∀ F = [ ¶ ↪ S.∀ F | ?b ]
  where ?b : { Ω | ¶ ↪ tm(S.∀ F) }



Λ  : (F : (ty → ty)) → ((α : ty) → tm (F α)) → tm (∀ F)
App : (F : (ty → ty)) → tm (∀ F) → (α : ty)  → tm (F α)
Λβ : App F (Λ F f) ≡ f
-- do we want the following?
Λη : Λ F (App F f) ≡ f


𝔹 : ty 
tt : tm 𝔹
ff : tm 𝔹
```