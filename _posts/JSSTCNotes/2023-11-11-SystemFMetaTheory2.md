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
  ifb : tm 𝔹 → tm T → tm T → tm T
  ifbβ₁ : ifb tt x y ≡ x 
  ifbβ₁ : ifb ff x y ≡ y 
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
Λ F f : ∑ t : Hom(1, S.tm Tₛ), (∀ F).₂ t
Λ F f : ∑ t : Hom(1, S.tm Tₛ), ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ t Tₛ)
Λ F f = (S.Λ F f, (λ T, f T))
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

But this is not simply correct, we need Ω⚈ s.t. 
1. if p ∈ Ω, ⚈p ∈ Ω⚈
2. ○Ω⚈ ≅ 1 (basically no syntax component)

```Haskell
Module M where
ty : {𝒰 | ¶ ↪ ty}
ty = [ ¶ ↪ T : S.ty | S.tm(T) → ⚈Ω ]
// this can work simply because ○ ⚈ Ω ≅ 1.
tm : {ty → 𝒰 | ¶ ↪ S.tm}
tm (T : M.ty) = [ ¶ ↪ (x : S.tm T) | T.₂ x] 
  // T.₂ x is not necessary a type!
语法层的□应该被解释到同一个地方去(ty : □, tm : ty → □)，不过既然 𝒰_ir ⊆ 𝒰, 问题应该不是很大
//  let's first see if function type can be recovered
⇒  : ty → ty → ty 
A ⇒ B : [ ¶ ↪ T : S.ty | tm(T) → ⚈Ω ] ⊆ { ty | ¶ ↪ S.⇒ A B }
A ⇒ B = [¶ ↪ S.⇒ A B | 
      ?b
      // [¶ ↪ (f : S.tm (S.⇒ A B)) | ⚈ ∀ (a : tm(A)),  tm (B) (app f (○ a)) ]
     ]
  where ?b : tm(S.⇒ A B) → ⚈Ω
        ?b t = ⚈ ∀ (a : tm(A)),  B.₂ (app t (○ a))
        // maybe we should flatten this function, i.e., use
        // ∀ (a : ⚈ tm(A)),  B.₂ (app t (○ a))
        // instead
        // so that eta rules will hold more directly
λ  : (tm A → tm B) → tm (A ⇒ B)
λ f : tm (A ⇒ B) ⊆ { ¶ ↪ S.λ f}
λ f : [ ¶ ↪ (t : S.tm T) | ⚈ ∀ (a : tm(A)),  B.₂ (S.app t (○ a))]
λ f = [ ¶ ↪ (S.λ ○f) | ?c ]
  where ?c : ⚈ ∀ (a : tm(A)),  B.₂ (f (○ a))
        f : tm A → tm B
        f a : [ ¶ ↪ (x : S.tm T) | B.₂ x]
        ?c = ⚈ λ a, (f a).₂
λ f = [ ¶ ↪ (S.λ ○f) | ⚈ (f a).₂ ]
app : tm (A ⇒ B) → (tm A → tm B)
app t a : tm B
  where t : tm (A ⇒ B) 
          ≡  [ ¶ ↪ (x : S.tm ((A ⇒ B))) | ⚈ ∀ (a : tm(A)),  B.₂ (app x (○ a))]
          
app t a = [ ¶ ↪ (S.app t a) | t.₂ >>= λ t, t a]
λβ : app (λ f) ≡ f
λη : λ (app f) ≡ f

∀  : (ty → ty) → ty 
∀ (F : ty → ty) : [ ¶ ↪ T : S.ty | S.tm(T) → ⚈Ω  ]
∀ F = [ ¶ ↪ S.∀ F | ?b ]
  where ?b : S.tm(T) → ⚈Ω
        ?b t = ⚈ ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ tˢ Tₛ)

Λ  : (F : (ty → ty)) → ((α : ty) → tm (F α)) → tm (∀ F)
Λ F f : [ ¶ ↪ (x : S.tm (∀ F)) | (∀ F).₂ x]
       ≡ [ ¶ ↪ (x : S.tm (∀ F)) | ⚈ ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ t Tₛ) ]
Λ F f = [ ¶ ↪ (S.Λ F f) | ?d ]
  where ?d : ⚈ ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ (S.Λ F f) Tₛ)
              ≡ ⚈ ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (f Tₛ)
        f T : tm (F T) ≡ [ ¶ ↪ (x : S.tm (F T)) | (F T).₂ x]
        ?d = ⚈ (λ T, (f T).₂)
App : (F : (ty → ty)) → tm (∀ F) → (α : ty)  → tm (F α)
App F t T : tm (F α) ≡ [ ¶ ↪ (x : S.tm (F α)) | (F α).₂ x]
App F t T = [ ¶ ↪  (S.App F t T) | ?e ]
  where ?e : (F T).₂ (S.App F t T)
  t : [ ¶ ↪ (x : S.tm (∀ F)) | (∀ F).₂ x]
        ≡  [ ¶ ↪ (x : S.tm (∀ F)) | ⚈ ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ x Tₛ)]
        ?e = t.₂ ∗ (⚈ T) 
        // apparently ∗ : ⚈(A → B) → ⚈ A → ⚈ B

Λβ : App F (Λ F f) ≡ f
since (App F (Λ F f) x).₂ 
        = (Λ F f).₂ >>= λ t, t x 
        = ⚈ (λ T, (f T).₂) >>= λ t, t x 
        = ⚈ (f x).₂ = (f x).₂
Λη : (Λ F (App F f)).₂
     = ⚈ (λ T, ((App F f) T).₂)
     = ⚈ (λ T, f.₂ ∗ (⚈ T)) 
     ?= f.₂
    //  I think it is correct, some basic law from monad

𝔹 : [ ¶ ↪ T : S.ty | 
        // I want it to be 
        S.tm(T) → ⚈Ω 
      ]
𝔹 = [ ¶ ↪ S.𝔹 | λ t, ⚈ t = S.tt ∨ t = S.ff ]
tt : tm 𝔹
   ≡ [ ¶ ↪ (x : S.tm 𝔹) | ⚈ x = S.tt ∨ x = S.ff]
tt = [ ¶ ↪ S.tt | ... ]
ff : tm 𝔹

ifb : tm 𝔹 → tm T → tm T → tm T
ifb bb b1 b2 : tm T 
// bb : [ ¶ ↪ (x : S.tm 𝔹) | ⚈ x = S.tt ∨ x = S.ff]
// so we know bb.2 : ⚈  bb.₁ = S.tt ∨ bb.₁ = S.ff 
ifb [¶ ↪ tt | ?] b1 b2 = b1
// unlike what is done in Naive STC, we cannot pattern match on the proposition
ifb [¶ ↪ ff | ?] b1 b2 = b2
ifb [¶ ↪ ?x | ∗] b1 b2 = S.ifb ∗ b1 b2
  // here, we assume ?x ≠ tt, ff, so we know ∗ cannot be type of ?x = S.tt ∨ ?x = S.ff
  // thus ¶ holds 
ifbβ₁ : ifb tt x y ≡ x 
ifbβ₁ : ifb ff x y ≡ y 

```


## Assumption needs to be resolved:

1. if p ∈ Ω, ⚈p ∈ ⚈Ω
2. ○⚈Ω ≅ 1 (basically no syntax component)
3. ⚈ is a monad
4. ⚈ (∀a, P) can be applied with ⚈a

## Adequacy

We recall the adequacy here :


# Paramtricity (Agda)

Almost the same! Just make things binary.

Related stuff goes to related stuff.
```haskell

module Paramtricity where 
tyᴾ : Set
tyᴾ = ∑ (T₁ T₂ : Hom(1, S.ty)), ∑ R: Hom (1, tm(T)) → Hom (1, tm(T)) → Prop


tmᴾ : tyᴾ → Set
tmᴾ T = ∑ t₁ t₂ : Hom(1, S.tm Tₛ), T.₂ t₁ t₂

∀ᴾ  : (tyᴾ → tyᴾ) → tyᴾ 
∀ᴾ (Fₛ, F) :  ∑ (T : Hom(1, S.ty)), Hom (1, tm(T)) → Prop
∀ᴾ (Fₛ, F) = (S.∀ Fₛ, ?X)
  where F : (tyᴾ → tyᴾ)
  where ?X : Hom(1, tm(S.∀ Fₛ)) → Prop
        ?X = λ tₛ : Hom(1, tm(S.∀ Fₛ)), 
              ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ tˢ Tₛ)

Λ  : (F : (ty → ty)) → ((α : ty) → tm (F α)) → tm (∀ F)
Λ F f : ∑ t : Hom(1, S.tm Tₛ), (∀ F).₂ t
Λ F f : ∑ t : Hom(1, S.tm Tₛ), ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ t Tₛ)
Λ F f = (S.Λ F f, (λ T, f T))
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

## Parametricity, Example, Adequacy

We try to prove, given `⊢ x : ∀ a , a → a` then `(x, (ΛA, λ x, x)) ∈ tm()`

# Parametricity (STC)

We start with the STC proof, then we proceed to the structure of the gluing topos.

If we follow (JS4)， we postulate `¶ := ¶L ∨ ¶R` and `¶L ∧ ¶R = ⊥`,  that means `¶L → (¶R = ⊥)` and `¶R → (¶L = ⊥)` in other words, we also need under `¶L`, ` [¶R ↪ (r : ?) | ?A] ≅ 1 `. This makes it possible to have  `[ ¶L ↪  ] ` ...

Instead, we approach it easier by directly assume syntax is binary syntax, i.e. `¶ ↪ (Left Piece Syntax, Right Piece Syntax)`. 

Basically when we glue, we glue using a product of syntax.


```Haskell
Module P where
ty : {𝒰 | ¶ ↪ ty × ty}
ty = [ ¶ ↪ T₁, T₂ : S.ty × S.ty | S.tm(T₁) → S.tm(T₂) → ⚈Ω ]
// it is possible to require 
// this can work simply because ○ ⚈ Ω ≅ 1.
tm : {ty → 𝒰 | ¶ ↪ (S.tm, S.tm)}
tm (T : M.ty) = [ ¶ ↪ (x,y : S.tm T₁ × S.tm T₂) | T.₂ x y]
  // T.₂

//  let's first see if function type can be recovered
⇒  : ty → ty → ty 
A ⇒ B : [ ¶ ↪ T₁, T₂ : S.ty × S.ty | S.tm(T₁) → S.tm(T₂) → ⚈Ω ] 
          ⊆ { ty | ¶ ↪ S.⇒ A B } // this is actually ¶ ↪ (S.⇒ A₁ B₁, S.⇒ A₂ B₂), but written this way is easier
A ⇒ B = [¶ ↪ S.⇒ A B | 
      ?b
      // [¶ ↪ (f : S.tm (S.⇒ A B)) | ⚈ ∀ (a : tm(A)),  tm (B) (app f (○ a)) ]
     ]
  where ?b : S.tm(S.⇒ A₁ B₁) → S.tm(S.⇒ A₂ B₂) → ⚈Ω
        ?b t₁ t₂ = ⚈ ∀ (a : tm(A)),  B.₂ (app t₁ (○ a₁)) (app t₂ (○ a₂))
        // maybe we should flatten this function, i.e., use
        // ∀ (a : ⚈ tm(A)),  B.₂ (app t (○ a))
        // instead
        // so that eta rules will hold more directly
λ  : (tm A → tm B) → tm (A ⇒ B)
λ f : tm (A ⇒ B) ⊆ { ¶ ↪ S.λ f}
λ f : [ ¶ ↪ (x,y : S.tm (A ⇒ B)₁ × S.tm (A ⇒ B)₂) | ⚈ ∀ (a : tm(A)),  B.₂ (app t₁ (○ a₁)) (app t₂ (○ a₂))]
λ f = [ ¶ ↪ (S.λ ○f₁, S.λ ○f₂) // actually two element but
          | ?c ]
  where ?c : ⚈ ∀ (a : tm(A)),  B.₂ (app (S.λ ○f₁) (○ a₁)) (app (S.λ ○f₁) (○ a₂))
             ≡ ⚈ ∀ (a : tm(A)),  B.₂ ( ○f₁ (○ a₁)) (○f₂ (○ a₂))
        f : tm A → tm B
        ?c = ⚈ λ a, (f a).₂
λ f = [ ¶ ↪ (S.λ ○f₁, S.λ ○f₂) | ⚈ (λ a, f a).₂ ]
app : tm (A ⇒ B) → (tm A → tm B)
app t a : tm B
  where t : tm (A ⇒ B) 
          ≡  [ ¶ ↪ (x,y : S.tm (A ⇒ B)₁ × S.tm (A ⇒ B)₂) | ⚈ ∀ (a : tm(A)),  B.₂ (app t₁ (○ a₁)) (app t₂ (○ a₂))]
          
app t a = [ ¶ ↪ (S.app t₁ a₁, S.app t₂ a₂) | t.₂ >>= λ t, t a]
λβ : app (λ f) ≡ f
λη : λ (app f) ≡ f

∀  : (ty → ty) → ty 
∀ (F : ty → ty) : [ ¶ ↪ T : S.ty | S.tm(T) → ⚈Ω  ]
∀ F = [ ¶ ↪ S.∀ F | ?b ]
  where ?b : S.tm(T) → ⚈Ω
        ?b t = ⚈ ∀ Tᴾ : tyᴾ,  (F Tᴾ).₂ (S.App Fₛ tˢ Tₛ)

// the rest are similar, just making canonicity model into a binary model


𝔹 : [ ¶ ↪ T₁, T₂ : S.ty × S.ty | S.tm(T₁) → S.tm(T₂) → ⚈Ω ]
𝔹 = [ ¶ ↪ (S.𝔹, S.𝔹) | λ t₁ t₂, t₁ = t₂ ]
tt : tm 𝔹
   ≡ [ ¶ ↪ (x,y : S.tm 𝔹) | x = y ]
tt = [ ¶ ↪ S.tt, S.tt | ... ]
ff : tm 𝔹
// ...similar
```

## Fundamental Lemma

`P` is just like compatibility lemma, 

thus we need (a bit more) extra computation to show it is reflexive,

which is also the fundamental lemma, i.e. 

if `b : tm(𝔹)`, then we have an algebra
`b* : {P.tm(P.𝔹) | ¶ ↪ (b, b)}`

Basically we need to do another induction, reuse `P` to show an (explicit) 
reflexive algebra ... But it can be hand-waved -- we can just say 
"by induction, we have `b* : {P.tm(P.𝔹) | ¶ ↪ (b, b)}`", 
without explicit showing the induction. It is just a matter of specification we can ignore. 


***

Apparently, `P` itself is not only reflexive -- once we have sigma type, 
we can relate different implementation of a module 


***
# Sigma Type / Existential Type

To have more adequacy result (more abstraction) and encode more data type in our calculus, 
we have to introduce sigma type (to control the interface of the data operation).

Directly from https://www.cs.uoregon.edu/research/summerschool/summer16/notes/AhmedLR.pdf


We first need ifb

*Syntax*

```Haskell
Module SynExist where 

  ∃ : (ty → ty) → ty
  pack : (F : ty → ty) → α : ty → (p : tm (F α)) → tm(∃ F)
  unpack : (F : ty → ty) → 
            (tm ∃ F) →
            (f : (α : ty) → (x : tm (F α)) → tm T) → tm T
  ∃β : unpack F (pack F α p) f ≡ f α p

```

*Canonicity*




*Parametricity*

# More Adequacy

## Observational Equivalence
For `x, y ∈ S.tm(A)`, if we have `xy* : {P.tm A | ¶ ↪ (x, y)}`,

then we have given arbitrary `f : S.tm(A) → S.tm(𝔹)`, s.t. `f* : P.tm(A) → P.tm(𝔹)`
and thus `f* xy* : {P.tm(𝔹) | ¶ ↪ (f x, f y)}`, thus `f x = f y`

## Free Theorem 1 using Canonicity Model

for arbitrary `t : S.tm (∀A, A → A)`, we want to show `S.app (S.App _ t T) x = x`

Thus we have `t* : C.tm(∀A, A → A)`, where 
`F X = X ⇒ X`
`t*.₂ : ⚈ ∀ Tᴾ : tyᴾ,  (Tᴾ ⇒ Tᴾ).₂ (S.App _ t Tₛ)`
`≡ ⚈ ∀ Tᴾ : tyᴾ, ⚈ ∀ (a : tm(T)),  T.₂ (app (S.App _ t Tₛ) (○ a)) `


Say `T : ty`, and `x : tm(T)`

We define `T* = [¶ ↪ T | λ t, ⚈ t = x] : C.ty`.
We define `x* = [...] : C.tm(T*)`


Now, apply `t*` with `T*` and `x*`, we get what we want


## Free Theorem 2 using Paramtricity Model

for arbitrary `x, y : S.tm (∀A, A → A) `, we want to show `x ~ y` i.e. observational eq

We want to show `? : {P.tm (∀A, A → A) | ¶ ↪ (x,y)}`
`? : ⚈ ∀ Tᴾ : P.ty, ⚈ ∀ (a : P.tm(T)),  T.₂ (app (S.App _ x Tₛ) (○ a₁)) (app (S.App _ y Tₛ) (○ a₂))`
It requires Free Theorem 1, to show any `x : S.tm (∀A, A → A)`, we have `S.app (S.App _ t T) x = x`, 

thus `?` is exactly `⚈ ∀ Tᴾ : P.ty, ⚈ ∀ (a : P.tm(T)), P.tm(T)`, which is exactly identity function

{p : Ω | ¶ ↪ p}
## Boolean, Church Encoding


***
# Pape Structure
1. Metatheoretic Property of Lex
   1. NbE of Lex
   2. Parametricity
      1. recovering abstraction-safety from https://cs.uwaterloo.ca/~yizhou/papers/abseff-popl2019.pdf 
      2. Prove the some property around LexEff and Primitive Alg-Eff
         1. like commutativity or something
      3. We want ObsEquivalence as the ultimate notion
2. Verifying Property of Lex
   1. Assume N as part of the primitive data
   2. A Program that has input (n ∈ N) and output [0,...,n-1]  
      1. Implement this program using one spec and implement two different ways
         1. One use List (which is church encoded and proved correct)
         2. The other use Lex Effect Handler's generator
      2. prove the implementation equivalence
   3. Compile the given two implementation
      1. Compile to stack machine
      2. Two different implementation of compilation; 
         1. one default; the other achieve stack-free compilation of Effect Handler (Mentioned by Yizhou)
   4. Also show how a list implementation can be compiled in difference way
      1. one default (using Church Encoding)
      2. The other uses tuples in stack machine 
      3. apparently different data layout for list
The paper is about just one example to make the whole paper readable

Appendix : Support Intensional analysis
1. We need to show we can write arbitrary predicate over syntax, i.e. `S.tm(list A) → ⚈Ω`
2. By writing a sort function, and the list is an abstract type defined in System F


***

Sheaf, (Contextual) Modal Type, Realizability Topos