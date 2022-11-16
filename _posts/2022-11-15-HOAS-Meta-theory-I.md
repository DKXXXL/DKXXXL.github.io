---
layout: post
title:  "Review HOAS for meta-theory reasoning, I 🚧"
date:   2022-08-05 00:56:11 -0400
categories: Type-Theory
---

# 🚧

Reference: 
Hofmann, Martin. "Semantical analysis of higher-order abstract syntax." Proceedings. 14th Symposium on Logic in Computer Science (Cat. No. PR00158). IEEE, 1999.

Hu, Jason ZS, Brigitte Pientka, and Ulrich Schöpp. "A Category Theoretic View of Contextual Types: from Simple Types to Dependent Types." arXiv preprint arXiv:2206.02831 (2022).

Despeyroux, Joëlle, Amy Felty, and André Hirschowitz. "Higher-order abstract syntax in Coq." International Conference on Typed Lambda Calculi and Applications. Springer, Berlin, Heidelberg, 1995.

*** 

# Intro

Hofmann specifies the semantic of HOAS, which lives in the presheaf model. Our post is to review it with the following problems as the motivation:
1. We know the syntax of λ-calculus in LF/HOAS, but what are the elimination rules?
2. Can we describe an elimination/model using the syntax of LF/HOAS? Because it is so lame to use HOAS to speicfy the syntax, then uses debruijn indices/(the corresponding CCC from HOAS) to specify the model --- because then we go back to substitution calculus
3. If we describe the elimination/model using the syntax of LF/HOAS, does it mean we have to interpret this syntax inside the presheaf as well?

So we will not cover any of the paper completely but using our own pace and the paper as reference only 

## LF syntax for λ-calculus
We use Sterling's Naive STC's formulation
```Agda

```

## How do we interpret this syntax/signature?
What is the generated category? It should be a cartesian closed category, right?


## What is the elimination rule?
The elimination rule should be directly corresponding to the universal property of CCC, right?

## Can we write elimination/model in HOAS?
