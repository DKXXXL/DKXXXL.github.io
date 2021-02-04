---
layout: post
title:  "Intro to Algebra, Lec 23"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Lec 28

### Euclidean Domain (Error Correction)
* norm 
* $N(x) = 0$ in the field
  * $a=bq + r$, $r=0$ or $N(r) < N(b)$
  * it is possible that $N(r) = 0, r\neq 0$
    * that $r$ will continue to be used to divide the previous remainder
    * it is also provable that $r$ is a unit and thus we won't have further remainder (which has to be zero)

### Definition: Unique Factorization Domains
* $R$ integral domain
  * an element $r \in R$, $r \neq 0$ is called
    * irreducible 
      * if it is not a unit and 
      * if $\forall a,b$, $r = ab$ then (at least) one of $a,b$ is a unit
  * In Integers, irreduciable are just prime 

### Definition 
* $r$ is prime if $(r)$ ia s prime ideal
  * i.e. $if ab \in (r)$ i.e. $ab = sr$ for some $s$
    * then either $r | a$ or $r | b$

### Defintion: Associate to
* If $u$ is a unit, then $a$ is associate to $ua$
  * We say $a, b$ are associate if there is $u \in R^\times$ with $b = ua$

### Prop: 
* If $R$ is integral domain, 
  * then any prime elemenet is irreducible
    * (not conversely)
* Proof. 
  * Suppose $p$ is prime, but not irreducible, then we have $p = ab$ s.t. none of a, b is unit
    * then $ab \in (p)$ thus $a \in (p)$ or $b \in (p)$
      * WLOG $a \in (p)$ and thus $a = sp = sba$ causing $1-sb = 0$ and thus $b$ a unit

### Example
* In Z, primes $\iff$ irreducible
  * But in $Z[\sqrt{-5}]$, $(2+\sqrt{-5})(2-\sqrt{-5}) = 9 = 3^2$
    * but neither of the factors on the left is divisble by 3
    * thus $3$ is not a prime as the above is in $(3)$ because $2\pm \sqrt{-5} \not \in (3)$
    * 3 is irreducible but not prime
* In $F[x]$ prime iff irreducible
* it is also not true in $Z[x]$
***
* irreducible is used for polynomials
* prime is used for $Z$

### Prop: In a P.I.D., prime iff irreducible
* => is proved
* (<=) To show $(q)$ is prime,
  * suppose $M$ is an ideal with $(q) \subseteq M$
    * PID tells us $M=(m)$ and $q = tm$
      * since $q$ is irreducible, then either t or m is unit
        * if $m$ is unit then $M$ is the whole ring
        * if $t$ is unit, then $M = (q)$
      * thus $(q)$ is the maximal ideal, and thus a prime

### 