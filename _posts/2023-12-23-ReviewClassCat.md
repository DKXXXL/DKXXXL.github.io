---
layout: post
title:  "Reviewing Classifying Category"
date:   2023-12-23 00:56:11 -0400
categories: Type-Theory
---

Ref
1. http://mathieu.anel.free.fr/mat/80514-814/Awodey-Bauer-catlog%282019%29.pdf
2. https://www.cl.cam.ac.uk/~amp12/papers/catl/catl.pdf
3. https://people.mpi-sws.org/~dreyer/courses/catlogic/jacobs.pdf
4. Classifying Topos:
   1. https://www.cs.cmu.edu/~rwh/students/sterling.pdf
   2. https://ncatlab.org/nlab/show/classifying+topos
   3. https://ncatlab.org/nlab/show/classifying+topos+for+the+theory+of+objects
5. https://arxiv.org/pdf/2302.05190.pdf
6. https://eprints.illc.uva.nl/id/eprint/2195/1/DS-2021-09.text.pdf 
7. https://ncatlab.org/nlab/show/classifying+topos#background_on_the_theory_of_theories 
***
We finish (Ref 1,2&3) sections about Classifying Category, theory-model correspondence, and Lawvere Modality

Then understand classifying topos in (Ref 4)s,
and understand (Ref5, Prop 6)

Finally we start to read Uemura (Ref 6)
***
# Classifying Category
1. We have concept of model in a category. This model is conventional concept of model in logic. For example, for algebraic theory, for `I ∈ 𝒞` , `⟦ f ⟧ : I^k → I` an arrow. and we denote `I ⊧ u = v` using the above interpretation. In this case, we say `I` is an model in `𝒞`
   1. `Mod(𝕋, 𝒞)` indicates the category of models in 𝒞, with model homomorphism satisfying naturality (Ref 1) 
2. Classifying Category is basically the syntactic category 
3. But the definition of classifying category `𝒞_T` is usually
   1. models `ℳ ∈ Mod(𝕋, 𝒞) ` are isomorphic to the functors `M : 𝒞_T → 𝒞`, 
   2. together with a universal model `U ∈ 𝒞_T` s.t. `M(U) = ℳ`
      1. in other words, every model corresponds to a (structure preserving) functor from `𝒞_T` under a fixed universal model
   3. In our example of algebraic theory (Ref 1), the universal model is just a single object `[x1]` (Ref 1, P16), 
      1. because in the conventional logical interpretation, we use `I = U ⊧ ...` a single object to do interpretation
   4. this means model morphisms are natural transformations 
4. We will achieve soundness + completeness when giving classifying category (Ref 1, §1.1.4) 


**Relation to Theory-Model Correspondence**

A stronger notion than Classifying Category is theory-model correspondence, which gives a proper idea of internal language.


# Signature in Fibration (ref 2)

# Logical Duality

Note : (Ref 1, §1.2.1) is very vague about free-generated model, and thus a bit hard to read. We can directly start from §1.2.2, which might be easier to read.

# Finite Limit Theory and GAT

Ref 7 has talked about classes of theories and their classes of models, where it claims finite limit theory

(Π A B)[σ] = Π A[σ] B[σ↑] 
