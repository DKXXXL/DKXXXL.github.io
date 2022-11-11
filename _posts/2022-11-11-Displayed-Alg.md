---
layout: post
title:  "More Categorical Construct for Type Theory"
date:   2022-07-16 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

This post is to figure out 
1. indexed cat
2. fibration 
3. displayed cat
Theory of signature, including
4. displayed algebra
5. section of displayed algebra
6. family of presheaf

We list out there references:

**indexed cat and fibration** :
* [Catgeory of Containers](https://www.cs.le.ac.uk/people/ma139/docs/thesis.pdf)  Chapter 3 Thesis by Michael Gordon Abbott
 *  This is too category thereotic and I cannot yet find their advantage

**displayed cat**
* [Original Paper](https://arxiv.org/abs/1705.04296) by Benedikt Ahrens, Peter LeFanu Lumsdaine
* nlab : https://ncatlab.org/nlab/show/displayed+category 

**signature, displayed algebra, its section**
* [Constructing quotient inductive-inductive types](https://dl.acm.org/doi/10.1145/3290315) by Ambrus Kaposi, András Kovács,Thorsten Altenkirch


**Family of Presheaf** 
* Kaposi, Ambrus. Type theory in a type theory with quotient inductive types. Diss. University of Nottingham, 2017. 
  * Section 5.2.2
* Hofmann, Martin. "Syntax and semantics of dependent types." Extensional Constructs in Intensional Type Theory. Springer, London, 1997. 13-54.
  * Section 4.1

***
# Indexed Cat and Fibration
They are talked about in the earlier post 

# Displayed Cat

# Signature, Displayed Algebra, its section

## Theory of Signature
* "Constructing quotient inductive-inductive types" introduces the concept of theory of signature
* the theory of signature is an internal type theory (i.e. a type theory defined in an ambient type theory)

The motivation of introducing theory of signature is that,
* once we admit the theory of signature as a concrete QIIT type, then we can have all finite QIIT type
  * Just like once we have W-type, we have (can encode) all inductive type
* The trick is to use theory of signature to encode all kinds of signatures, and mapping signature to appropriate type for notions of algebra, algebra morphism and etc
* A concrete example is at Section 1.1, if we want equation inside signature, Section 1.2 is sufficient

## Displayed Algebra, and its section


## Family of Presheaf 
Family of presheaf is just a presheaf over 
https://types.pl/@endexl/109327370483620195