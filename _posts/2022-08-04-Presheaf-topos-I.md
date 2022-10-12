---
layout: post
title:  "Presheaf topos, I, is a topos"
date:   2022-08-04 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

The motivation of this whole series is to understand how to use topos to reason about programming language, for example , if topos can be used as another program logic, or Sterling's STC, and etc. Thus we will focus on the lingustic/programming language side of topos to get intuition.

***

Intuitively speaking, for type theorists, topos are "those models that can interpret language expressing proposition (i.e. a type `Prop`)". 
This concept is very verstile as there are some topos whose truth are weird -- for example (Hofman 99)[https://ieeexplore.ieee.org/document/782616] come up with a topos that doesn't admit *principle of unique choice*, which is quite common in constructive logic and of course with a computational interpretation.
```haskell
PUC = ∀ A B (R : A → B → Prop). 
        (∀ a : A ∃!b : B. R(a, b)) →
        ∃ (f : A → B), 
            ∀a : A, R(a, f(a))
```

We decide to start with presheaf topos, because it is more concrete and with more intensional information, and has been proven useful in our NbE.


To be a powerful logic, Elementary Topos is enough, but Grothendieck topos is a stricter concept than Elementary topos but enjoy better property.

Thus we introduce the concept of Grothendieck topos, in the style of 
Anel, Mathieu, and André Joyal. "Topo-logie." New Spaces in Mathematics: Formal and Conceptual Reflections 1 (2021): 155-257.
but we will refer to Sterling's thesis because it is more direct for type theorists. This style of definition doesn't require too much mathematical/geometrical background, but only abstract nonsense. 

Then we analyze the basic structure of topos and figure out what each part of the structure means in presheaf topos, to get the intuition of two definition.

Finally, we need to distinguish the elementary topos and grothendieck topos, to better understand both, but in a way type theorists are interested.

In type theory, the most basic topos we work on must be presheaf topos, so we will focus on that to get a feeling of working with arbitrary topos. 

# Definition of Presheaf Category
Cited from [here](https://ncatlab.org/nlab/show/category+of+presheaves):

For `C` a small category, its category of presheaves is the functor category `PSh(C):= Hom [C^op,Set]` from the opposite category of C to Set.


# Definition of Elememntary topos


## Logical Functor
In nLab,
> A logical morphism or logical functor is a homomorphism between elementary toposes that preserves the structure of a topos as a context for logic: a functor which preserves all the elementary topos structure, including in particular power objects, but not necessarily any infinitary structure (such as present additionally in a sheaf topos).

We will next time 


## Presheaf Topos is an Elementary topos



## What each definition mean, concretely?
<!-- talk about the meaning of each definition
    in presheaf topos and in 
 -->



## How Ω stands for a Proposition anyway?

<!-- we need to show some examples here
      how each proposition is interpreted using topos
    for example, 
 -->

*** 
# Definition of Grothendieck topos, starting from Logos


## Geometric Morphism
Cited from [Olivia's Lecture note](https://www.oliviacaramello.com/Teaching/CambridgeToposTheoryCourseLectures9and10.pdf)
> The natural, topologically motivated, notion of morphism of
Grothendieck toposes is that of geometric morphism. The natural
notion of morphism of geometric morphisms if that of geometric
transformation.



## Presheaf Topos is Grothendieck topos



## What each definition mean, concretely?
<!-- talk about the meaning of each definition
    in presheaf topos and in 
 -->
***

Apparently, a grothendieck topos is already an elementary topos, so what is there difference?
## Differences Between Elementary Topos and Grothendieck one




