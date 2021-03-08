---
layout: post
title:  "Irreducibility Criteria"
date:   2021-03-04 00:56:11 -0400
categories: Math
---
To decides if an element in a (polynomial) ring can be reduced or not 

But there are too many ways to approach, and each method is different.

My tiny head is just not enough to tidy these things up.

### Gauss' Lemma
* $R$ as UFD, $F$ as field of fraction of $R$
  * if $p(x)$ is reducible in $F[x]$ then $p(x)$ is reducible in $R[x]$
  * $p(x) = A(x)B(x)$ in $F[x]$ can lead to $dp = A'(x)B'(x)$, as a factorization in $R[x]$
***
* for $g(x) \in R[x]$ with that gcd of coefficients of $g(x)$ is 1
  * $g(x)$ is irreducible in $R[x]$ iff it is irreducible in $F[x]$
***
*  Note that generally speaking if $g(x)$ is reducible in $R[x]$, it might not be reducible in $F[x]$
   *  say $7x \in \mathbb{Z}[x]$ is reducible but $7x \in \mathbb{Q}[x]$ is not reducible

### Eisenstein Criterion (original version)
* just like the following but $a_n = 1$ (monoic)

### Eisenstein Criterion (variant/tutorial version)
* $P$ a prime ideal in UFD $R$
* $p(x) = a_nx^n + a_{n-1}x^{n-1} + ... + a_0 \in R[x]$, $n \ge 1$
* if
  * $a_i \in P, 0 \le i < n$
  * $a_n \not \in P^2$
  * $a_n \not \in P$
* then $f(x)$ is irreducible in $F[x]$, where $F$ is a quotient field of $R$

### Eisenstein Criterion on $\mathbb{Z}[x]$ and $\mathbb{Q}[x]$ 
* $p(x) = a_nx^n + a_{n-1}x^{n-1} + ... + a_0$
* if 
  * $p$ divides $a_i, 0 \le i < n$
  * $p^2$ doesn't divide $a_0$
  * $p$ doesn't divide $a_n$
* then $p$ is irreducible in $\mathbb{Z}[x]$


### Just Find the Root!
* if $f(a) = 0$, then $(x-a)$ divides $f(x)$ and we can factor out this linear  part

### Reduction Homomorphism
* a proper ideal $I \subseteq R$
* **monic** $p(x) \in R[x]$
  * if the image of $p(x) \in (R/I)[x]$ cannot be factored in $(R/I)[x]$ into two smaller degree polynomial
    * then $p(x)$ is irreducible

### Rational Root Theorem
* $p(x) = a_nx^n + a_{n-1}x^{n-1} + ... + a_0$
  * if $r/s \in \mathbb{Q}$ with $gcd(r,s) = 1$ is a root of $p(x)$
    * then $r \| a_0$ and $s \| a_n$

***
# Irreducibility in general ring

* In $\mathbb{Z}[?]$, if a norm $N(x)$ is prime, then $x$ is irreducible
  * as any factorization will have one factor of norm 1, and usually only unit has norm 1
* ![](/assets/img/2021-03-06-23-59-08.png)
  * prime $n^2+1$, 1 modulo 4
### Fermat's Theorem on sums of square
![](/assets/img/2021-03-07-00-06-22.png)
* $p = a^2+b^2$
* irreducible elements in $\mathbb{Z}[i]$

### Fundamental Theorem of Finitely Generated Abelian Group

![](/assets/img/2021-03-08-13-20-52.png)