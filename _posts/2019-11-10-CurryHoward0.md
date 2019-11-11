---
layout: post
title:  "Notes on Curry Howard Iso, 0: Un(i)typed LC"
date:   2019-11-10 00:56:11 -0400
categories: CS Logic
---
# IN CONSTRUCTION

Notes that, this note is following the book *Lecture on Curry Howard Isomorphism*. 

## Preliminaries

The book introduces the syntax of the raw lambda calculus as pre-term $\Lambda^-$; while define $\Lambda$ term as the $\alpha$-equivalence classes of each pre-term. 

However, in this case, when working on equivalence classes, the definition of free variables, substitution and $\beta$-reduction requires proof of well-defined-ness.

The well-defined of "free-variable" requires a proof of
> for pre-term $a =_\alpha b$, $FV(a) = FV(b)$



## The Church-Rosser Property

Recall the beta conversion
> $\rightarrow_{\beta}$

Let's first show that
> If $\succ$ has diamond property, then $\succ^{\* }$ also has one.
> 
> Note: $\succ^{\*}$ stands for the *least* transitive closure of $\succ$

where 
> A relation $R$ has **diamond property** whenever: 
> 
> if $wRx, wRy$ for arbitrary $w,x,y$, there is $z$ s.t. $xRz$ and $yRz$.

<details>
    <summary>Comment.</summary>
    <p>
        We know the difference of *least* fixpoint and any other fixpoint: A least fixpoint correspond to the induction and also a greatest one corresponds to the co-induction; but not anyother fixpoint.
        <br/>
        More importantly, if you (inductively) define the transitive closure in Coq, you can easily seperate the transitive closure $\succ^{\* }$ into a number-indexed set of relations, $\bigcup_n \succ^n$, where $\succ^0 = \succ^=$ is just diagonal; $\succ^1 = \succ$ and "$a \succ^{n+1} c$ only when there is $b$ s.t. $a \succ^n b$ and $b \succ c$".
        <br/>
        That is being said, you can easily explicitly labeled out the once-implicit 'step' it takes in the transitive closure because it is defined to be the 'least' fixpoint. However, you cannot do the same thing in arbitrary fixpoint relation. Because some part of these relations might not even be "reachable" from the first place.
        <br/>
        From this perspective, the proof given in the book is clear: it is just a double induction (first-row-then-column-wise) on $x,y$ in the context of $w \succ^n x$ and $w \succ^m y$. 
    </p>
</details>

According to the book, we only need to show
> $\rightarrow_l$ has diamond property.


## A detour on computability