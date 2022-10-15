---
layout: post
title:  "Presheaf topos, I, can express rich logic"
date:   2022-08-04 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

Topos has a rich internal language, which can be used to express logic. This time, we are getting familiar with this language, and concretely talk about this language in presheaf topos.

In the meantime, Yoneda might appear everywhere when relating the presheaf topos and the original category.

## Yoneda Lemma


Intuitively speaking, Yoneda can embed the original category (fully + faithfully) into the structure of topos.  

***

Last time, we already know Ω in a topos is just like the `Prop` , which stands for truth. This time, the internal logic will be heavily relying on Ω.

<!-- I think working with elementary topos here is fine. So we stick with elementary topos. -->

## Internal Language of an (Elementary) topos
Reference: 
1. [introduction to higher order categorical logic, [Lambek]](https://www.cambridge.org/ca/academic/subjects/mathematics/logic-categories-and-sets/introduction-higher-order-categorical-logic?format=PB&isbn=9780521356534)
2. https://ncatlab.org/nlab/show/Mitchell-B%C3%A9nabou+language

For arbitrary monomorphism `m : A → B`, we can have `χm : B → Ω` as charactrization arrow 

On Lambek, the interpretation is almost clear, we have an arrow indicating `True : 1 → Ω`, and propositions are encoded as arrows to Ω, thus a closed proposition is correct when `p : 1 → Ω` is equal to `True`, for example
1.  `a = b` is a term interpreted by  `χ〈id, id〉∘〈a, b〉` : 1 → A × A → Ω
2.  `a ∈ A` is a term
3.  
4.  for `p : G × A → Ω`, we have `(∀ p) : G → ` 
The usual universal and existential quantifiers are the right and left adjoints, respectively, of "adding a dummy variable"(weakening)(From https://math.stackexchange.com/questions/467640/categorical-interpretation-of-quantification/467693#467693) 
1. ``


What's more,  in [MB Language](https://ncatlab.org/nlab/show/Mitchell-B%C3%A9nabou+language), the formulas are terms of type Ω, where Ω is the subobject classifier; but in type theory, formulas are types of type `Prop`, what happened?
(We need to find out how dependent type theory is relsated to topos.)
### What's the difference using Identity Type and Identity Interpretation in Omega?


## What is the difference between extensional dependent type theory and constructive higher order logic?

We know extensional dependent types is the internal language for LCCC, constructive higher order logic is the internal language of elementary topos. 

One insight is that, in Cat-Logic-0, we know 

## How Logical Functor Preserve logical structure, Linguistically

## Geometric Logic


## How Geometric Morphism Preserve geometric structure (geometric logic), Linguistically

***

We know the following fact
1. Yoneda Embedding is fully-faithful
2. Hom(-, -) is a very good functor
3. fully faithful functor [reflects limit and colimit](https://ncatlab.org/nlab/show/full+and+faithful+functor)
4. Presheaf Topos has internal logic inside
  
### What does 3 mean? Detailedly?

Quesion: can we embed CCC into PSh(CCC) and starts doing reasoning about CCC?



If this is too trivial, (since there is no abstraction/polymorphism inside CCC), can we do something similar to some predicative polymorphic lambda calculus?

For example, can we prove some equivalence argument (in System F that would be), like church encoding of boolean is "the same" as boolean?

***

References for below: 
1. http://mathieu.anel.free.fr/mat/80514-814/Awodey-Bauer-catlog(2019).pdf

# Classifying Theory

# Classifying Topos

