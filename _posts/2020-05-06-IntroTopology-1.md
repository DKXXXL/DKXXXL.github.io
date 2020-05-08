---
layout: post
title:  "Intro to Topology, Lec 1"
date:   2020-05-06 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec1 

## Miscell
First point-set topology; be formal;

second part is more geometrical/more informal -- basic algebraic topology

Group Theory;

don't be hand-waiving 

## Start
$\text{Definition: Topology}$ \
*intuition: how close points are closed to each other*
*Something defined on a space* \
*  let $X$ be any non-empty set. A topology is $\Tau$ a colloection of subsets of $X$ s.t.
1)  $\emptyset, \tau \in \Tau$
2)  *Arbitrary Union* : If $U_i \in \Tau$ then $\bigcup_{i} U_i \in \Tau$
3)  *Finite Intersection* : If $U_1,...U_n$ then $\bigcap_i U_i \in \Tau$
Then $(X, \Tau)$ is a topological space; and the sets in $\Tau$ are called open sets 

#### Example
1) Trivial Topology \
In $X$ define $T = \{ \emptyset, X \}$
2) "Discrete" Topology \
In $X$ define $T =$ \{ all subsets of X \}

These two examples say for every set we have a topology.

1) In a finite set, $X = \{1,2,3\}$, we can construct $T = \{\emptyset, \{1\}, \{2,3\},  \{1,2,3\}\}$


2) $X = \Reals$ or $\Reals^n$, the usual notion of opennesss gives a topology
## Constructions of Topology
Notice that not all subsets of $X$ are open. 

$\text{Definitions}$
* An open set is a member of the given topology
* A closed set is the complement of an open set

**Warning : A set can be open and closed at the same time; a set can be neither open nor closed**

**Notice** : we can define a topology by saying who is a closed subset.

$\text{Equivalent Definition : Topology}$
* A topology on $X$ is a collection of subsets called closed sets s.t.
1) $\emptyset, X$ are closed
2) Arbitrary Intersection of closed sets is closed
3) Finite Union of closed sets is closed

Sometimes it is easier to define who are closed.

They are just dual to each other.

#### Example

$X = \{1,2,3\}$, $T = \{\emptyset, X, \{1\}, \{2,3\}\}$ open

you can see that closed sets are exactly $T$ as well

In this topology, $\{2\}$ is neither open nor closed.

This definition counter the intuition in the normal intution inside $\reals^n$

***

### Several Constructions

Out of defining open and closed sets, we can define several things: \
Let $(X, T)$ be a topology given by open sets. (here we precisely say $T$ are open sets).

Consider $A \subseteq X$ any subset.

$\large \text{Definition}$
1) **Interior** : The interior of $A$ is defined as $A'  := \bigcup_{U \in T, U \subseteq A}U $   
* *Notice: this is open because arbitrary union of open set is open*

1) **Closure** : The Closure of $A$ is defined as $\bar{A} := \bigcap_{\text{C is closed, }A \subseteq C} C$ 
* *Notice: this is closed because arbitrary intersection of closed sets is closed*

In general, we have 
$$A' \subseteq A \subseteq \bar{A}$$
the first is strict iff $A$ is open; the second is strict iff $A$ is closed


There are things very close to $A$ but not inside A

3) **Exterior** : Let $A \subseteq X$, we define its exterior as $Ext(A) := (\bar{A})^c = X \backslash \bar{A}$ *Notice: Because $\bar{A}$ is closed then $(\bar{A})^c is open thus $Ext(A)$ is open$*

What are those not inside exterior or interior?

4) **Boundary** : Given $A \subseteq X$, we construct it boundary as $\partial A = X \backslash (A' \cup Ext(A))$ *Notice: we can derive boundary is always closed*



**We can see that interoir, exterior and boundary are disjoint and partition of $X$**

For any set $A$, we have $X = A' \cup Ext(A) \cup \partial A$

Extorior($A$) : The biggest set that close to $A$

### How to construct meaningful topology in a practial way?
$\text{Definition : Basis}$
*  Let $(X, T)$ be a topological space, 
*  A subset $B \subset T$ is a **basis** for $T$ 
*  if every $U \in T$ is the union of elements of $B$ 


*Intuition:* We can write $U$ as a union of open balls, then those open balls are exactly a basis

It is easy to see that there are some axioms to be satisfied to become a basis.

$\text{Definition : Basis}$
* Let $X$ be any space. A basis for $X$ is a collection $B$ s.t.
1) $X = \bigcup_{b \in B} b$
2) $\forall b_1, b_2 \in B, \forall x \in b_1 \cap b_2$
   1) $\exists b_3 \in B$ s.t. $x \in b_3 \subseteq b_1 \cap b_2$  

*(Wikipaedia)An equivalent property is: any finite intersection of elements of B can be written as a union of elements of B. These two conditions are exactly what is needed to ensure that the set of all unions of subsets of B is a topology on X.*



$\large \text{Definition}$
* If $B$ is a basis of $X$, then the topology build out of this basis is $T_B = \{ U \subseteq X | U = \bigcup B_i, B_i \in B\}$

$\large \text{Proposition:}$\
Let $X$ be a set, $B$ a basis on $X$, then $T_B$ is a topology of open sets on $X$.

$\small \text{Proof.}$ We need to prove the three conditions of a topology.
1) $\emptyset, X \in T_B$  

The emptyset is there since $\emptyset = \bigcup_{\emptyset} B_i$

$X = \bigcup B$ by the definition of basis

2) Prove arbitrary union is there.



3) Prove finite intersection is there. (I guess by induction.)
  
It is enough to prove this for an intersection of two elements.

$U = \bigcup_i B_i$, $V = \bigcup_j B_j$

hence:
$U \bigcap V = (\bigcup_i B_i) \bigcap (\bigcup_j B_j) = \bigcup_{i,j} (B_i \cap \big)$.

$B_i \cap B_j$ is open because varying the point $p$ we get $B_i \cap B_j = \bigcup $

So out of a basis we can construct a topology.

#### Example
**The metric space**

Recall that a metric space is a pair $(M, d)$ where $d : M \times M \rightarrow \reals_{\ge 0}$ s.t. 
1) $d(x, y) = 0$ iff $x = y$
2) $d(x,y) = d(y,x)$
3) (Trianglur Inequality) $d(x,y) \le d(x,z) + d(z,y)$


*Using this we can define a basis*

**Open Ball**: we define the open bal of center $p$ and radius $\epsilon > 0$ as 
$B_\epsilon = \{ x \in M | d(x,p) < \epsilon\}$

**Proposition** $B = \{B_\epsilon(p) | \epsilon \in \reals_{\gt 0}, p \in M\}$ form a basis of $M$.


Not every topology can come from Metric space. Something about Metriziablity.

#### Example
**Trivial Metric**
1) Trivial metric $d(x,y) = 1$ when $x \neq y$; 0 when $x = y$

if $\epsilon > 0$ then $B_\epsilon(p) = \{m | d(m,p) < \epsilon\}$ = $\{p\}$ if $\epsilon < 1$ or $M$ (if $\epsilon \ge 1$)

$T_B$ is a discrete topology.

#### Example
In $\Reals^n$ we have several metrics:
1) d((x1,x2...xn), (y1,y2,..yn)) = $\sqrt{(x1 - y1)^2 + ...}$
2) d((x1,x2...xn), (y1,y2,..yn)) = max{$|x1-y1|, ... |xn - yn|$}


these two distance functions produce different topology on Rn with different bases

It is fundamental to understand spaces from their basis. Bases come in many different flavours. Some bases are better than others : 

$\large \text{Definition}$ 
* Let $X,T$ be a topological space, and $B$ as a basis for $T$. We can build out of this "local basis around a point":
* **Basis around a point** Given $p \in X$, a basis $B_p$ around $p$ is a collection of open sets s.t. 
  * $\forall U \in T$, with $U \ni p$, there exists $B \in B_p$ s.t. $p \in B \in U$

$\large \text{Definition}$
* Let $X, T$ be a topological space
1) We say $X, T$ is first countable if there exists a countable basis around each point (this is the worst we want)
2) we say $X, T$ is second countable if $T$ has a countable basis


$\large \text{Prop}$ Second countable implies first countable

Proof. For a given $(X,T)$ with countable $B_T$ as basis.

That means, $\forall b_1, b_2 \in B_T, \forall p \in b_1 \cap b_2, \exists b_3 \in B_T s.t. p \in b_3 \subseteq b_1 \cap b_2$. (*)

* *However We need to show :* $\forall p \in X, \exists B_p$ s.t. $\forall U \ni p, \exists b \in B_p$ s.t. $p \in b \subseteq U$.

Thus let's take $p \in X$ be arbitrary, we construct $B_p := \{B \in B_T | p \in B\}$.
Let's take $T \ni U \ni p$ be arbitrary, \
by coverage, we know there exists $b_p \in B_T$ s.t. $p \in b_p$; \  
by (*) we know there exists $b' \in B_T s.t. p \in b' \subseteq b_p \cap b_p$. Thus $b' \in B_p$ as well. $\square$




<!-- Original Proof by the lecturer

Proof. Let $X,T$ be  second countable, have there is a basis: $B = \{B_i\}$.

Let $p \in X$ as any point, Let $U$ be any open set containing $p$. Since $B$ is a basis, there exists a way to write $U = \bigcup_{j} B_{n_j}$. 

Hence there exists $n_k$ s.t. $p \in B_{n_k} \subseteq U$ (*)

Let's define local basis $B_p = \{b \in B | p \in B\}$

Because of (*) it is proved. -->