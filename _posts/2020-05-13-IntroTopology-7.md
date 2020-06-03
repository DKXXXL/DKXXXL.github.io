---
layout: post
title:  "Intro to Topology, Lec 7"
date:   2020-05-20 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec7
On quiz:
Q1 :  you need to check $F : S^3 \rightarrow S^2$, you need to check $F(S^3) \subseteq S^2$

### Qutient Topology, that destrcut all the good things

$\LARGE \text{Definition}$ let $q : X \rightarrow Y$ be a surjective map, and $X$ be a topologoical space. We define the quotient topology on $Y$ by the following way.
*  ${\cal T}_{quo} := \{ V \subseteq Y | q^{-1}(V) \subseteq X \text{ is open }\}$


$\LARGE \text{Definition}$ If $q : X \rightarrow Y$ is a surjective map between topological spaces we say $q$ is a quotient map if 
*   $V \subseteq Y$ is open $\iff$ $q^{-1}(V)$ is open


$\LARGE \text{Proposition}$ The quotient topology is really a topology.

$\text{Proof}$ 
1) $q^{-1}(\emptyset) = \emptyset$ ..
2) Arbitrary union because $q^{-1}(\bigcup U) = \bigcup q^{-1}(U) \in T$
3) Finite intersection $q^{-1}(\bigcap U) = \bigcap q^{-1}(U) \in T$

### Philosophy of the quotient map
1) We begin with a topological space $(X, T)$, and we want to glue certain points together
   1) The way to do this is by giving some equivalence relationship on $X$. This partition $X$ into equivalent classes and the set of equivalence classes is denoted by $X/\sim$
2) The produce a map $\pi : X \rightarrow X / \sim$ that maps each point to the equivalence class and $X/ \sim$ has no topology on it, but we can give one to it by quotient topology
3) Like this $X / \sim$ becomes a topological space, but it is still abstract 
   1) We would like to identify $X / \sim$ with another topoligical space that is more concrete
   2) We would to do this by studying the gluing on $X$ directly

#### Example:
Consider $I = [0,1] \times [0,1] \subseteq \reals^2$

Define $\sim$ by $(x,y) \sim (u,v)$ if
1) $(x,y) = (u,v)$
2) if $x = 0$, then $(0, y) \sim (1,y)$
3) if $y = 0$, then $(x,0) \sim (x,1)$

This above is not really an equivalence relationship. But we can derive an equivalence relationship from it. (Transtive/Symmetric closure)

Now you will see that, when figuratively gluing equivalence classes, you will get a donut.

A torus.

Now we come to a geometric question -- how do you formally say you have two holes in a torus? Covering it in algebraic topology.

$\LARGE \text{Definition}$ Let $f : X \rightarrow Y$ be a map. A fiber of $f$ is a set of $f^{-1}(y)$ for $y \in Y$.

$\LARGE \text{Definition}$ Let $f : X \rightarrow Y$ be a map. A set $U \subseteq X$ is saturated if $f^{-1}(f(U)) = U$

Remark: A set is saturated iff it is union of fibers.

$\LARGE \text{Proposition}$ 
1) A continuous surject map $q : X \rightarrow Y$ is a quotient map if and only if it sens saturated open sets (or saturated closed sets) into open sets (closed sets)
2) Composition of quotient is quotient
3) An injective quotient map is an homeomorphism
4) If $q : X \rightarrow Y$ is a quotient map, then $K \subseteq Y \iff$ $q^{-1}(K) \subseteq X$ is closed
5) If $q : X \rightarrow Y$ is a quotient map and $U \subseteq X$ is a saturated open set then $q | _U : U \rightarrow q(U)$ is quotient

$\text{Proof}$
1. Let us assume $q$ is quotient,
   1. (*saturated open to open*) Pick $U \subseteq X$ saturated open. We need to prove $q(U) \in Y$ is open, which happens (by definition of quotient) when $q^{-1}(q(U))$ is open, which it is because it is saturated.
   2. (*saturated closed goes to closed*) Pick $C \subseteq X$ saturated closed. We need to see $q(C) \in Y$ is closed, which means $q(C)^c$ is open, which means $q^{-1}(q(C)^c)$ is open, i.e., 
      1. $q(C) \text{is closed} \iff q^{-1}(q(C))^c$ is open $\iff$ $q^{-1}(q(C))$ is closed
      2. Remark: The idea behind this proof is that the complement of a saturated open/closed set is a saturated closed/open set.
         1. Saturatedness forbids $q(U)$ and $q(C)$ having an intersection.
         2. __In other words, something is saturated if it is a union of fibers__ 
   3. Proof of the other direction.
      1. Suppose it sends saturated open into open. (this is enough, we can skip saturated closed to closed)
         1. We need to prove $q$ is quotient. This means $V \subseteq Y$ is open iff $q^{-1}(V) \subseteq X$ is open.
            1. Since $q$ is continuous, we already have one direction, only need to prove the other
            2. suppose $q^{-1}(V)$ is open, then $q^{-1}(q(q^{-1}(V))) = q^{-1}(V)$ is open (when surjective). Thus $q^{-1}(V)$ is saturated. Hence $q(q^{-1}(V))$ is open, i.e. $V$ is open.
   
We will prove 5 next time, let's write a very important theorem.

$\LARGE \text{Theorem}:$ A closed surjective continuous map or open surjective contnuous map is quotient.

$\text{Proof.}$ It follows immediately from (1).


![](/assets/img/2020-05-27-15-00-54.png)

