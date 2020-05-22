---
layout: post
title:  "Intro to Topology, Lec 5"
date:   2020-05-20 00:56:11 -0400
categories: Math
---

# UofT MAT327-Lec5

$\LARGE \text{Definition:}$ Let $X, T$ be a topological space and $A \subseteq X$. 
* We define $T_A = \{ V \cap A | V \in I\}$.
* Then $(A, T_A)$ is called subspace of $X$


We have $i_A : A \rightarrow X := a \mapsto a$

$\LARGE \text{Theorem:}$ (characteristic property of subsapace topology)
1. Support $X$ is a topological space and $S \subseteq X$ a subspace. Then $(S, T_S)$ satisfies:
   1. $(P_s):$ For any topological space $Y$, a map $f : Y \rightarrow S$ is continuous if and only if the composite map $i_S \circ f : Y \rightarrow X$ is continuous.
2. If $S \subseteq X$ is any subset where $X$ is a topological space, then the only topology on $S$ that satisifies $(P_s)$ is subspace topology.

![](/assets/img/2020-05-21-21-42-50.png)

Universal mapping property!!!

$\text{Proof.}$  
1. Suppose we have a subspace $S \subseteq X$.
   1. if $f : Y \rightarrow S$ is continuous, then $i_S \circ f$ is continous because it is a composite of continuous function.
   2. Suppose $i_S \circ f$ is continuous. Let $U \subseteq S$ be an open set, we can find an open set $V \subseteq X$ with $V \cap S$. Here $f^{-1}(U) = f^{-1}(V \cap S) = f^{-1}(i_S^{-1}(V)) = (i_S \circ f)^{-1}(V)$ where $(i_S \circ f)$ is continuous, thus $f^{-1}(U)$ is open. 
2. Suppose $S \subseteq X$ is any topology $T'$. s.t. $(P_s)$ is satisified. We need to prove that $T_S = T'$.
   1. Let $I_S : S \rightarrow S$ be the identity map
      1. Because $(S, T')$ satisifies the characteristic property, pick $Y = (S, T_S)$ and we know $I_S$ is continous iff $1_S \circ I_S = 1_S$ is continious. This implies $T' \subseteq T_S$. Filpping the row, we can know $T_S \subseteq T'$ 

Please go to this again to detailedly check it.

$\LARGE \text{Proposition:}$ Let $T_1, T_2$ be topologies on $X$ then the identity map $id_X : (X, T_1) \rightarrow (X, T_2)$ is an homeomorphism iff $T_1 = T_2$


$\text{Proof.}$  


$\LARGE \text{Theorem:}$ Let $X, Y$ be topologoical spaces and $f: X \rightarrow Y$ continous.
1. If $S \subseteq X$ is a subspace then $f|_S : S \rightarrow Y$ is continuous
2. If $S \subseteq Y$ is a subspace and $f(X) \subseteq S$ then restricting the codomain $f: X \rightarrow S$ is continuous
3. If $Y \subseteq Z$ is a subspace then $f : X \rightarrow Z$ is continuous.

$\text{Proof.}$
1.  $f|_S = f \circ i_S$ which composites of continuous function
2.  easily by characteristic property
3.  $f' : X \rightarrow Z = i_S \circ f$ which is composition

### Example:
Let $A$ be an orthognal matrix, this means $<Ax, Ay> = <x,y>$

Consider a map $A : S^2 \rightarrow S^2$. Prove it is continuous with $S^2 \subseteq \reals^3$ as a subspace.

1. $A : \reals^3 \rightarrow \reals^3$ by writing $A(x,y,z) = (ax +by+cz, dx+ey+fz, gz + hy + jz)$. $A$ is continuous as a map from $\reals^3$ to $\reals^3$. Hence $A : S^2 \reals \rightarrow \reals^3$ is continuous. Because $A$ is orthogonal, $A(S^2) \subseteq S^2$, so I can restrict the codomain and get $A : S^2 \rightarrow S^2$ is continuous.


### Example: 
Consider $(a, b, c, d) \in \reals^4$. We can then form the invertible ones $GL(2, \reals) \subseteq \reals^4$ and we give them the subspace topology.

$i : GL(2, \reals) \rightarrow GL(2, \reals)  := A \mapsto A^{-1}$.

We can see that its entries from $GL(2, \reals) \rightarrow Mat(2, \reals) = \reals^4$, and restricting the codomain. thus $i$ is continuous.


$\LARGE \text{Proposition:}$ Let $X$ be a topological space and $\beta$ a basis of X

1) If $A \subseteq B \subseteq X$ then $T_A = (T_B)_A$
   1) $T_A = \{U \cap A | U \in T\}$, $(T_B)_A = \{ U \cap A | U \in T_B\}$
2) The set $\beta_A = \{A \cap B | B \in \beta\}$ is a basis for $T_A$
3) If $X$ is Harsdorff, second countable or first countable, so as its subspace 

$\text{Proof.}$ 
1) Let $i_A : A \rightarrow X, i_B : B \rightarrow X$ and $i_A^B : A \rightarrow B$ be the inclusion, we have the charactieristic diagram. $i_A =i_B \circ  i_A^B$

Now we put $(A, T_A)$ and $(A, (T_B)_A)$ at the place of $A$ each time. Using characteristic property 2 times.

$\text{Remark.}$  Let $A \subseteq X$ be a subset, and $T'$ a topology on $A$. $i_A : (A, T') \rightarrow X$ is continuous if and only if $T' \supseteq T_A$.

The reason is that $i_A^{-1}(U) = U \cap A$ so it has to be in $T'$. But $\{ U \cap A\}_{U \in T} = T_A$. thus $T_A \subseteq T'$.


## Product Topology

Product of finite spaces or product of infinite spaces?

Let $X_1,..,X_n$ be a topological spaces.


$\LARGE \text{Definition:}$ Let $\beta_{X_1\times X_2 ,..., \times X_n}$ the collection of subsets of $X_1 \times ,.., \times X_n$ given by: 
$\beta_{X_1\times X_2 ,..., \times X_n} = \{U_1 \times .. \times U_n | U_i \subseteq X_i \text{ is open }\}$.

$\LARGE \text{Proposition:}$ $\beta_{X_1\times X_2 ,..., \times X_n}$ is really a basis.

$\text{Proof.}$ 
1) $X_1\times X_2 ,..., \times X_n \subseteq \bigcup \beta_{X_1\times X_2 ,..., \times X_n}$
2) Let $U = U_1 \times ... U_n, V = V_1 \times ... V_n \in \beta_{X_1\times X_2 ,..., \times X_n}$, and $p \in U \cap V$.

Notice that $U \cap V = U_1 \times ... U_n \cap V_1 \times ... V_n = (U_1 \cap V_1) \times ... (U_n \cap V_n) \in \beta_{X_1\times X_2 ,..., \times X_n}$ 


$\LARGE \text{Definition}$ The topology generated by this basis is called the product topology.

We can define some canonical maps: $\pi_i : X_1 \times ... X_n \rightarrow X_i := (x_1,..,x_n) \mapsto x_i$. these are called the projection.

$\LARGE \text{Theorem:}$ (Characteristic property of product spaces).

Let $X_1,...,X_n$ be topological spaces. 
1) The product topology on $X_1 \times ... X_n$ satisfies the following:
   1) (P_s) For any topological space $Y$, a map $f: Y \rightarrow X_1 \times ... X_n$ is continuous iff $f_i = \pi_i \circ f$ ($i$-th component) is continuous for each $i$.
2) The product topology on $X_1 \times ... X_n$ is the only topology on $X_1 \times ... X_n$  that satisfies this property.

![](/assets/img/2020-05-21-21-45-25.png)