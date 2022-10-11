---
layout: post
title:  "Subst Lemma in categorical structure, but only CCC"
date:   2022-06-17 00:56:11 -0400
categories: CatSemantic
---

Reference : 
1. Category of Container, Thesis (Mainly First Three Chapters for internal language)


Our exploration will focus on the relationship of linguistic aspect of categorical semantic and type theory. 

In other words, those internal language of categorical structure.

Or in another other words, establish linguistic intuition for categorical structure. As this is the only formalizable way for mundane type theorists.
<!-- 
the story this time is mainly about
  limit/colimit, adjoint, continuous/cocontinuous
  substitution functor
 -->
# Recall : Carteisan Closed Category
A category 
1. has a terminal object
2. with finite products (given arbitrary two objects)
3. with exponential object (given arbitrary two objects)


# Setting up : Internal Language (in STLC form)
We can setup the language of STLC and we can interpret each part into a CCC.

We can introduce equation between terms

The internal language of CCC is when we use Check P15 of Reference 1



# Setting up : Linguistic Understanding of Categorical Structure


# Substitution Lemma, but categorically



<!-- Show 
      in CCC how product is left adjoint to exponential
    Show why substitution can preserve in product, i.e.
    (a, b)[τ] ≡ (a[τ], b[τ])
    in categorical sense/meaning

    This is exactly τ : X → Y, with
    Hom(Y, A) × Hom(Y, B) ------ > Hom(Y, A × B)
              |                         |
    Hom(X, A) × Hom(X, B) ------ > Hom(X, A × B)

    Weirdly, this should already holds, because hom functor preserve limit
    ... thus why do we need to postulate it in the  
 -->


<!--
  A lot of categorical structure is limit and colimit
  for example product and coproduct

  Recall (co)continuous preserves (co)limit
  and show how this kind of functor can preserve product and coproduct
  i.e. 
  makes the connection between (a, b)[τ] ≡ (a[τ], b[τ]) and this continuity
    of substitution functor concrete

  Note  Right Adjoint preserves limit
  left adjoint preserves colimit
  show substitution functor has both left and right adjoint
    as dependent function and depednent pair
  
  The categorical meaning of 
  (A × B)[τ] ≡ A[τ] × B[τ]

  (∏ A B)[τ] ≡ ∏ A[τ] B[τ↑]

  Because depednet function has this τ↑, substutition functor is 
  not really "preserving" the structure, can we still make depednent product
    a limit in certain category and then substitution is still functor
      and thus preserve that limit?
  
  (∏ A B)[τ] ≡ ∏ A[τ] B[τ↑] this stuff seem beck-chevalley condition
 -->



 <!-- 
  Show how depednent product is constructed in CwF using internal language
  basically review 
  https://www.cs.le.ac.uk/people/ma139/docs/thesis.pdf
    (Category of Containers)
  
  Show how Fibration is coming to the picture
  the equivalence between fibration, indexed category, and Cwf(?)
  -->

# Appendix: Left adjoint preserve colimit and right adjoint preserve limit