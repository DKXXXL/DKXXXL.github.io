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
  Π : ty → ty → ty
  lam : (tm A → tm B) → tm (Π A B)
  app : tm (Π A B) → tm A → tm B
  lamβ : app (lam f) = f
  lamη : lam (app f) = f 
```

Clear and concise. But semantically, `record STLC` is written using `SIG` (JS2, section 1.2, 1.4)

## Categorical structure of the Syntax 

When write down  `record STLC` as a signature, JS's framework will automatically make it into a *category of judgement* `SIG`/`STLC`

The formal definition locates at (JS2, 1.4∗5, 1.4∗6), as a pullback from (STLC → □ ← ∑ 𝕁 : □, 𝕁). 

Intuitively, if we think about things more set-theoretically, we can consider each pullback object 

𝕋 from two arrows `f : STLC → □` and `π : ∑ 𝕁 : □, 𝕁 → □` as a (set-theoretical pullback) 

𝕋 = {(a : STLC, b : ∑ 𝕁 : □, 𝕁) : f a = π b} = {(a : STLC, (f a) : □ ，(j : (f a)))}

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


# Synthetic Logical Relation

We provide a logical relation model using the language of STC, an internal language of an artin glued topos.

So once we accomplished, we will have a model inside the artin-glued topos.

***

We start by introducing new connectives and features of STC. 
STC is actually an internal language of an artin glued topos. So it is at least a dependent type theory.

## Two Space -- Meta space and Object(Syntax) Space

## New Connectives : ¶, ○¶, ⚈¶

## New Connectives : Refinement Type

## Logical Relation itself

# Glue the topos, Explore the topos, Fullfill the connectives

<!-- This section might be too involved -- we suggest readers to go to the next section to see *HOW* to use STC, before knowing why STC has these logical/type connectives -- what this section is focusing on. -->

## Artin Gluing

## Why Sierpinski Topos matters?

## Interpret the Connectives
We will explore some new and existent connectives. 
### Connective : Refinement Type
The intepretation of refinement type is too complicated, it relates to Strong Universe (https://doi.org/10.48550/arXiv.2202.12012).
We will not try to explain them here

### Connective : ¶

¶ has shown its power as to neatly separate and project stuff into object (syntax) space (or metaspace)

#### Why ¶ can project syntax/meta component?

It relates to the 
### Subtype

In STC, JS uses frequently a notation { A | ¶ ↪ a} := {x : A | ¶ → x = a}, gives a subtype (really a refinement). 
we will see how in 


### Function Extensionality

Internal language of topos is an extensional type theory, equip with 



***

STC is actually the internal language of artin glued topos. Fullfill the folklore logrel ~ artin gluing.

# Adequacy

Finally, we can tell you how to use the logical relation model to achieve canonicity proof. 