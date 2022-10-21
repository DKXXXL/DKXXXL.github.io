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


# Definition of [Elememntary topos](https://ncatlab.org/nlab/show/topos#ElementaryTopos)
an elementary topos is a category which

1. has finite limits,

2. is cartesian closed, and

3. has a subobject classifier.

Note, elementary topos has [all finite colimit](https://math.stackexchange.com/questions/1374500/topos-have-colimits) 

### [Subobject Classifier](https://ncatlab.org/nlab/show/subobject+classifier)
Subobject Classifier can be considered as taking arbitrary "subset" relation into an arrow into Ω. We will not repeat definition, but remember a monomorphism `U → X` will induce a pullback and a "characteristic function" `χ : X → Ω`.

This pullback means that the "characteristic function" decides this monomorphism uniquely as well.

[The example in Set Theory](https://ncatlab.org/nlab/show/subobject+classifier#in_) makes things easier to remeber---basically for arbitrary subset we will have a unique "characteristic function", and one-to-one correspondence (i.e. the characteristic function decides the subset as well).


Though using internal language of topos, there is still problem : why this universal property special? Can't we just think of monomorphism (classes) as subset relationship? In other words, why the "characteristic function" so special?



### What is Power Object
Alternatively, an elementary topos can also be defined as 
1. has finite limits,
2. has power objects

We care about power objects because it may provide "∈" notation. Power object `PA` (or written as `Ω^A` is intuitively the power set of `A`), 

The [universal property](https://ncatlab.org/nlab/show/power+object) is saying that, arbitrary relation `r` of `c × d`, 
is one to one corresponding to `χ : d → Ω^c`, in other words,

intuitively and set theory speaking, any relation `r` can make into a function `χ : d → P(c)` where `χ(y) = \{c : (c,y) ∈ r\}`

Apparently, the `∈` is really the `in` relation.

## Logical Functor
In nLab,
> A logical morphism or logical functor is a homomorphism between elementary toposes that preserves the structure of a topos as a context for logic: a functor which preserves all the elementary topos structure, including in particular power objects, but not necessarily any infinitary structure (such as present additionally in a sheaf topos).




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
We follow the definition of Sterling's Thesis, which is also [Giraud's axiomatic characterization](https://ncatlab.org/nlab/show/Grothendieck+topos#Giraud)


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



***

# Sites, Sheaves, and Topos

* The problem here is that, with the intuition of locale vs. frame, we still cannot capature the the intution of topos vs. logos., even though Sterling suggests that way
* Because the first example, punctual topos, has logos as set category, we cannot see what is that, geometrically
* because locale/topological space can be intuitively understood as R^3 or some euclidean space, but geometric intuition here for punctual is not enough
* So some more geometric intuition for each topos is necessary

But to understand that, we 

