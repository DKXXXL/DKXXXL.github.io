---
layout: post
title:  "Intro to Algebra, Lec 1"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Lec 15

## Use Class Equation to study group structure
### 
* $N \trianglelefteq G$
* Then $G$ acts on $N$ by conjugation
* $g : n \mapsto g \cdot n = g n g^{-1} \in N$
***
* $H < G$, $N_G(H)$ acts on $H$
* so there is a homomorphism $\psi : N_G(H) \rightarrow Aut(H) := g \mapsto conjugation by g$
  * $\ker(\psi) = C_G(H) =$ centrualizer $=\{g \in G: gh=hg \}$
***
* First isomorphism theorem:
  * exists isomorphism $N_G(H) / C_G(H) \rightarrow Aut(H)$ (actually $img(\psi)$), so here it is not necessarily onto
    * all the inner automorphism
***
From Oliver Chiriac to Everyone:  04:30 PM
The map psi is essentially partitioning H into its conjugacy classes
The kernel is the centralizer, which partitions H into singular elements (because it commutes with H so conjugation takes the element back to itself)
when you do Normalizer/centralizer, you are like removing the elements that get sent back to themselves
***
* Examples of automorphism
* $G = \ints / p \ints$, p prime
  * $G$ is cyclice, addtion mod p
  * then any automorphism of $G$ is determined by what it does to a generator, 
    * say 1 (not identity)
    * then $\phi(k) = \phi(1^s) = \phi(1) + \phi(1) ...$
  * So $Aut(G) = Aut(\ints / pZ) \cong (\ints /p \ints)^\times$, really a group isomorphism because the ocmposition corresponds modular multplication
  * $Aut(Z/n\ints) = (Z / nZ)^\times$ (relatively prime to $n$)
* Automorphism example
  * 2. Finite dimension vector space over $F_P = Z/pZ$
    * $V = F_P^n$ = n-tuples of elements of $F_P$
    * $Aut(V)$ = maps $V$ to $V$ that preserves addition
      * $=GL(n, F_P) is invetible $n \times n$ matrices
      * acting by matrix multplication
      * thinking of $V$ as column vector
***
### Definition
* Suppose $p$ a prime, A group $P$ whose
  * order is a power of $p$, $|P| = p^a$
  * some $a \in \nats$
    * is called a p-group
    * e.g. $Z/pZ$
      * $|V| = |F_P^n| = p^n$
    * cyclic group of order $p^a$ 
    * directed product of these (some p)

### Definition
* Suppose $G$ is a finite group
  * $|G| = p^am$
    * where $gcd(m,p) = 1$ (i.e. $p \not | m$)
  * A subgroup of $G$, $P$ whose order is $|P| = p^a$ is called $p$-Sylow subgroup
    * or Sylow $p$-subgroup
    * largest possible $p$-subgroup of $G$
***
* $S_3$, $<\rho>$ is a 3-Sylow subgroup
  * $<\sigma>$ is a 2-Sylow subgroup
  * $<(13)>$, $<(23)>$ are both 2-Sylow subgroups
    * they are all conjugate
***
### Theorem: Sylow's Theorem
* With $|G| = p^am, p \not | m$
  * there is a $p$-sylow subgroup
    * not obvious, only obvious for the Cauchy Theorem part (when a = 1)
  * For fixed $p$, the p-Sylow subgroups are all conjugate to each other
    * basically $P_1 = gP_2g^{-1}$
    * mostly conjugate a single element to a group always give you a group (trivial)
  * For fixed $p$, the number of p-Sylow subgroup, $n_p(G) = n_p \cong 1 (\mod p)$
    * Also, $n_p(P) | \frac{|G|}{|N_G(P)|}$ if $P$ is a p-Sylow subgroup
* Very powerful for classifying groups of a given order

***
