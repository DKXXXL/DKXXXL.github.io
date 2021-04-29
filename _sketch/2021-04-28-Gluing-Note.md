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

***
I may not be able to understand Section 2; Sterling doesn't suggest reading the paper "Normalization and the Yoneda Embedding"; thus I cannot understand why normal form has any relationship with presheaves. According to Sterling, it doesn't quite matter. But some level of familiarity of natural form and neutral expression is required. Sterling suggested [Normalization by Evaluation Dependent Types and Impredicativity](https://dl.acm.org/doi/10.1145/3110277) Chapter 2 for easy intro on that subject (still for STLC).

### Normal Form and Neutral Expression
1. "Semantic object" $[T]$ is a bit confusing word. For first time understanding, I think just understand semantic object as "the interpretation of $T$ in the meta-level language". For example, a function in object language will be a $\lambda$-term but in meta-language, it is just a mathematical function (usually between sets). Because our meta-language is the usual mathematical language
2. From Figure 2.3 , Page 11, 
   1. neutral terms $Ne^T$ are **(free) variables** (or unknown) or **terms with blocked evaluation** because the essential parts are neutral
      1. say a function typed neutral term $u$ with normal term $v$, then $(u v)$ is neutral
      2. similarly (similar as both are elimination rule), recursion on neutral term is also a neutral
   2. normal term  $Nf^T$ are just irreducible terms, thus neutral terms are also normal term 
   3. reflection $\uparrow^T : Ne^T \rightarrow [T]$
   4. reification $\downarrow^T : [T] \rightarrow Nf^T$ (concretization, making semantic object into a syntactic term in object language)
   5. The weirdest thing is that I don't find the "fresh" condition and its solution really care about alpha-equivalence. It particularly use liftable term to give a more detailed implementation, but I don't think fresh is determinsitic during reification (even in the new version of NbE) (i.e. the chosen $x$ seems random and alpha-equivalent functions might not end up same syntactic term)
   6. But I don't really care...