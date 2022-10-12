---
layout: post
title:  "Subst Lemma in categorical structure, but only CCC"
date:   2022-06-17 00:56:11 -0400
categories: CatSemantic
---

Reference : 
1. Category of Container, Thesis (Mainly First Three Chapters for internal language)
2. Andrew Pitt's Categorical Logic https://www.cl.cam.ac.uk/~amp12/papers/catl/catl.pdf


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

We can introduce equation between terms, and then the internal language can become a *theory*.

The internal language of CCC is STLC, the reader can check P15 of Reference 1, P10 of Reference 2 for most details.

(Though I think there is no deduction structure inside the internal language in P15 of Reference 1, so the Theorem 2.1.4 is either too trivial to prove (holds by definition) or not enough structure to prove (because there is no extra typing/derivation rules in P17 of Reference 1)) 

(Similar things happen in Reference 2, 

**thus I think internal language doesn't stand alone (doesn't have derivation rules by itself)**, 

but as an alternative formal language to do cat, and thus all the derivation rules come from the category theory themselves)

Despite these weird parts, we know how internal language is basically interpreted, *category of context*, i.e. 
1. contexts are interpreted by objects of the cat, 
2. terms are interpreted arrows. 
3. We can even have substitution and equation. 
4. Equations are interpreted as the same morphism inside the target category


The syntax side, we still use QIIT-introduced syntax, where `x : (Tm Γ A)` stands for `Γ ⊢ x : A`, and etc. 

# Setup : Categorical Structure and the Internal Language

For example, we can interpret product type using product object, 
```haskell
_,_ : {∀G} (a : Tm G A) → (b : Tm G B) → Tm G (A × B)
π₁ : Tm G (A × B) → Tm G A
π₂ : Tm G (A × B) → Tm G B
  where π₁ (a, b) = a ; π₂ (a, b) = b -- beta 
  where (π₁ t, π₂ t) = t -- eta
```
Interestingly, this is corresponding to the universal property of product type `A × B`!
```C
For arbitrary G, with a : G → A and b : G → B, 
we have a *unique* <a, b> : G → A × B // this is corresponding to Line 1
s.t. π₁ ∘ <a, b> = a, π₂ ∘ <a, b> = b
```
The only suspicious part is the uniqueness, which will be corresponded by the eta rule.

Looking closely, we have this because term are directly morphisms in cat, and eta rule represented uniqueness property.

Sum type will also be interesting, because it has an eta rule usually not presented in type theory.

What about exponential?

What about equalizer? 

What about limit?

What about (left) adjoint?

<!--  Show 
      in CCC how product is left adjoint to exponential -->

# Substitution Lemma on Term, but categorically

<!--
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
 
Say, `a : Tm Γ A` and `b : Tm Γ B`, given `γ : Tms Δ Γ`,
we have subst lemma `(a,b)[γ] ≡ (a[γ], b[γ])`

Weirdly, there should be a general way to describe this substitution lemma... since currently for QIIT, every type construct we need to write a subst lemma by intuition. Why don't we have a general characterization?

Looks closely, `(a,b)[γ] ≡ (a[γ], b[γ])` is just a commutative diagram
for ` (_[γ]) ∘ (_, _) ≡ (_[γ], _[γ])`:
```C
    Hom(Y, A) × Hom(Y, B) --- > Hom(Y, A × B)
              |                         |
    Hom(X, A) × Hom(X, B) --- > Hom(X, A × B)
```
Weirdly, this diagram should already holds, because hom functor preserve limit... Why do we still need to specify the naturality condition/subst lemma? What happens? 

**Because in QIIT formulation, (a,b) : A × B is not the only constructor! t[γ] : A × B is also a constructor, without stating the subst lemma, that breaks the universal property**

```haskell
_[_] : Tms Γ Δ → Tm Δ A → Tm Γ A


```

What's more, we should have similar stuff for `(inl a)[γ] ≡ inl a[γ]`
or `(_[γ]) ∘ (inl _) ≡ (inl _) ∘`
```C
    Hom(Y, A)  --- > Hom(Y, A + B)
         |                  |    
    Hom(X, A)  --- > Hom(X, A + B)
```
It also seems like some naturality condition, especially 

***

The following needs references on 
1. Revisiting the categorical interpretation of dependent type theory [Curien et al]
2. https://math.andrej.com/2012/09/28/substitution-is-pullback/
# Substitution Lemma on Type, categorically
This part will need some fibrations.

Substitution functor is a pullback functor ... but why the substitution functor above is not? Reference 2 pointed out, substitution on term is composition and substitution on 

Pullback functor is an adjoint.

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

***
# CCC functor preserves ... internal language?
## CCC functor
Cited from [nlab](https://ncatlab.org/nlab/show/cartesian+closed+functor):

A cartesian closed functor is a functor F:𝒞 → 𝒟 between cartesian closed categories which preserves both products and exponential objects/internal homs (all the structure of cartesian closed categories).


### More details?
#### [Product Preserving functor](https://ncatlab.org/nlab/show/product-preserving+functor) 
* When functor F preserves product, it means F(A × B) is the product of F(A) and F(B) witnessed by F(π₁) and F(π₂)
  * i.e. F(A × B) ≅ F(A) × F(B)  
#### Exponential Preserving Functor
Recall exponential 
Similarly, that would be
* When functor F preserves exponential, it means F(A → B) ≅ F(A) → F(B) 

#### Then this preserving functor is not strict! i.e. F(A × B) != F(A) × F(B) but only isomorphic

but still if u ≡ v, then F(u) ≡ F(v) because same morhphism is mapped to the same morphism by a functor; 
but to be honest, F(u) ≡ F(v) is very misleading. because F(u), syntactically, internal language speaking, should be just u in the internal language. So it should be something like C ⊧ u = v, then F(C) ⊧ u = v. 

# Appendix: Left adjoint preserve colimit and right adjoint preserve limit
