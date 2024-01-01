---
layout: post
title:  "Reviewing Limit/Colimit"
date:   2023-12-23 00:56:11 -0400
categories: Cat-Theory
---

Ref 
1. https://arxiv.org/abs/1612.09375
2. https://ncatlab.org/nlab/show/free+cocompletion
3. 

# Definitions/Setup

1. *(Diagram)* A functor `D : I → 𝒜` is called a diagram in `𝒜` of shape `I`
   1. so the codomain of a diagram is fixed
   2. so why not just say the set of objects and morphisms `D(I)`? maybe because it is weird to say so
2. *(Cone)* Given a diagram `D : I → 𝒜`, a cone on `D` is
   1. an object `A ∈ 𝒜` together with a set of morphisms `{fᵢ : A → D i | i ∈ I}`
   2. s.t. for each morphism `u : U → V  ∈ I`, `D u ∘ fᵤ = fᵥ` 
      1. (basically the set of morphisms commutes with the arrows in `D`)
3. *(Limit)* 


***

1. A category with all product and all equalizers have all limit?
2. A category with all coproduct and all coequalizers have all colimit?
3. Why limit-preserving functor preserves product and equalizer?


***
The main problem we want to solve is about the following several statement
1. freely adjoining all limit/colimit? (free cocompletion)
2. freely generated lambda theory from a graph? 
3. What is meta-signature
4. What is "colimits commute with finite limits"? (https://arxiv.org/pdf/2010.08599.pdf P29)
5. what is a theory of functor? (https://www.cs.cmu.edu/~rwh/students/sterling.pdf §2.3.1∗7)
   1. It is a shorthand. It actually refers to `̂𝒞` classifies 
      1. the geometric theory with the models as the flat functors out of `𝒞`
      2. the weirdest part here is that, `𝒞` should already be the classifying category. 
      3. Why we care about classifying topos?
   2. A similar statement can be found in 
      1. Handbook of Categorical Algebra: Volume 3, §4.2
