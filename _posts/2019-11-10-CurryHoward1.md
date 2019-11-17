---
layout: post
title:  "Notes on Curry Howard Iso, 1: Intuitionistic Logic"
date:   2019-11-10 00:56:11 -0400
categories: CS Logic
---
# IN CONSTRUCTION

Notes that, this note is following the book *Lecture on Curry Howard Isomorphism*. 

We will skip some of the preliminaries (the complete calculus can be found on the book). 

## Syntax

Trivial as it is, we had better get our hand dirty and do some exercises.
> Claim: Intuitionistic Propositional Logic is closed under weakening and substitution. In other words
> *  $\Gamma \vdash \varphi$ implies $\Gamma, \psi \vdash \varphi$
> *  $\Gamma \vdash \varphi$ implies $\Gamma [x := \psi] \vdash \varphi [x := \psi]$

<details>
    <summary>Proof.</summary>
    <p>

    </p>
</details>

## Semantic

### Field of Sets, modeling classical propositional logic

Definition first
> A field $R$ on a set $X$ is a subset $R \subseteq X$ s.t. closed under union, complement and intersection.

Now we can alternatively (compared to using Boolean Value) use $R$ to model CPL, valuation inductively defined below, $\Phi$ stands for all the formula, $PV$ stands for all the propositional variable

> Given $R$ as a field on a set $X$, and given $v: PV \rightarrow R$, we can define $\bar{v} : \Phi \rightarrow R$
> *   $\bar{v}(x) = v(x)$ for propositional variable $x$
> * $\bar{v}(\bot) = \emptyset$
> * $\bar{v}(A \  \   \lor / \land \  \   B) =\bar{v}(A) \  \   \cup / \cap \  \   \bar{v}(B)$  
> * $\bar{v}(A \rightarrow B) =(X \backslash \bar{v}(A)) \cup \bar{v}(B)$


> Claim: This valuation is consistent with the classical-text-book valuation $\bar{V} : \Phi \rightarrow \{0,1\}$
> 
> In other words, $\bar{V}(p) = 1 \iff \bar{v}(p) = X$


<details>
    <summary>Proof.</summary>
    <p>

    </p>
</details>

