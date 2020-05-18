---
layout: post
title:  "Intro to Topology, Lec 3"
date:   2020-05-13 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec3
<!-- The below is an example for conditional expression.

$\begin{cases}
    \frac{x^2-x}{x},& \text{if } x\geq 1\\
    0,              & \text{otherwise}
\end{cases}$ -->

$\Large \text{Definition:}$ Let $X$, $Y$ be topological spaces. $f : X \rightarrow Y$ is a function.
*  we say $f$ is continuous if for every open set, $V \subseteq Y$ we have $f^{-1}(V) \subseteq X$ is open. 

This pull-back open-ness.

There is a related definition

$\Large \text{Definition:}$ Let $X$, $Y$ be topological spaces. $f : X \rightarrow Y$ is a function.
*  we say $f$ is open if it preserves openness. i.e. 
*  we say $f$ is open if 
   *  for all $U \subseteq X$ open, $f(U) \subseteq Y$ is open 

This preserves open-ness.

### Example:
many times we have a condition, and this condition happens in a topological space.

Let $f: X \rightarrow Y$ be a function and $V \subseteq Y$ an open-set which has certain property. Suppose we pick $x \in X$ and $y \in Y$ s.t. $y \in B$ (thus $y$ has this property $B$).

The problem is that we might never land in an open set we want.

$\text{Continuity is far from openness... we will see example}$

$\Large \text{Proposition}$: $f : X \rightarrow Y$ iff $V \subseteq Y$ closed, $f^{-1}(V) \subseteq X$ is closed.

Proof. Suppose $f$ is continous. 
Now Pick $c \subseteq Y$ closed, then $V^c$ is open, then $f^{-1}(V^c) = f^{-1}(C)^c$, but $f^{-1}(V)$ is open; hence $f^{-1}(C)$ is closed.

Suppose $f^{-1}(C) \subseteq X$ is closed, then just inverse the step.

The pull-out of complement is justifiable, easy proof. $\square$


$\Large \text{Definition:}$ Let $f: X \rightarrow Y$ be a function. We say $f$ is closed if for all closed $C \subseteq X$, we have $f(C) \subseteq Y$ is closed.

Closed function is preserving closed set; open function is preserving open set; inverse continuous is preserving closed-set and open-set.


The Open Map theorem; the closed map lemma -- is telling you some functions are open/closed.


$\Large \text{Proposition:}$ Let $f: X \rightarrow Y$ be a function and ${\cal B}$ a basis for $Y$. Then $f$ is continuous iff $\forall B \in {\cal B}$, we have  $f^{-1}(B) \subseteq X$ is open.

Proof. 
1) f continuous, then it is trivial since each basis is open.
2) $f^{-1}(B)$ is open for all $B \in {\cal B}$. Pick $U \in Y$ an open set, then we have $U = \bigcup_j B_j$. consider $f^{-1}(U) = f^{-1}(\bigcup B_j) = \bigcup_j f^{-1}(B_j)$

but this is an arbitrary union of open set, hence $f^{-1}(U)$ is open, thus $f$ is continuous. $\square$

This proposition works nicely because inverse and arbitrary union works very well together.  In the context of open map/closed map, we don't know yet... please look it yourself.


### Example 
Let $(X, d_X)$, $(Y, d_Y)$ be metric space with their metric topologies. We can have a map between them $f : X \rightarrow Y$.

Using the proposition and the basis of a metric space, we know $f$ is continuous iff for open ball $B$, $f^{-1}(B)$ is open.

To specify a ball, we give a radius $\epsilon > 0$ and a center $y \in Y$.

What we are saying is $f$ is continuous iff 
*  $\forall \epsilon > 0, y \in Y$ we have $f^{-1}(B_\epsilon(y)) \subseteq X$ is open. 
If this is going to be open, then it has to be union of balls of $X$. Hence we can write $f$ is continuous iff $\forall \epsilon > 0, y \in Y, x \in X$ with $d(f(x), y) < \epsilon$, we can find a $\delta > 0$ s.t. $f(B_\delta(x)) \subseteq B_\epsilon(y)$ (i.e. $f^{-1}(B_\epsilon(y))$ is open).

$\text{ Calculus:}$ $f$ is continuosu iff $\forall x_0 \in X, \forall \epsilon > 0, \exists \delta > 0$ s.t. if $d(x, x_0) < \delta$ then $d(f(x), f(x_0)) < \epsilon$.

These two definitions are somewhat equivalent because the calculus definition talks about local continuity but using topology to define, we don't yet define local continuity. It is related HW2, Problem 5. i.e. $f$ is continous iff $f$ is continuous at every point.

***

$\Large \text{Defintions}$ Let $X$ be a topological space, and $A \subseteq X$ any subset. We say $p \in X$ is **an accumulation point or limit point of A**
*   if every neightbourhood of p (every open set include p) has a point of $A$ different from $p$.

$\Large \text{Defintions}$ Let $X$ be a topological space , $x_1,x_2,...$ a sequence of points in $X$, we say $x \in X$ is **a limit of a sequence $x_1, ...$** iff for every nightbourhood $U$ of $x$ there exissts an $N \in \natnums$ s.t. $n \ge N$ implies $x_n \in U$.


in $\reals^n$, converging sequence only has one limit; but in topology no. But true in metric space.

$\Large \text{Theorem}$ Let $X, d_X$ be **a metric space** and $x_1,..$ a sequence with $x_i \rightarrow x$ and $x_i \rightarrow y$


Proof. Pick $\epsilon = | x - y | > 0$. Put balls of radius $r_x < \frac{\epsilon}{2}$ and $r_y < \frac{\epsilon}{2}$ around $x,y$. $B_r(x), B_r(y)$ we have that $B_r(x) \cap B_r(y) = \emptyset$, otherwise contradiction.

If $x_n \rightarrow x$ and $x_n \rightarrow y,$ then $\exist N \in \natnums$ s,t. $m \ge N$ implies $x_n \in B_r(x) \cap B_r(y)$.

$\Large \text{Definition}$ A topological space $X$ is **Hausdorff** if 
*  for every $x, y \in X, x \neq y$, we can find open set $U, V$ with $U \cap V = \emptyset, x \in U, y \in V$

Which is basically how above metric space is.

### Example
Metric Spaces are Hausdorff.

We are basically proving limits are unique in Hausdorff.


But a lot of topologies in algebra are not Hausdorff.

And also we know HW1 Q1 is not Hausdorff.

$\Large \text{Proposition:}$ In Hausdorff space, limits are unique. 

(and it is  not iff relationship.) (If you go to Ivan’s notes
Example 3.9 in section 5
He gives an example of a space where every convergent sequence converges to only one point, but the space is not hausdorff
)

$\Large \text{Proposition:}$ In Hausdorff spaces, any singleton $\{p\}$ is closed.

Proof. If it is Hausdorff, every $q \neq p$ has a neighbourhood disjoint of $p$.  Thus $\{p\}^c$ is open (**this part is interesting to prove**) and thus $\{p\}$ is closed.


$\Large \text{Theorem}$ Let $X$ be a topological space that is first countable. Let $A \subseteq X$ be any subset and $x \in X$ any point.
1) $x \in \bar{A}$ iff $x$ is a limit of a sequence of points in $A$
2) $x \in Int(A)$ iff every sequence in $X$ convergeing to $x$ is eventually in $A$
3) $A$ is closed in $X$ iff $A$ contains every limit of every convergent sequence of points in $A$.
4) $A$ is open in $X$ iff every sequence in $X$ converging  to a point of $A$ is eventually in $A$

Proof of $\text{1}$
assume $x \in \bar{A}$. We know that $\bar{A} = A \cup \partial A$. so if $x \in \bar{A}$ then $x \in A$ or $x \in \partial A$.
1)  if $x \in A$, we can pick $\{x,x,x,...\}$
2)  if $x \in \partial A$ and $x \not \in A$. Since $X$ is first countable, **we need to first prove there exists a nested countable basis at $x$, open $U_1 \supseteq U_2 ...$** (proven in HW2).

Because it is in the boundary, there exists $x_n \in U_n \cap A$. We claim that $\lim x_n = x$.

Let $V$ be any neighbourhood of $x$, and because it is a basis, $\exists N$ s.t. $V \supseteq U_N (\ni x_n) \supseteq U_{N+1} (\ni x_{n+1})$ This proves $\lim x_n = x$

The other direction. $\lim x_n = x$, with $x_n \in A$. Suppose $x \not \in \bar{A}$ then $x \in Ext(A) = \bar{A}^c$, which is open. Thus $\exists U$ open $U \subseteq Ext(A)$. Note $x_n \in U$ with $x_n \in A$ and $A \cap Ext(A) = \emptyset$. This contradits the def of limit $x \in \bar{A}$.$\square$

**Note we didn't use first countable topology in this one**.

Which means **every limited sequence is trapped in the closure**.

Proof of 3). Suppose first $A$ is closed, if $\lim x_n = x$ with $x_n \in A$ , then $x$ is a limit of points of $A$, here by (a) $x \in \bar{A} = A$ (and I can do this for every possible limit, where limit is not even unique for one sequence!)

The other direction $\bar{A} \supset A$, so we only need $\bar{A} \subset A$. If $x \in \bar{A}$, by (1) we are done. $\square$

$\Large \text{Proposition}$ Let $X$, $Y$ be topological spaces with $X$ first countable and $f : X \rightarrow Y$. Then $f$ is continuous iff
*   $\lim x_n = x$ implies $\lim f(x_n) = f(x)$

Proof. of the inverse direction.
Suppose $\lim x_n = x$ implies $\lim f(x_n) = f(x)$. Let $C \subseteq Y$ be a closed set, we will use (3) of the previous proposition. Let $a_1,... \in f^{-1}(C)$ with $a_i \rightarrow a$. By hypothesis $f(a_i) \rightarrow f(a)$. Moreover, $f(a_i) \in C$, then $f(a) \in \bar{C} = C$ because it is closed

thus $a \in f^{-1}(C)$. By Previous (3), we get $f^{-1}(C)$ is closed .

Thus $f$ is cntinuous. $\square$

Proof of $\rightarrow$.

Suppose $f$ is continuous. pick $x_n \rightarrow x \in C$,

(The other part next time...) 
