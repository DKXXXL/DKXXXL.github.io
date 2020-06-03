---
layout: post
title:  "Intro to Topology, Lec 6"
date:   2020-05-20 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec6

Every subset that satisfies characteristic property will have inclusion continuous.

We will have similarly every product sets that satisfies characteristic property will have projection continuous.

## Product Topology (finite product)
We define a basis for a topology:

$\beta_{X_1 \times ... X_n} = \beta_{prod} = \{U_1 \times U_2 \times ... U_n | U_i \in T_i\}$

This is a basis and the topology generated is called the product topology.

$\LARGE \text{Theorem:}$(Characteristic Prop of product):

Let $X_1, ... X_n$ be a topological spaces
1.  The product topology satisifies:
    1.  $(P)$ : For any topological space $Y$ and $f : Y \rightarrow X_1 \times ... \times  X_n$, we have $f$ is continuous
        1.  iff the components of f, $\pi \circ f : Y \rightarrow X_i$ are continuous
   
![](/assets/img/2020-05-22-12-17-57.png)
2. The product topology is the only one satisifes $P$.

$\text{Proof.}$
1. Prove Product Topology satisfies this
   1. Let $f: Y \rightarrow X_1 \times ... X_n$ be continuous. Then we have that $f_i = \pi_i \circ f : Y \rightarrow X_i$ is continuous, since the projection are continuous
      1. If $U_i \subseteq X_i$ is open, then $\pi_i(U_i) = X_1 \times ... U_i \times X_n$ which is open 
2. Suppose all components are continuous: $f_i : Y \rightarrow X_i$, It is enough to prove $f^{-1}(B)$ where $B \in \beta$. By definition $B = U_1 \times ... U_n$ where $U_i \subseteq X_i$ is open. We make the pull-back. $f^{-1}(B) = \{y \in Y : f(y) \in U_1 \times ... U_n\} = \{y \in Y: f_i(y) \in U_i\} = \bigcap_{i} f^{-1}_i(U_i)$ which is a finite intersection of open set since every componenent is continuous.


Now we prove that if it satisifies $(P)$ it is the product.
Suppose $T'$ is a topology on $X_1 \times X_2 ... \times X_n$ that satisifies $(P)$.

$\text{Claim:} \pi_i : (X_1 \times ... X_{n}, T') \rightarrow (X_i, T_i')$ is continuous 


$\text{Proof}$ Consider $f = id_{X_1 \times ... X_{n}} : (X_1 \times ... X_{n}, T') \rightarrow (X_1 \times ... X_{n}, T')$.

![](/assets/img/2020-05-22-12-31-51.png).

Look at the following two diagrams, 


# Please go and see $\text{Proposition: 3.31}$

$\text{Associativity of Products:}$ $X_1, X_2, X_3$ as topological spaces:

$\text{Discuss the proof.}$ $(X_1 \times X_2) \times X_3 = X_1 \times (X_2 \times X_3)$

$f$ is continuous, iff $f_{12}$