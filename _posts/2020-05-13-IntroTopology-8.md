---
layout: post
title:  "Intro to Topology, Lec 8"
date:   2020-05-20 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec8
## Quotient Topology:

$\LARGE \text{Definition}$ Let $f : X \rightarrow Y$ be a map and $X, Y$ be topology spaces. We say $f$ is a quotient map if 
*  $f^{-1}(V) \subseteq X$ is open $\iff$ $V \subseteq Y$ is open

$\LARGE \text{Remark}$
*   Quotients are not good preserving many properties. 
    *   (for example, harsdorff, second countable, first countable are not necessarily preserved)


### Example:
Take $\reals$ and define an equivalence by
1. $x \sim y \iff x = y$
2. $x \sim y \iff x, y \in \mathbb{Z}$

![](/assets/img/2020-05-29-12-22-44.png)

The blue point is not even 1^{st} countable.


![](/assets/img/2020-05-29-12-24-46.png)


The red intervals will glue into a new opensets! Please think through why
first countable.  

The following is open since the pre-image is open as well.
![](/assets/img/2020-05-29-12-29-41.png)

![](/assets/img/2020-05-29-12-30-33.png)


### Characteristic property of Quotients!
Let $X$ be a topological space, and $q : X \rightarrow Y$ a surjective map.
1. The quotient topology on $Y$ induced by $q$ is the only topology on $Y$ that satisifes 
   *  $(P_q)$: For all topological spaces, $Z$ and maps $f: Y \rightarrow Z$, we have $f : Y \rightarrow Z$ is continuous iff $f \circ q : X \rightarrow Z$ is continuous

![](/assets/img/2020-05-29-12-39-51.png)

$\LARGE \text{Remark:}$ From the perspective of map and sets: (not in topolgical spaces). The existence of diagonal.

![](/assets/img/2020-05-29-12-38-05.png)

That means $g(x_1) = g(x_2)$ if $q(x_1) = q(x_2)$.

$\text{Proof of property:}$
Suppose $q: X \rightarrow Y$ is a quotietnet
*  Suppose $f \circ q$ is continuous. Let $V \subseteq Z$ an open set, then
   *  $(f \circ q)^{-1}(V) \subseteq X$ is open $\iff q^{-1}(f^{-1}(V))\subseteq X$ is open $\iff$ $f^{-1}(V)\subseteq Y$ is open;
      *  Hence $f$ is continuous
*  The other directtion is trivial

$\text{Proof of Uniqueness:}$
Suppose $(Y, T)$ also satisifes $P_q$, then look at the diagram. We first prove $q: X \rightarrow (Y,T)$ is continuous by diagram with identity.

![](/assets/img/2020-05-29-12-45-59.png)

$q$ is continuous iff $id$ is continuous.

Next for uniqueness:

![](/assets/img/2020-05-29-12-47-23.png)

That makes $id$ homeomorphism, that is $T_{quo} = T$

$\LARGE \text{Colloraary}$ Unique ness of quotient spaces

*  Let $X$ be atopolgical space and $q_1 : X \rightarrow Y_1, q_2 : X \rightarrow Y_2$.
*  If $q_1(x) = q_1(y) \iff q_2(x) = q_2(y)$, then $Y_1 \simeq Y_2$ homeomophric

### Example (The projective space)

Let $X = \reals^{n+1}$ and define in $\reals^{n+1} \backslash \{0\}$ an equivalence relation by:
   *  $x \sim y \iff x = \lambda y for some \lambda \neq 0$

We define $\reals^{n} -\{0\} / \sim = \reals P^n$
This is called real projective space of n-th dimension


![](/assets/img/2020-05-29-12-59-57.png)


Fact $\reals P^{n+1} \simeq S^n/\sim$

![](/assets/img/2020-05-29-13-04-22.png)


## Q3, Q4
![](/assets/img/2020-05-29-13-45-55.png)