---
layout: post
title:  "Intro to Graph Theory, Lec 1"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Lec 20
# recording 21, Dec. 01, 20:00

### Definition: Platonic solids. (cannot find on textbook!)
* ![](../assets/img/2020-12-05-17-13-42.png)
* ![](../assets/img/2020-12-05-17-14-24.png)


### Theorem: 5-colour theorem (6.3.1) (28:21)
* dual graph of a planar graph is also planar
  * actually only plane graph has dual
* key part: ![](../assets/img/2020-12-07-23-23-39.png)
* basically because of planarity, path1/3 cannot cross path2/4, and thus component 2 is detached from compoennt 4, and we switch one colour (2 to 4) is safe
* the question is why if it is planar, it looks like this? it is totally proof by drawing.
# recording 22, Dec. 01, 

### Platonic solids

### Definition: outerplanar graphs (03:04) (6.1.17)
#### (where is it in the textbook)
* there exists a plane drawing with all vertices on the boundary of the outer face
* ![](../assets/img/2020-12-05-17-35-36.png)
* don't have to be connected
* ![](../assets/img/2020-12-05-17-36-16.png)
* ![](../assets/img/2020-12-05-17-41-59.png)
* 2-connected outer-planar graph has outer face as cycle as boundary
  * (???) because if not, then we have repeated edges on outer-walk, then we have both sides as outer face
### Theorem: Each outerplanar simple graph has a vertex of degree at most 2 (11:06) (6.1.20)
* cannot find on textbook

### Theorem: (18:18) 
* a graph is outer-planar iff it doesn't contain $K_4$ and $K_{2,3}$
  * one of the homework
  * the other direction: Prop 6.1.19
  
### Theorem: (20:01)
* a outer planar graph is 3-colourable
  * deducible from 4-colour theorem
    * not proven in the lecture

# Parameters of Non-planarity (20:32)

### Definition: (Thickness) 6.3.9
* minimal number of planar graphs in a decomposition

### Theorem: (6.3.10) (22:00)

### Definition: (Crossing number) $v(G)$

### Theorem: 6.3.13 (24:00)
* basically $G-H$ has crossing with H, 
  * and $G-H$ might still have crossing, whose sub planar graph has edge size at most $H$
  * thus $G - H - H$
### Example: 6.3.12 (30:00, 40:00)
![](../assets/img/2020-12-05-18-05-33.png)![](../assets/img/2020-12-05-18-06-20.png)
![](../assets/img/2020-12-05-18-08-00.png)

### Lemma (47:00) 6.3.14
* $(n-4)v(K_n) \ge n v(K_{n-1})$
* (???) each intersection point in $K_n$ is an intersection point in n-4 of $K_{n-1}$
  * each crossing corresponds 4 points

### Theorem: $v(K_n) \le C_4^n$

### About $v(K_{m,n})$, (50:00) Example 6.3.15


![](../assets/img/2020-12-08-02-41-54.png)

***
recording - 12, Dec. 3th, 
# Ramsey Theorey

### Pigeonhole Principle (P378)

### Generalizee Pigoenhole (03:21) (Theorem 8.3.5) 
![](../assets/img/2020-12-05-18-25-03.png)

### Theorem: 8.3.3 (Erdos-Szekeres)

### Theorem: 8.3.1 (13:19)
* equivalently: each graph with 6b vertices contain either $K_3$ or $\overline{K_3}$
* ![](../assets/img/2020-12-05-18-38-26.png)

### Theorem: (23:22)
![](../assets/img/2020-12-05-19-25-16.png)
* THeorem 8.3.11
* Example 8.3.9, Example 8.3.10
* basically a graph with sub-clique of size $m$ and independent set of size $n$ and

### Corollary: $R(m,n) \le C_{m-1}^{m+n-2}$ (34:40)
* by induction

### Lower bounds for $R(n) = R(n,n)$ (43:00)
### Theorem 8.3.12
(Not done, please continue the video from 23:00)

![](../assets/img/2020-12-08-15-13-01.png)

***

# Dec. 08th, 2:00, 3:00

### Ramsey Theorem -- Random Graph/Probability method (10:00)

### (17:30) Restricted version of Theorem 8.3.14

![](../assets/img/2020-12-08-17-46-10.png)
* the proof on book is also simple:
  * on lower bound part, there is no Kn because
    * otherwise one partite would have two elements which is impossible

### (33:30) Theorem 8.3.15

### Bowtie Lemma (45:30)

### Ramsey theorem for more
* $R(n_1,n_2,...,n_l)$
* ![](../assets/img/2020-12-08-18-52-15.png)

### Example : $R(3,3,3) = 17$
* ![](../assets/img/2020-12-08-21-04-56.png)

### Ramsey theorem for more again (8.3.7) (23:00)
* ![](../assets/img/2020-12-08-21-19-28.png)
* such that all its k-element subset (of these $n_i$ elements) are coloured in the same (monochromatic)
* TOtally don't get it
### Theorem 8.3.8 (30:24)
* Lemma (35:29)
* ![](../assets/img/2020-12-08-21-33-44.png)

***
Start reading from 30:00

# Exercise:
### 8.3.17
* by generalized pigeon hole principle, a fixed $x$, with its neighbours, there exists colour $i$ s.t. $R(q_i)$ neighbours with $x$ coloured $i$
  * this can give us the $R(p)$
* 
