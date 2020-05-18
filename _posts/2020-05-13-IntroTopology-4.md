---
layout: post
title:  "Intro to Topology, Lec 4"
date:   2020-05-13 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec4

$\Large \text{Definition: }$ Let $X, Y$ be topological space, and $f: X\rightarrow Y$.
*  We say $f$ is continuous if $\forall U \subseteq Y$ open we have $f^{-1}(U) \subseteq X$ is open

$\Large \text{Definition: }$ Let $X, Y$ be topological spaces and $f : X \rightarrow Y$ be a bijection between them.
*  $f$ is a **homeomorphism** if it is continous with **continuous inverse**.


$\Large \text{Remark: }$ You can have bijective continuous function with non-continuous inverse.

For example, $id: (X, T_1) \rightarrow (X, T_2)$

Let $T_1$ be the discrete topology, and $T_2$ be the trivial one.

Btw, under bijection, is continuous inverse exactly open?


$\Large \text{Definition: }$ Let $X$ be a topological space and $\{A_{\alpha}\}_{\alpha \in I}$ be a collection of subsets of $X$.

We say it is a cover if $X = \bigcup A_{\alpha}$.

If each $A_{\alpha}$ is open, then it calls open cover.

If each $A_{\alpha}$ is closed, then it calls closed cover.


Example: Basis is an open cover with extra property.

Many time we can chope the index set and make it smaller.

$\Large \text{Definition: }$ Given a cover $\{A_{\alpha}\}_{\alpha \in I}$,
*  if $J \subseteq I$ and $\{A_{\alpha}\}_{\alpha \in J}$ is a cover, then $\{A_{\alpha}\}_{\alpha \in J}$ is a **subcover**

(what changes is the indexing set).

$\Large \text{Definition: }$ Given two **covers** $\{A_{\alpha}\}_{\alpha \in I}$ and $\{B_{\alpha}\}_{\alpha \in J}$ 
*  we say $\{A_{\alpha}\}_{\alpha \in I}$ is a refinement of  $\{B_{\alpha}\}_{\alpha \in J}$ if
*  $\forall \alpha \in I$, there exists $\beta \in J$ s.t. $A_\alpha \subseteq B_\beta$

In subcover, we don't change the set, only change the indexing; in refinement we completely change the set.

Refinement is reflective; and a subcover implies a refinement.


***
We are going to construct topologies upon topologies. Quotient topology is tricky! Be careful!

$\Large \text{Definition: }$ **Subspace Topology** Let $X,T$ be a topologoical space. $A \subseteq X$ be a subset.Define the subspace topology on $A$, $T_A := \{U \cap A | U \in T\}$

$\Large \text{Proposition: }$ $A, T_A$ is a topology.

2) Arbitrary Union: Let $U_n \cap A \in T$, by distribution law of union, $\bigcup (U_n \cap A) = (\bigcup U_n) \cap A$ which belongs to $T_A$ since $(\bigcup U_n)$ belongs $T$
3) Finite interssfction is similar.

In this situation, we will say (the language) $A$ is a subspace of $X$. (the topology is inherited from $X$).

$\Large \text{Notation: }$ We say $A$ is a subspace of $X$ to mean $A \subseteq X$ with the subspace topology.

If $B \subseteq A$ is open/closed in $A, T_A$, we say $B$ is open/closed in $A$ or relative to $A$

$\Large \text{Warning: }$ If $A \subseteq X$ is a subspace and $B \subseteq A$ is open relative to $A$, it is not necessary true that $B$ is open in $X$. 

Trivial topology is an example.

#### Example 
In $\reals^2$, takke a sphere $S^1$.
Take a ball intersect with the sphere; this intersection is open relative to the sphere, but not open in the $\reals^2$.

***

$\Large \text{Proposition: }$ If $A \subseteq X$ is open, then $T_A \subseteq T$. (each open set in subspace is )


$\Large \text{Proposition: }$ If $C \subseteq X$ is closed, then closed sets of $(C, T_C)$ are the closed sets of $T$ in $C$.

You can see some kind of transitivity here.

$\Large \text{Definition: }$ Let $A \subseteq X$ be a subset. Then it comes naturally with an injection

$\eta_A : A \rightarrow X := x \mapsto x$

This is the inclusion map.

Define a set of subsets: $\{\eta^{-1}(U) | U \in T\}$

but notice $\eta^{-1}(U) = U \cap A$.

What we get is that $T_A = \{\eta^{-1}(U) | U \in T\}$

That is, we can define the subspace topology as the "pullback" of the openset of $T$.

$\Large \text{Proposition:}$ $\eta: A \rightarrow X$ is continuous, moreover $A$ is the smallest topology to do this.


Proof. Let $U \in I$ be  open, then $\eta^{-1}(U) = U \cap A \in T_A$.

by definition of $\eta$, $\eta$ is continous.

And since $T_A = \{\eta^{-1}(U) | U \in T\}$

any topology that makes $\eta$ continuous has to include all the inverse map, i.e. has to include $T_A$.