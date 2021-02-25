---
layout: post
title:  "Intro to Algebra, Lec 23"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Lec 32

# Modules

### Definitions: Module
* Given a ring $R$, (not necessarily commutative) (not necessarily with unit)
  * a (left) module $M$ over $R$ ("$R$-module") is an abelian group $M$
  *  written additively ("+")
  *  and a multiplication by elements of $R$
     *  $R \times M \rightarrow M$
     *  $(r,m) \mapsto r\cdot m = rm$
  *  s.t.
     *  $(r+s)m = rm + sm$
     *  $r(m+n) = rm+rn$
     *  If $R$ contains 1 we also require $1\cdot m = m$
     *  $(rs)m = r(sm)$
  *  there is no group action definition here
### Example
* In fact, if $R$ is a field $F$ then $R$-module is the same thing as a vector space over $F$
* $R$ is a $R$-module itself
### Example
* If $R = Z$ 
  * for $n>0$
    * $nm = m+m+...+m$ n copies of $m$
  * $0m = 0$
  * $nm = -m + ... -m$ for $n<0$
* Z-modules are exactly the same ting as abelian groups
  * it doesn't add new structure to the abelian groups

***
* We generate vector space and abelian group by concept of module  

### Example
* Suppose $R=F[x]$ where $F$ is a field
* An $R$-module $M$ has a multiplication by $F$ (consider constant polynomials)
* so $M$ is a vector space over $F$
* if $m \in M$, we can multiply $x\cdot m$
* Easy: $m \mapsto x \cdot m$ is a linear transformation $T:M \rightarrow M$
* An $F[x]$-module $M$ is an $F$-vector space $M$ together with linear transformation $T:M \rightarrow M$
* If $M$ is an $F$-vector space, and $T: M \rightarrow M$
  * then $M$ becomes and $F[x]$-module simply by
    * $(a_nx^n+a_{n-1}x^{n-1}...)\cdot m = a_nT^nm + a_{n-1}T^{n-1}m ... a_0m$ 

* because above example, we can transform a lot of linear algebra into module
* Jordan Canonical form is expressed in a better way
* a new perspective for linear algebra, please read the book in that chapter 


***
### Definition: submodule
* If $M$ is an $R$-module
  * and $M' \le M$ then $M'$ is an $R$-submodule of $M$
  * if $rm' \in M'$ for arbitrary $r\in R, m' \in M'$
* Equivalently:
  * when $1 \in R$, all you have to check is that 
    * if $m', n' \in M'$ and $r \in R$
      * then $m' + rn' \in M'$

### Example
* Suppose $R$ is a ring, then $R$ is itself an $R$-module
  * where $r\cdot r' = rr'$
* The $R$-submodules are the **left** ideals of $R$

### Example
* For any ring $R$ we get a module $R^n=\{(r_1,..,r_n) : r_i \in R\}$
  * $r\cdot (r_1,..,r_n) = (rr_1,..,rr_n)$ component wise multi
* This is called the free $R$-module of rank $n$
* it contains some obvious submodules:
  * $(R^n)_i = \{(0,0,..,r,0,0,...) : r \in R\}$ in $i$-th position
    * $\cong R$

### Example
* if we have a group acting on a vector space
  * then we have the vector space as a module over a group ring


