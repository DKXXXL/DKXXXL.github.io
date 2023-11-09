---
layout: post
title:  "Review JS's STC's Parametricity"
date:   2023-11-03 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

We type-set JS's STC and its application on proving a binary logic relation of STLC

Ref:
(JS1) https://www.jonmsterling.com/papers/sterling-2022-naive.pdf

(JS2) https://www.cs.cmu.edu/~rwh/students/sterling.pdf

(JS3) https://arxiv.org/abs/1809.08646

(JS4) https://arxiv.org/abs/2010.08599 

***

(JS4, Example 1.2) has pointed out how to achieve  *Binary logical relations on closed term*. 
(JS4, Computation 5.29) reminances that. 

0. But what is binary logical relation on open term? 
1. (JS4, Chapter 4) uses 🔒ₛ/ₗ and 🔒ₛ/ᵣ ; (JS4, Computation 5.29) says we have two syntax piece
   1. why is that? I thought artin gluing only has one syntax piece. Why can we have two?  

***
1. copower is easily defined, but we need to figure out the semantic of 𝕊. 