---
layout: post
title:  "Intro to Topology, Lec 9"
date:   2020-06-03 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec9

### Compactness
To describe what is a "finite" space.

$\LARGE \text{Definition}$ Let $X$ be a topological space and $U = \{U_\alpha\}_\alpha$ be an open cover.
*  We say $X$ is **compact** if for every open cover $U$ there is a finite subcover, that is, there are $\alpha_1,..,\alpha_n \in \Lambda$ s.t. $X = U_{\alpha_1} \cup ... U_{\alpha_n}$

$\LARGE \text{Notation}$ If $A \subseteq X$ a subspace topology is compact, we say it is a compact subspace.

#### Example
$\reals^n$ is not compact. Conisder $U=\{B_n(0)\}_{n=1}^\infty$ Clearly $U$ is an open cover. 

However, any finite subcover $\{B_{n_i}(0)\}$ will have $|x| > \max \{n_i\}$ out of cover.

$\LARGE \text{Remark}$ To prove $X$ is compact, **it is not enough** to exhibit a finite cover (consider $\{X\}$ is already a finite cover). You need to start with an arbitrary open cover.

We cannot check for all infinite covers and try to extract a finite subcover, so we try to find an equivalent properties to compactness.

The most famous theorem in this direction is the one in $\reals^n$

$\LARGE \text{Theorem}$ [Heine Borel] A subset of $\reals^n$ is compact iff it is closed and bounded.

#### Example
Spheres are compact. Consider $\mathbb{S}^n \subseteq \reals^{n+1}$, since it is $\mathbb{S}^n = f^{-1}(\{0\})$ of the continuous function $f(\vec{x}) = |x| - 1$

Thus $\mathbb{S}^n$ is closed; and bounded and

#### Remark:
Heine Borel only works in $\reals^n$. Closed and bounded is not enough for compactness.

Boundeness only makes sense in metric space.

Moreover, the statement of H.B. doesn't hold in more general metric spaces.

#### Theorem:
Let $X$ be a compact space, $A \subseteq X$ an infinite subset. Then $A$ has a limit point in $X$

$\text{Proof.}$ Suppose $A$ is an infinite subset, without a limit point.

If no point is a limit point, then every $x$ in $X$ has a neighbourhood, s.t. $U_x$ has no point of $A$ besides $x$.

Hence $\{U_x\}_{x \in X}$ are cover of $X$. By compactness, there is $x_1,...x_n$ s.t. $X = U_{x_1} \cup ...$

Since $A$ is infinite, there must be $x \in A \backslash (U_{x_1},...U_{x_n})$
but this is a contradiction since this should be empty.

There must be a limit point.

#### Example

Consider $l^2(\reals) = \{(c_1,c_2,...) : \sum_i c_i^2 < \infty\}$

this is a metric space with distance 
$d((c_1,..), (d_1,..)) = \sqrt{\sum_i(c_i-d_i)^2}$

This is closed and bounded. Now note $(1,0,...), (0,1,...), (0,0,1,...)$

The distance of arbitrary two of them is $\sqrt{2}$.

Thus $\mathbb{S}^\infty$ is not compact despite closedness and boundedness.

#### Definition:
Let $X$ be a topological space. We say $X$ is limite point compact if every infiniite subset of $X$ has a limit point.

#### Proposition:
Compactness implies limit point compactness.

#### Theorem:
Let $X$ be a Hausdorff first countable limit point compact set, then every seqeuence in $X$ has a convergent sequence.

**Note: Bolzano Weierstrass is not this. Bolzano Weierstrass is about limit point.**

$\text{Proof}.$

Let $\{x_i\}$ be any sequence in $X$.
1. If any value appears infinitely often in the sequence, then I can construct a constant subsequence which converges to that constant point.


WLOG, (or by some operations), we can assume $x_i \neq x_j \forall i,j$. (by creating the subsequence)

Call set $A = \{x_1, .., \} \subseteq X$. This is now infinite, and so there is a limit point. Let's call this limit point $x$.

Because it is first countable, we can build a sequence in $A$. $y_1,...y_n,...$ s.t. 

$\lim_{n \rightarrow \infty} y_i = x$ by using the nested basis and hausdorff. We have $y_1$ and $x$, and use the hausdorff to construct a set including $x$ not $y_1$ and intersect with the basis.

We are not done since the $y_i$'s might be in a different order and so again we need to construct a subsequence that respect the order.

Done by drawing:

![](/assets/img/2020-06-03-14-11-45.png)

We construct out of $y_i$, hence convergent, that is also a subsequence of $x_i$, inductively.
1. $z_1 = y_{n_1}$ where $y_{n_1}$ is the $y$ with smallest subindex from the sequence of $X$
2. Suppose we have constructed $z_1 = y_{n_1},... z_k = y_{n_k}$ with $n_1 < ... < n_k$ but also the $y_{n_1},... y_{n_k}$ respecting he order of the sequence $x_1,x_2,...$
3. We look in $y_{n_k + 1}, y_{n_k + 2},...$ for the one with the smallest index in the $x_1,x_2,...$ that appears after $y_{n_1},...y_{n_k}$. We can do this because? all $x_i$ are different. Otherwise we don't know which $x_i$ a specific $y_i$ is from.


#### Definition
Let $X$ be a topological space. If Every sequence in $X$ has a convergent subsequence, we say $X$ is sequentially compact.

Compact => Limit point compact => (+ $1^{st}$ countability + Hff) => Sequential Compactness

Sequential Compactness => (+ Second Countable) or (+ metric space) => Compact


#### Theorem
Let $X$ be a second countable and sequentially compact topological space. Then it is compact.

$\text{Proof.}$ by contradiction.

Suppose $X$ is not compact. Then there exists an $\{U_{\alpha}\}$ is an infinite open cover without finite subcover.

By second countable, and Assignment 2/Assignment 1, we can extract a countable subcover $U_1,U_2,...$ adn this still does not have finite subcover.

For every $n \in \natnums$, we have $\{U_i\}_{i=1}^n$ is not a subcover. Hence $U_1 \cup U_2 ... U_n \neq X$.hence we can extract $p_n \in X \backslash (\bigcup_{i=1}^n U_i)$.

hence $p_1,p_2...$ is a sequence and by sequential compactness, we have a covergent subsequence $p_{n_k} \rightarrow p$ somce $p \in X$.

But $p \in U_m$ for some $m$. By definiiton of limit, there exists $N \in \natnums$, s.t. $k > N \implies p_{n_k} \in U_m$.

This is a problem since $k > N$ and $n_k > m$ then $p_{n_k} \in X \backslash (U_1,... \cup U_m \cup ...\cup U_{n_k})$ and $p_{n_k} \in U_m$.

Hence this is a contradiction



#### Theorem

Metric Space + sequentional compactness => Second countable

### what happened if we see everything from the point of view of closed sets.

$\bigcup_\alpha U_\alpha = X \iff \bigcap_\alpha C_\alpha = \empty$ (when $C_\alpha = U_\alpha^c$)

What does finite subcover mean?


$\bigcup_\alpha^n U_\alpha = X \iff \bigcap^n_\alpha C_\alpha = \empty$ (when $C_\alpha = U_\alpha^c$)


#### Definition [FIP]
Let $X$ be a topologial space, and $\{A_\alpha\}_{\alpha \in A} = A$ subsets of $X$. We say $\{A_\alpha\}$ has the finite intesection property, 
*  if every subcollection of $A$ that is finite has non-empty intersection

That means, the above $\{C_\alpha\}$ doesn't have FIP.

#### Theorem
$X$ is compact $\iff$ every collection of closed sets with FIP has non-empty intersection.


#### Example
Bolzano-Weistrass: A bounded infinite set in $\reals^n$ has a limit point. 

#### Extra prop is on the notes