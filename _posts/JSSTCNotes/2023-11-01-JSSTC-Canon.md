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
record STLC where 
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

Clear and concise. But semantically, `record STLC` is written using `SIG` (JS2, section )

## Categorical structure of the Syntax 

## Algebra of the syntax

We need to eliminate syntax -- this is always the way we use syntax/inductive types.




# Synthetic Logical Relation

We provide the logical relation model using STC. We start with introducing new connectives and features of STC. STC is actually an internal language of an artin glued topos. So it is at least a dependent type theory.

## Two Space -- Meta space and Object(Syntax) Space
## New Connectives : ¶

## New Connectives : Refinement Type

# Glue the topos, Explore the topos, Fullfill the connectives

This section might be too involved -- we suggest readers to go to the next section to see *HOW* to use STC, before knowing why STC has these logical/type connectives -- what this section is focusing on.

STC is actually the internal language of artin glued topos. Fullfill the folklore logrel ~ artin gluing.

# Adequacy

Finally, we can tell you how to use the logical relation model to achieve canonicity proof. 