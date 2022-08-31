---
layout: post
title:  "Review of Compiler Correctness, 1"
date:   2022-08-04 00:56:11 -0400
categories: PL
---

Here we review compiler correctness, the ultimate target is to understand

Hur, Chung-Kil, and Derek Dreyer. "A Kripke logical relation between ML and assembly." Proceedings of the 38th annual ACM SIGPLAN-SIGACT symposium on Principles of programming languages. 2011.

***

# Summary
1. Compiler Correctness is about cross-language Logical Relation, so that we can specify two pieces of code equivalent 

# Question
1. What is special about Lang-Generic Specification? It doesn't seem very Lang-Generic (See how that System F is easily implemented, does that mean System F is a generic language? )
   1. Section 5 has this "Implementation of LOW inside this spec" or "Low-Level Representations of High-Level Constructs", how did they make sure this implementation is correct?
   2. Why not use Low-Level Language itself as specification
   3. What is actually the definition of compile correctness?
2. WHat is "compositional" about that? Compared to whole program compilation


***

# Summary


# Question

1. What is the difference between two logical approximation?
2. What is biothogonal used for?
3. WHy it is relating   