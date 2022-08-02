---
layout: post
title:  "Notes on CBPV"
date:   2022-07-09 00:56:11 -0400
categories: Type-Theory
---
This note is mainly trying to solve the following questions
1. What is the motivation of CsBPV?
2. Why there is a computation class of types?
3. Why all positive types located in value but negative types located in computation?
4. How to add new type construct? Do I just add positive type into value and negative type into computation? Why will it work? Do I have all the η rules magically? Especially when there is effect?
5. How to add new effect?
6. What is this adjunction between $F$ and $U$ mean?

Among them, 4 and 5 are most important. I don't think this note can really solve any of the above questions completely. I can only give some intuitions about them

***
## Motivation
I think the motivation is mainly for $\eta$-rules, i.e. the equational rule for the observational equality. 


Concretely speaking, we assume we have a boolean type $tt, ff : \mathbb{B}$. 

After formulate the concept of context $\mathcal{C}[]$, 
we say $t_1 ≅ t_2$ if $\mathcal{C}[t_1] = \mathcal{C}[t_2] : \mathbb{B}$. This ≅ is the main equation we want to investigate, including the η-rules about it.
### CBV, CBN both lack all $\eta$-rules
<!-- Talk about how CBV and CBN lack η rule for function (negative) type and sum (positive) type respectively -->

### CBPV has these η rules 
<!-- Indicate the motivation(intuition) why CBPV has these two eta rules -->
<!-- For function type, we want a value of function only be applicable, thus we need thunk and computation type -->

## Polarity and Derive η rules

### Definition of Polarity (Positive vs. Negative)
<!-- Indicate how positive negative type looks like in type theory, categorically and programming language -->
<!-- What is the categorical object for positive product? -->

### Derive η rules
<!-- Derive eta-rule for them, purely from type theory, and extend to programming language  -->

## Question 4
??? Wait for construction


## Exemplar Effects

## Adding new effects

## Question 6
