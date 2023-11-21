---
layout: post
title:  "STC : Program with Type Refinement"
date:   2023-11-11 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

Ref:
(JS1) https://www.jonmsterling.com/papers/sterling-2022-naive.pdf

(JS2) https://www.cs.cmu.edu/~rwh/students/sterling.pdf

(JS3) https://arxiv.org/abs/1809.08646

(JS4) https://arxiv.org/abs/2010.08599 

(JS5) https://arxiv.org/pdf/2307.09497.pdf

(JS6) https://www.jonmsterling.com/papers/sterling-2022-naive.pdf

***

We want to achieve more contextual equivalence here.


# About Programming with Type Refinement


## With List
```Haskell
Module AboutList where 
// Assume we have a list type, already glued
  list : P.ty → P.ty
  cons : tm(A) → tm(list A) → tm(list A)
  nil : tm(list A)
  reclist : 


``` ̸

# More About Representation Independence/Realization

We have shown representation independence, or equivalence of two implementation.

But is it possible that, we describe the specification in the meta-space, 
and directly implement it using church encoding + sigma type?

Basically last section is about implementation spec according to function, this 
section is about implement data type according to function

## Implement List
