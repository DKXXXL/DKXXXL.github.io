---
layout: post
title:  "Notes on Categorical Glueing, Part II"
date:   2021-01-07 00:56:11 -0400
categories: CS Logic
---

The issue with Mitchell's notes on categorical glueing is that, it is still too abstract. 

It reveals (sort-of) the relationship between categorical glueing and logical relation, but failed to demonstrate using categorical glueing to prove all sorts of meta-theory. (i.e. Fails to explain how to think like category theorists.)

Thus we shift our focus onto "Sterling, Jonathan, and Bas Spitters. "Normalization by gluing for free {\lambda}-theories." arXiv preprint arXiv:1809.08646 (2018).". It also details how to use glueing to prove some meta-property of a STLC.

This comment companions along with the notes.

***

1. $T^{\dagger}$ is really just a set of element of function signature,
   1. e.g. if $T = \{int, bool\}$, then $T^{\dagger} = \{int \rightarrow bool, (int,int) \rightarrow int,...\}$
2. Cloning Category seems doesn't support exchange (permute in the context), you can check the typing rules
   1. This coincides with the context as a list, and no variable naming is ever used
   2. var rule is like a "pop on the stack"
3. Renaming Category, according to the non-categorical definition, is a subcategory of Cloning category (inheriting all the objects) but arrows (terms) are just permutation (taking elements out of context), no other operations are allowed
   1. A Comma category can be defined as a [pullback](https://ncatlab.org/nlab/show/comma+category#AsAFiberProduct) where pullback on $\mathfrak{Cat}$ can be considered trivially [as those like $\mathfrak{Set}$](https://math.stackexchange.com/questions/168276/pullbacks-of-categories)
4. For small category $C$, the category of presheave $PSh(C)$ is the functor category $[C^{op}, \mathfrak{Set}]$