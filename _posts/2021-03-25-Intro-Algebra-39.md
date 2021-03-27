---
layout: post
title:  "Intro to Algebra, Lec 39"
date:   2021-03-25 00:56:11 -0400
categories: Math
---
# Lec 38
### 
* We can have charactersitc polynomial $\det(\lambda I - A)  = \Prod a_i(x)$ for a matrix $A$
* Recall the invariant factors $a_i | a_{i+1}$
* these factors are unique and determine similarity class
* if we have a invariant factors, we know the campanion matrix and then we know the RCF

### The algorithm that produce RCF
* ![](/assets/img/2021-03-25-16-22-11.png)
* want to diagonalize $xI - A$ and preserve determinstic (characteristic polynomial)
* the strategy is that we know $xI - A$ is similar to the blue matrix
  * so if we apply row/column operation (elementary operation), we won't change much in determinant, thus we can arrive at blue matrix
  * Why it is always we will arrive that $a_i | a_{i+1}$
* ![](../assets/img/2021-03-25-16-42-28.png)
***
