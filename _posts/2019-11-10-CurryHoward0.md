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

In other words,
> For arbitrary $A, B, C$, if $A \rightarrow_l B, A \rightarrow_l C$, then there exists $D$ s.t. $B \rightarrow_l D$ and $C \rightarrow_l D$. 

<details>
    <summary>Proof.</summary>
    <p>

    </p>
</details>

Induction on $A \rightarrow_l B$ for proposition :

For arbitrary $A, B$ if $A \rightarrow_l B$, and for arbitrary $C$ and if $A \rightarrow_l C$, then there exists $D$ s.t. $B \rightarrow_l D$ and $C \rightarrow_l D$.

Base Case: When $B \equiv A$, then we know exists the $C$ s.t. $A \rightarrow_l C$ and $C \rightarrow_l C$.

Inductive Step: Assume I.H. holds for some fixed $P \rightarrow_l P'$. When $\lambda x. P \rightarrow_l \lambda x.P'$ and $\lambda x.P \rightarrow_l C$. By the definition of $\rightarrow_l$, we know either $C \equiv \lambda x. P$, which would be a trivial case; or $C \equiv \lambda x. C'$ in a lambda form. (Since $\equiv$ means same equivalence class, thus the binding variable doesn't matter). And also, $P \rightarrow_l C'$ again by definition. Thus by I.H., there is $D'$ thus $C' \rightarrow_l D'$ and $P \rightarrow D'$ and thus $\lambda x. D'$ is what desired. 


Inductive Step 2: Assume I.H. holds for some fixed $P \rightarrow_l P'$ and for some fixed $Q \rightarrow_l Q'$. When $P Q \rightarrow_l P' Q'$ and $P Q \rightarrow_l C$. There are only two cases how $C$ is formed.

Case 2.a: If $C \equiv C_ 0 C_ 1$ and we also get $P \rightarrow_l C_ 0$ and also $Q \rightarrow_l C_ 1$. Now by I.H., everything is trivial.

Case 2.b: If $C \equiv P''[x:=Q'']$ for some $P'', Q'', x$. Thus we know $P \equiv \lambda x. P_0$ and $P_0 \rightarrow_l P'', Q \rightarrow_l Q''$. Thus $P \rightarrow_l \lambda x. P''$. Thus By I.H., there is $C_P$ s.t. $\lambda x. P'' \rightarrow_l C_P$ and $P' \rightarrow_l C_P$. and also $C_Q$ merges $Q', Q''$.

Thus $C \equiv P''[x:=Q''] \rightarrow_l C_P C_Q$ (by rule 3); and $P' Q' \rightarrow C_P C_Q$. 


Inductive Step 3: Assume I.H. holds for some fixed $P \rightarrow_l P'$ and for some fixed $Q \rightarrow_l Q'$.  When $(\lambda x.P) Q \rightarrow_l P'[x:= Q']$ and $(\lambda x.P) Q \rightarrow_l C$ for some $C$. 

Case 3.a: If $C \equiv C_0 C_1$ where $\lambda x.P \rightarrow_l C_0$ and $Q \rightarrow_l C_1$. Thus $C_0 \equiv \lambda x. C_0'$. and $P \rightarrow_l C_0'$. Thus we have $C_P$ merges $P'$ and $C_0'$. and $C_Q$ merges $Q'$ and $C_1$. Thus $C_0 C_1 \equiv (\lambda x. C_0' )C_1 \rightarrow_l C_p[x:= C_Q]$ (by rule 3) and $C_P[x:=C_Q]$ by the below lemma.

Case 3.b: If $C \equiv P''[x:=Q'']$.

To derive a proof in this case won't be hard -- the point is how does the definition $\rightarrow_l$ come up? A superset of $\rightarrow_\beta$ but a subset of its transtive closure, which also supports diamond property. You will see that the reasoning above is totally in a wrong direction -- the researcher should first spot the fact that diamond property will be inherited by the transitive closure; and then attempt to construct the $\rightarrow_l$ from its specification. 
**Something is missing here in this context.**  

We also need to prove the below lemma
> $M \rightarrow_l M'$ and $N \rightarrow_l N'$ implies $M[x := N] \rightarrow_l M'[x := N']$

Interestingly, textbook says the above Theorem justifies the $\Lambda$ theory with $=_\beta$ is a consistent theory, by showing an unprovable statement.


## A detour on computability

