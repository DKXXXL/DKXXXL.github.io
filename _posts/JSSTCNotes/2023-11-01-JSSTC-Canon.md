---
layout: post
title:  "Review JS's STC's Canonicity'"
date:   2022-10-22 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

We type-set JS's STC and its application on proving canopnicity of STLC

Ref:
(JS1) https://www.jonmsterling.com/papers/sterling-2022-naive.pdf

(JS2) https://www.cs.cmu.edu/~rwh/students/sterling.pdf

# Syntax

Syntax in STC is written in HOAS,

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

Clear and concise. But semantically, `record STLC` is written using `SIG` (JS2, section 1.2, 1.4)

## Categorical structure of the Syntax 

When write down  `record STLC` as a signature, JS's framework will automatically make it into a *category of judgement* `SIG`/`STLC`

The formal definition locates at (JS2, 1.4∗5, 1.4∗6), as a pullback from (STLC → □ ← ∑ 𝕁 : □, 𝕁). 

Intuitively, if we think about things more set-theoretically, we can consider each pullback object 

𝕋 from two arrows `f : STLC → □` and `arr : ∑ 𝕁 : □, 𝕁 → □` as a (set-theoretical pullback) 

𝕋 = {(a : STLC, b : ∑ 𝕁 : □, 𝕁) : f a = arr b} = {(a : STLC, (f a) : □ ，(j : (f a)))}

i.e. intuitively, each object in the category of judgement, is really the judgement (or the set of derivation of that judgement).
or type-theoretically, 𝕋 can be considered as a set of contexts, ends with a derivaqtion of a judgement.

For example, {(a : STLC, a.tm a.bool : □, x : a.tm a.bool)} is one example of the judgement. 

And arrows between the category of judgement will be the derivations between judgement.

## Algebra of the syntax

We need to eliminate syntax -- this is always the way we use syntax/inductive types.

(JS2, 1.4 ∗ 10) has told us what freeness/initiality a category of judgement equips. 

We will not go into the details of the proof,

but intuitively, (JS2, Section 1.2) has shown the language of `SIG` is very syntax/initial. 
We can believe the freeness of the category of judgement comes from the freeness of the syntax.

***

(JS2, 3.7) also describes how syntax maps to a topos in a LCCC functor. 
(3.7∗2, 3.7∗3) describes how a signature (like `STLC`) maps to a sigma type in a given topos.


Thus, 
we know we only need to specify the mapped structure of  `record STLC` in a given topos, 
then according to 1.4∗10 and 3.7, we can autoamtically get a mapped algebra of the category of judgement

(i.e. the syntax tm(A) can be mapped to something in a topos)


So for us users of STC, we only need to specify the interpretation/model of `record STLC` in a topos


***

* Questions : So, can we directly map to presheaf topos without using STC?

# Synthetic Logical Relation

We provide a logical relation model using the language of STC, an internal language of an artin glued topos.

So once we accomplished, we will have a model inside the artin-glued topos.

***

We start by introducing new connectives and features of STC. 
STC is actually an internal language of an artin glued topos. So it is at least a dependent type theory.

## Two Space -- Meta space and Object(Syntax) Space

## New Connectives : ¶, ○¶, ⚈¶

## ¶-Transparent Type

A type `T` is 

## ¶-Sealed Type

A type `T` in STC is ¶-sealed, when `¶ → T ≅ 1`, i.e. a singleton when ¶ is true.

We can only say a type is sealed, (it makes no sense to say element is sealed)

For example, a subtype `{z : A | ¶ ↪ a}` is sealed.

A refinement type `[¶ ↪ a : A | ?]` is equal to `A` under ¶, so generally not sealed. (As `A` is usually a big object space)

It is usually not valid to say if `[¶ ↪ a | b]` an element is sealed or not.

We can only say a type is ¶-Sealed. Becau

## New Connectives : Refinement Type

## There is a syntax structure in the STC
i.e. in STC, we directly have a 

`S : STLC` can act like a syntax piece, used for ¶ ↪ S.ty, indicating the syntax piece is exactly like 

## Logical Relation itself

Given the syntax `S : STLC`, we need to construct a model `M : {STLC | ¶ ↪ S}`




## Summary : The trick to do construction :

1. When constructing `X : { ? | ¶ ↪ S.ty}`, we can use `X = [ ¶ ↪ x : S.ty | ? ]`

Because, for the former, we actually want something `? : Set`, and `¶ ↪ ? = S.ty`, as □ is mapped to `Set`
while under ¶, `[ ¶ ↪ x : S.ty | ? ] = S.ty`

2. When constructing `X : { ? | ¶ ↪ S.prod A B}`, we can use `X = [ ¶ ↪ S.prod A B | ?]`
Similarly, under ¶, `[ ¶ ↪ S.prod A B | ? ] = S.prod A B`

Note that, the above two are different, as `[ ¶ ↪ S.prod A B | ? ] : [ ¶ ↪ x : S.ty | ? ]`. But both of them
under ¶, can be projected to singleton.

So actually, `{ ? | ¶ ↪ S.ty}` can be refine to `[¶ ↪ S.ty | ?]` as well (i.e. consider the term instead of type)

3. Use "function extensionality" : When we have 

```agda
M.el : { ? | ¶ ↪ S.el } ⊆ M.ty → Set
```
we can simply introducing variable from the context

```agda
M.el T* : { ? | ¶ ↪ S.el T } ⊆ Set
```
Because of eta-rule or function extensionality. (The latter is definitely enough, but the former is claimed to be enough)

This is using fun-ext because we are proving ¶ → M.el = λ T*, ... ≡ S.el

4. For example, given 

```agda
M.ty : { ? | ¶ ↪ S.ty } ⊆ Set
M.ty = [ ¶ ↪ T : S.ty | {Set | ¶ ↪ S.el T} ]
M.el : { ? | ¶ ↪ S.el} ⊆ M.ty → Set

M.el T* : { ? | ¶ ↪ S.el T} ⊆ Set

M.el T*: { Set | ¶ S.el T } = Set
```

When we start to construct M.arr

```agda
M.arr : {? | ¶ ↪ S.arr} ⊆ M.ty → M.ty → M.ty
// introducing vars
M.arr A* B* : {? | ¶ ↪ S.arr A B} ⊆ M.ty 
M.arr A* B* : {? | ¶ ↪ S.arr A B} ⊆ [ ¶ ↪ T : S.ty | {Set | ¶ ↪ S.el T} ]
// because S.arr A B is not a type in STC, so we can only use introduction rule of refine type
M.arr A* B* = [¶ ↪ S.arr A B | ?b ] : [ ¶ ↪ T : S.ty | {Set | ¶ ↪ S.el T} ]

// What's more, ?b also needs to satisfy the property, from M.ty
?b : {Set | ¶ ↪ S.el (S.arr A B)}
// Now that S.el (S.arr A B) is a type in STC ,we can use both intro and formation rules. We use formation rules to give a try
?b = [¶ ↪ x : S.el (S.arr A B) | ?c ]
// Notice we don't need ?b to be a sealed type. It is only need to equal to `S.el (S.arr A B)` under ¶,
//   according to the formation rule, it is

// we will not continue, as ?c is decided by the lam, app, and their beta, eta rules. Wew ill just show the result

M.arr A* B* = [¶ ↪ S.arr A B | 
      [¶ ↪ f : S.el (S.arr A B) | ∀ (a : M.el A*), {M.el B* | ¶ ↪ app (lam f) a } ] 
      
    ]
```

5. When filling in `[ ¶ ↪ x : A | ?B ]`, by formation rules, ?B **needs to be a ¶-sealed type**, i.e. a singleton under ¶;
   1. but when using the introduction rules, and constructing `[¶ ↪ a | b]`, we only need `b : Ba`, it **doesn't need to be a sealed type**,
      1. and actually it doesn't need to be a type!
   2. for example, `∀ (a : M.el A*), {M.el B* | ¶ ↪ app (lam f) a }` is sealed by function extensionality


Thus generally speaking, to fill in `{... | ¶ ↪ X}`, we use either formation or intro rule of the refinement type.


# Glue the topos, Explore the topos, Fullfill the connectives

We first review some basic property and their interpretation in a topos

<!-- This section might be too involved -- we suggest readers to go to the next section to see *HOW* to use STC, before knowing why STC has these logical/type connectives -- what this section is focusing on. -->

### Subtype

In STC, JS uses frequently a notation { A | ¶ ↪ a} := {x : A | ¶ → x = a}, gives a subtype (really a refinement). 
we will see how to express this 

### Function Extensionality

Internal language of topos is an extensional type theory, equip with 


## Artin Gluing

Artin Gluing is described by 2.4∗6, is induced by 
the **pullback** of
a left exact morphism (logos functor) and a codomain (logos-)functor.  

SetG -----> SetY^→
  |          |
  |          | cod
  |          |
SetU --ρ--> SetY

SetG is the result of gluing. So to do artin gluing on topos(logos), we only need to spcify the ρ : SetU → SetY left exact logos functor.

***

To make canonicity work, we have figure shape (JS2, 4.3∗1) ρ : 1 → 𝑇 and thus ρ* : Pr(𝑇) → Pr(1) ≅ Set, and then 

 SetG -----> Set^→
  |          |
  |          | cod
  |          |
Pr(T) --ρ--> Set

According to 4.3∗4∗2, and  SetG is simply the artin gluing by figure shape ρ : 1 → 𝑇

Also according to 4.5.1 (especioally 4.5.1∗4∗1), as the inverse image functor of ∘ is exactly cod functor
while 4.5.1∗2 has this 0T* : Pr(T) → Set := Hom_(Pr(T))(1, -)

ρ*(E) = E ∘ ρ
ρ*(E)(∗) = E(ρ(1)) = E(1) ≅ Hom_(Pr(T))(y(1), E) ≅ Hom_(Pr(T))(1, E) = 0T*(E)

<!-- Why are these two equivalent? There are so many equivalence! -->
<!-- maybe saying ρ* and 0T* equivalent is too strong, 
      but saying two version of SetG equivalent is fine  -->


https://ncatlab.org/nlab/show/Artin+gluing 
Gives a concrete description of artin gluing

Basically a comma category

Given topoi and left exact morphism Φ : Set_E → Set_F, we get a glued topos `G` as logos `Set_G`

its concrete structure as a comma category is covered in the above nlab

### Open/Close immersion

There will be open immersion i : Set_E ↪ Set_G,
and closed immersion j : Set_F ↪ Set_G, 

covered in nlab

### ¶ itself?

¶ = (1 ∈ (Set_E), 0 ∈ Set_F, f : 0 → Φ(1))

### Why closed space under ¶ is 1?

### Why open space under closed space is not 1?

### Other structures

### Initial, Terminal Object?




## Interpret the Connectives
We will explore some new and existent connectives. 
### Connective : Refinement Type
The intepretation of refinement type is too complicated, it relates to Strong Universe (https://doi.org/10.48550/arXiv.2202.12012).
We will not try to explain them here

### Connective : ¶

¶ has shown its power as to neatly separate and project stuff into object (syntax) space (or metaspace)



#### Why ¶ can project syntax/meta component?

It relates to the 




### Why Sierpinski Topos matters?

***

STC is actually the internal language of artin glued topos. Fullfill the folklore logrel ~ artin gluing.

# Adequacy

Finally, we can tell you how to use the logical relation model to achieve canonicity proof. 