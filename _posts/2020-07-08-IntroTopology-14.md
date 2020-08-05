---
layout: post
title:  "Intro to Topology, Lec 14"
date:   2020-07-08 00:56:11 -0400
categories: Math
---
# Written Project

# Connectivity
Pieces of something

Intrisinc property as compactness! (Not rely on ambient space.)

### Definition : Connectivity
* Let $X be a topological space. We say $X$ is **disconnected** if there exist two open sets $U, V \subseteq X$, non-empty and disjoint with
* $X = U \cup V$
* We say $X$ is **connected** if it is not disconnected

Suppose $X$ is disconnected, then $X = U \cup V$, and so $V = U^c$. Here $U$ and $V$ are open and closed.

So you will feel like connectedness can restrict the cases of a set both open and close to happen. 

#### Theorem: 
* $X$ is connected if and only if 
* the only closed and open sebsets are $\emptyset$ and $X$

#### Theorem: (Intermdieal value theorem)
* Let $f: X \rightarrow \reals$ be a continuous map with $X$ connected. Also let $p, q \in X$ with $f(p) = a, f(q) = b$.
* Then $f$ takes all values $c$ between $a$ and $b$

Recall that compactness makes extreme value theorem holds.

#### Theorem: 
* Let $f : X \rightarrow Y$ be continuous, $X$ a connected space. 
* Then $f(X) \subseteq Y$ is connected.

##### Example:
All quotients of connected spaces are connected.

Since the square is connected, then $RP^2$ and mobius band and ... are all connected.

### Properties of connected spaces
1. Suppose $X$ is any space and $U, V$ are disjoint open sets of $X$. If $A$ is a connected subspace of $X$ contained $U \cap V$, then $A \subseteq U$ or $A \subseteq V$
2. If $X$ is a space that contains a dense connected subspace, then $X$ is connected
3. Suppose $X$ is any space and $A \subseteq X$ is connected. Then $\bar{A}$ is connected, as is any subspace with $A \subseteq B \subseteq \bar{A}$
4. Let $X$ be a space and $\{B_i\}_{i \in A}$ a collection of connected subspace of $X$ with a point in common. Then $\bigcup_i B_i$ is connected. (this is different from mutual disjoint)

Proof & comments for 1.
$A \subseteq U \cup V \rightarrow A \subseteq U$ or $A \subseteq V$

This in a sense is a property that is indivisable.

Property : Prime avoidance.


Consider $A \cap U$ and $A  \cap V$. They are open and because $A$ is conncted, one of them has to be $A$. Indeed:
*  $(A \cap U) \cap (A \cap V) = A \cap U \cap V = \emptyset$
*  $(A \cap U) \cup (A \cap V) = A$

Hence $A \cap U$ or $A \cap V$ must be equal to $A$.

Proof and comments for (4).
It is very important to take union instead of intersection:

![](/assets/img/2020-07-08-14-09-35.png)

Let $p \in \cap_{i} B_i$. Suppose $U, V$ are disjoint open subsets of $\cap_{i} B_i$ that disconnect $\bigcup_{i}B_i$. This means $U \cap \bigcup_{i}B_i$ and $V \cap \bigcup_{i}B_i$ are disjoint and non empty.

And also $\bigcup_{i}B_i \subseteq U \cup V$. Then each $B_i \subseteq U\cup V$. By (1), $B_i \subseteq U$ or $B_i \subseteq V$. Because $U \neq \emptyset$ and $V\neq \emptyset$, there is at least one $B_i \subseteq U$, $B_j \subseteq V$, so $p \in U$ and $p \in V$, a contradiction.

#### Definition:
* Let $X$ be a topological space. A path / curve in $X$
* is a continuous map $\alpha : [0,1] \rightarrow X$

Since $[a,b]$ is homeomorphic to $[0,1]$, an equivalent definition is to ask continuous map $\alpha : [a,b] \rightarrow X$

![](/assets/img/2020-07-08-14-33-32.png)

#### Definition: 
* $X$ is path-connected if for every two points there is a path $\alpha : [0,1] \rightarrow X$ with $\alpha(0) = x, \alpha(1) = y$

##### Theorem:
* A path-connected space is connected.
Proof. Let  $X$ be a path-connected and suppose $U, V$ are open sets that seperate X. Pick $x \in U$ and $y \in V$, and a path $\alpha: [0,1] \rightarrow X$ joining $x, y$. 

![](/assets/img/2020-07-08-14-40-52.png)

$\alpha([0,1]) \subseteq$

#### Example:
1. $\reals^n$ is path-connected since given $x, y \in \reals^n$ a path is $\alpha(t) = xt + y(1-t)$, have $\reals^n$ is connected
2. Sphere $S^n$ is connected: $\alpha(t) = \cos t * p + \sin t * q$ $t \in [0, 2 \pi]$ 
3. ![](/assets/img/2020-07-08-14-46-36.png)

4. Consider $Y = \{(x, \sin (\frac{1}{x})) | x \in (0, \infty)\} \cup \{(0, y) | -1 \le y \le 1\}$

![](/assets/img/2020-07-08-14-48-54.png)

#### Definition
* Let $X$ be a topological space and $x, y \in X$
1. We say $x \sim_p y$ if there is a path connecting $x$ to $y$.
   1. This is an equvialence relationship and the equivalence classes are called path-connected components
2. We say $x \sim_c y$ if **there exists** connected $U \subseteq X$  with $x,y \in U$. This is an equivalence relation and the equvalence classes are called connected component ($U$ doesn't have to be open)
   1. The transitivity requires some effort, by using the property we just proved.
3. Path connected compnents are included in connected componenets

could you explain why the sine curve is connected?

because if you try to find a ball on a vertical line, you will find out there is always the oscialling since touching the ball... You just cannot seperate them.

Locally path-connected/connected space.