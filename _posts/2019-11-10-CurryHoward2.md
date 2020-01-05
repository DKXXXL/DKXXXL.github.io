---
layout: post
title:  "Notes on Curry Howard Iso, 2: STLC `a la .."
date:   2019-11-10 00:56:11 -0400
categories: CS Logic
---
# IN CONSTRUCTION

Notes that, this note is following the book *Lecture on Curry Howard Isomorphism*. 

Note 1 is about semantic of Intuitionistic Propositional Logic, not yet relevent to our concern. When I finish that I will move it out of the sketches.

This note is about STLC in two styles `a la Church/Curry, and week/strong normalization.

***

*Church* Style and *Curry* Style differs (from its formalization) in how they present lambda term. In *Curry* style, we are still focusing on the UTLC (introduced in Note 0), and we only focus on those typable term in the UTLC. While *Church* embed type information into the lambda term that is worked on and thus a "subset" of the original lambda term is to considered. 

I think *Curry* style shows a more non-intrusive beauty in its definition, however, it doesn't have as good property as *Church*'s -- We cannot show that a lambda term has a unique typing. For example, $\lambda x.x$ can be typed as any form of identity: $A \rightarrow A, B \rightarrow B$ ... The book suggests using a meta-type-variable $\tau$ to say that $\vdash \lambda x.x : \tau \rightarrow \tau$, and described as "a limited form of *polymorphism*". However, what comes as a surprise is when the book says *Curry* style is the foundation of Haskell -- I always thought Haskell still uses *Church* style, it is just with a power of omitting explicit type annotation (like writing term of $\lambda x:\_ . x$) and also has the power of System F (parametric polymorphism/ term dependent on type/ $\lambda 2$). Anyway, this can be easily checked by looking at a language reference and not that important -- what is important is

> How weak is *Curry* style compared to $\lambda 2$? How weak is *Church* compared to *Curry* (since *Church* doesn't have parametric polymorphism in the first place.)

Anyway, if *Church* is really weaker, it comes as a good price -- the typing is unique up to $\beta$-equivalence.

## Easy Property
Both *Church* and *Curry* have the following auxilary property.
> **Substituion lemma**: 
> * $\Gamma, x: T \vdash M : \tau$ and $\Gamma \vdash t : T$ $\Longrightarrow$ $\Gamma \vdash M[x:= t] : \tau$
> * $\Gamma \vdash M : \tau$ $\Longrightarrow$ $\Gamma[\alpha := T] \vdash M : \tau [\alpha := T]$
> 
> **Free Variable Lemma**, Manipulation of the context solely depends on free vars:
> * Extension of context will not change term's type
> * Free variables of the typed term must be in the domain of the context
> * Contracting context to only free variables preserving typing of the term.
> 
> **Generation Lemma**: The typing rules are 'reversible'.
> 
> **Subject Reduction (Preservation)**:  $\beta$-Reduction preserves type. 

*Church* also has the **Uniqueness Property**, where each term can only have one type; and the type is unique up to $\beta$-equivalence.

## Weak Normalization


## Strong Normalization


## Expressibility