---
layout: post
title:  "Intro to Topology, Lec 10"
date:   2020-06-03 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec10
Compactness -- a way to deal with the notion that a space is some sense small

Finite set! 

We want to relax the notion compactness because it is too restricted.

There are several generalization of compactness. 

1. Local compactness 
2. **Paracompactness**

### Definition:
*  $X$ is **compact** if every open cover has a finite subcover

### Definition
*  Let $X$ be a topological space, We say $X$ is **locally compact** if 
   *  for every point $p \in X$, there is a compact set $K \subseteq X$ and an open neighbourhood $U$ of $p$ with $U \subseteq K$ 
      *  Note: It is kind of saying that every point is inside an interior of a compact set

### Definition
* We say a set $A \subseteq X$ is **precompact** if $\bar{A}$ is compact. 
* If $A$ is open we call it precompact open
  * Note: This notion is very important in functional analysis since using this compact we define compact operations, which are fundamental


These notions are not really working without Hausdorff.

### Theorem
* Let $X$ be a Hausdorff topological space, then the following are equivalent. 
1.  $X$ is locally compact
2.  Each point of $X$ has a precompact neighbourhood (of $X$)(neighbourhood always means open)
3.  $X$ has a basis of precompact open sets $\LARGE \star$

$\text{Proof.}$ We have 3 implies 2 implies 1 immediatelt.

Clarify (2) => (1):
1.  Let $x \in X$ be any point. By (2) we $exists U \in \tau$ s.t. $ x \in U \subseteq \bar{U}$, which is exactly 1.

Challenge (1) => (3):
1. Let $X$  be an arbitrary point. By (1) there is a compact set $K$ and a neighbourhood $U$ s.t. $x \in U \subseteq K$
2. Define $V_x = \{V \subseteq K: V \in \Tau_X, x \in V\}$ , by 1, we know it is not empty
3. Now we claim $V_x$ is a basis around $x$ of precompact open sets
   1. $V \in V_x$ then $\bar{V} \subseteq K$ since $K$ is closed because Hausdorff
      1. Hausdorff makes compact set closed
      2. Hausdorff makes closed subset of compact set compact
   2. thus $\bar{V}$ is compact 
   3. Why it is basis around $x$?
      1. Given any open set $R$ s.t.  $x \in R \subseteq X$, we take $U \cap R$ as the open set in $K$
      2. thus $x \in U \cap R \in V_x$
4. To build global basis $V = \bigcup_{x \in X}V_x$

HW5 Q4:
X is second countable,
similarly construct dense countable subset,

***

Let $X$ be a compact space, and suppose $\left\{F_{n}\right\}$ is a countable collection of nonempty closed subsets of $X$ that are nested , which means that $F_{n} \supseteq F_{n+1}$ for each
$n .$ Show that $\bigcap_{n} F_{n}$ is nonempty.


***

Q5: Get the convergent subsequent in the first index, and then try to use those indexes on the second subsequenece and repeat the job

![](/assets/img/2020-06-05-13-40-54.png)

![](/assets/img/2020-06-05-13-44-33.png)
Projection map is open.


![](/assets/img/2020-06-05-13-50-19.png)


![](/assets/img/2020-06-05-13-52-32.png)

Closed is very extrinsic/relative to the ambient space; compactness is intrinsic/absolute/ not relative to the ambient space. 

![](/assets/img/2020-06-05-13-57-54.png)

So when saying closed, you have to say closed in what topological space. But not for compactness. (Intrinsic)