---
layout: post
title:  "Intro to Graph Theory, Lec 1"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Lec 16
### Theorem: Lemma 4.3.7
* $f^+(U) - f^-(U) = \sum_{v \in U}f^+(v) - f^-(v)$

![](../assets/img/2020-11-03-16-11-29.png)

### Theorem: Corollary 4.3.8 (Weak duality)

![](../assets/img/2020-11-03-16-13-36.png)

Maximum value of a feasible flow doesn't exceed the minimum capacity of a source/sink cut



### Theorem: Ford Fulkerson (Theorem 4.3.11)
* In every network, the maximum value of a feasible flow is equal to the minimum capacity of a source/sink cut

#### Algorithm: Ford-Fulkerson Algorithm I (10-29 recording 8, 28:51)
![](../assets/img/2020-11-03-16-18-50.png)

#### Algorithm: Ford-Fulkerson Algorithm II (10-29 recording 8, 41:22)

![](../assets/img/2020-11-03-16-19-29.png)

![](../assets/img/2020-11-03-16-20-03.png)