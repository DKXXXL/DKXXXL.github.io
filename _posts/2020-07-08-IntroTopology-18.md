---
layout: post
title:  "Intro to Topology, Lec 15"
date:   2020-07-10 00:56:11 -0400
categories: Math
---

# Covering spaces
#### Definition:
* Let  $q : E \rightarrow X$ be as follows
  * $E$ is path-connected
  * $q$ is a surjective continuous map
  * every point of $x$ is evenly covered
* A point $x \in X$ is evenly covered 
  * if there exists an open set $U \subseteq X, x \in U$ s.t. $q^{-1}(U)$ can be decomposed into its connected components, each one of them open in $E$, and $q$ is a homeomorphism onto $U$ when restricted to any of them.

A map that satisfies this is called a covering map.

#### Example: 
Consider $S^n$ and idenitfy antipodal points $x \sim -x$. The quotient space is $RP^2$. Let $q : S^n \rightarrow RP^n$ be the quotient map. We acually have $q$ as a covering map.

In order to see this notice that 1), 2) are immediate. We only need to deal with 3)

In general, for any open set $V \subseteq S^n$, we have $q^{-1}(q(V)) = V \cup -V$, This union might not be disjoint. In order to make this disjoint, pick $V$ inside a open hemisphere. (Disjointness is helpful for the future).

If we do that, then $q^{-1}(q(V)) = V \mathbin -V$. $V$ and $-V$ are open so this is the decompostion of $q^{-1}(q(V))$ into connected componenets, since they are also closed in the subspace topology of $q^{-1}(q(V))$.

They are clopen, hence union of connected componenets. So if we pick $V$ connected to begin with, there are the connected components.

We need to porve $q$ is homeomorphism restricted to each one of the components. $q|_V : V \rightarrow q(V)$ or $q|_{-V} : -V \rightarrow q(V)$.

We need to prove it open for homeomorphism. Take $W \subseteq V$ open , $q(W)$ is open in  $q(V)$ if it is open in $RP^n$, which is open if 


#### Theorem:
* Let $q: E \rightarrow X$ be a covering map. Then all $x \in X$ have the same number of points in their fibres.

Proof. 

Take $x \in X$ fixed

Let $V = \{y : |q^{-1}(y)| = |q^{-1}(x)|\}$

Since the cardinatlity of the friber doesn't change in evenly covered neighbourhood. $V$ is open. 

By similar argument, we can know that $V^c$ is open

#### Definition:
* The number of fibers is called the number of leaves of the covers and we say $q: E \rightarrow X$ is a K-sheeted cover if the number of leaves is $K$.


![](../assets/img/2020-07-24-13-37-07.png)

![](../assets/img/2020-07-24-13-40-09.png)