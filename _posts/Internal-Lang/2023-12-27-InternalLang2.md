---
layout: post
title:  "Review Internal Language, II"
date:   2023-12-21 00:56:11 -0400
categories: Type-Theory
---

Ref
1. Introduction to Higher Order Categorical Logic
2. [Relative Induction for TT](https://arxiv.org/pdf/2102.11649.pdf) 
3. [Sheaves_in_Geometry_and_Logic](http://atondwal.org/Sheaves_in_Geometry_and_Logic__MacLane_Moerdijk.pdf)
4. https://ncatlab.org/nlab/show/Mitchell-B%C3%A9nabou+language
5. https://ncatlab.org/nlab/show/subobject+classifier 
6. http://mathieu.anel.free.fr/mat/80514-814/Awodey-Bauer-catlog(2019).pdf 
7. Revisiting the categorical interpretation of dependent type theory https://www.sciencedirect.com/science/article/pii/S0304397514001789
8. Locally cartesian closed categories and type theory https://www.math.mcgill.ca/rags/LCCC/LCCC.pdf

 
***
Aims:
1. Starting from (Ref 1, Part 2, starting §5)
2. Understanding the language Multi-Modal Type Theory for working, especially (Ref 2) and its appendix

***
We do (Ref 1), but we use MB Language as Internal Language
# Review MB-Language
(Ref 3, §VI.5)
Most type-theoretic structure is there, that means morphisms and dependent product and stuff is already there, i.e. term and type interpretation is there.

## Formula Interpretation

We interpret formula `Γ ⊢ ϕ` by either a subobject of `⟦ Γ ⟧` or `⟦ Γ ⟧ → Ω`. 
They are equivalent due to the property of Ω.
By (Ref 3, Pg 299) and (Ref5, Prop 4.3), we have `Sub(⟦ Γ ⟧)` as an heyting algebra and `Ω` as an internal heyting algebra.

For example, the former means that we have `∧ : Sub(⟦ Γ ⟧) × Sub(⟦ Γ ⟧) → Sub(⟦ Γ ⟧)` (Ref 3, §IV.6, Prop 3), which gives us a natural `Hom(X, Ω × Ω) → Hom(X, Ω)` natural at X (Ref5, Prop 4.3), then by Yoneda, we have a morphism `Hom(Ω × Ω, Ω)`.

Note that, according to (Ref 3, Pg299), the `∨` is not so trivial.

## "≤"

We also introduce another judgement `Γ ⊢ ϕ ≤ ψ` indicating somewhat implication of two formula. (not a formula itself but a judgement, the implication is introduced in (Ref 5, Prop 4.4)). This ≤ is interpreted in (Ref 6, Pg 50)

## Validity
[This](https://ncatlab.org/nlab/show/Kripke-Joyal+semantics) and (Ref3, P301, P303) has told us:


*A Valid formula* `a : Γ → Ω` is valid when the corresponding subobject is actually `Γ` itself.

We can show `a : Γ → Ω` is valid iff `a = true ∘ 1 : Γ → 1 → Ω` (via pullback)


*Generalized Element Satisfaction* : a generalized element `a : Γ → X` satisfies `ϕ : X → Ω` if `a` factors through the corresponding subobject.

We can show that generalized element `a : Γ → X` satisfies `ϕ : X → Ω` iff `ϕ ∘ a` is a valid formula. (via pullback)

***

We use `≡` to indicate arrow equality

## Two Equality Definitions
Both are proof irrelevant equality. The latter is also called extensional equality, as a (dependent) type. 
They have the same categorical structure: 



`Δ : Γ, X ↪ Γ, X × X` is a mono because it has a left inverse.

Given two terms on Γ, `a, b : Γ → Γ, X × X`, along which we pullback `Δ : Γ, X ↪ Γ, X × X`, and get a dependent type on `Γ`.
This fibre product has a mono `⟨ a, b ⟩ × Δ ↪ Γ` because Δ is a mono. 


### Proof Irrelevant Equality
In (Ref 3, Pg 298), for arbitrary two terms `a, b : Γ → X`, `a = b := δₓ ∘ ⟨a, b⟩ : Γ → X × X → Ω`, where δₓ is the usual l characteristic map of the diagonal `Δ : X ↪ X × X`.

We want to show `a = b` is valid iff `a ≡ b`, which is in (Ref 3, Pg 304) as well. Basically we use that pullback and unfold the definition


### Proof Irrelevant Equality Type
We want to show  we have a term/section  `t : Γ → Γ, Eq a b `, iff `a ≡ b`. This can be proved because that section `t` makes `δₓ ∘ ⟨a, b⟩ = true ∘ 1`. 

So the intro and elim rule, that is the equivalence between propositional equality and judgemental equality, has been established.

## Two Universal Quantifier

We know there are at least 4 ways to specify dependent product type
1. Nat Model https://arxiv.org/abs/1406.3219
2. QIIT/GAT/CwF https://www.cse.chalmers.se/~peterd/papers/InternalTT.pdf 
3. LCCC using adjoint functor
4. JS's LCCC framework.

We are using 3 here.

One is proof irrelevant the other is proof relevant (or dependent function type).

The two construction is also very similar : both are right adjoint to the pullback functor. 

We know, pullback will preserve monomorphism and thus we say pullback functor "preserves" monomorphism;
but what about its left, right adjoint? Do they "preserve" monomorphism? 

In other words, 
**Question** : do we automatically have the quantification in the LCCC? From the adjoint to the pullback functor?

Currently, all we can say is that, if it has a left/right adjoint, it is unique upto iso. 
So once we assume there is an adjoint to `Sub(A) → Sub(B)`, this adjoint will be coincide with `𝒞/B → 𝒞/A`.
``

Given `f : X → Y`, we have pullback functor `f* : 𝒞/Y → 𝒞/X`
We remember `∑ ⊣ f* ⊣ ∏`.
<!-- 
So, let `y ∈ 𝒞/Y` and `x ∈ 𝒞/X`,
`Hom(f* y, x) ≅ Hom(y, ∏ x)`

Now if `x` is a monomorphism in `𝒞`,  -->

**Question** : We know LCCC is a category with pullback, terminal, and each pullback functor has right adjoint. Why pullback functor has a left adjoint? (Check Ref 7)

### Universal/Existential Quantifier
It is in (Ref 3, IV.9, Thm 2, Prop 4, Pg300) -- how we have internal power of Ω

**Question** : Concretely, how is this constructed?

But we don't have to know how concretely the structure is. We only need to know adjoint exists to the pullback, 
then we can model the quantifier. (Ref 5, §2.4)

### Dependent Function
Let `π : Γ, A → Γ` as the weakening
Given `∑ ⊣ π* ⊣ ∏ : 𝒞/(Γ, A) → 𝒞/Γ`

Now `B` a dependent type over `Γ, A`, 
that is we have `⟦ B ⟧ : Γ, A, B → Γ, A`
that is `⟦ B ⟧  ∈ Hom((Γ, A, B), (Γ, A)) ⊆ 𝒞/(Γ, A)`, we have `∏ ⟦ B ⟧ ∈ 𝒞/Γ`.

So we denote, if `B` a dependent type over `Γ, A`, then we have `∏ B` a dependent type over `Γ`, where
`⟦ ∏ B ⟧ = ∏ ⟦ B ⟧`

This models the formation rule.

* (Introduction Rule/Elim Rule) We have a section `t : Γ, A → Γ, A, B`, iff we have a section `λt : Γ → Γ, ∏B`
* That is, we have `t ∈ (𝒞/(Γ, A))(1, B)` iff we have `(𝒞/Γ)(1, ∏ B)`
  * simply by the adjunction `(𝒞/Γ)(1, ∏ ⟦ B ⟧) ≅ (𝒞/(Γ, A))(π*1, ⟦ B ⟧) ≅ (𝒞/(Γ, A))(1, ⟦ B ⟧)`, and the fact that
    * right adjoint functor preserves limit (and thus terminal)
  * By the definition of LCCC, every slice category is cartesian closed, so `𝒞/Γ (X , Y) ≅ 𝒞/Γ ( 1 , Y^X)`, and here it correspnds exactly the intro/elim rule. 
    * But using this interpretation we need to restate the type interpretation for `∏`



### Dependent Sum type
∑ is modeled in (Ref 7, §9). Also according to (Ref 7, Pg5) if `∑ ⊣ f*` `∑ (h) = f ∘ h`

A simple syntax formulation for Σ type is that `Γ, X, Y ⊣⊢ Γ , Σ X Y`, but this doesn't explicitly provide intro rule
Or we makes things more uniform w.r.t. to function type, that is 
* (Introduction Rule/Elim Rule) We have sections `a : Γ → Γ, A` and `b : Γ → Γ, B[a]` iff we have a section `? : Γ → Γ, ∑ B`
* That is, for a pair `a ∈ (𝒞/Γ)(1, π)` and `b ∈ (𝒞/Γ)(1, a*⟦ B ⟧)`, iff we have a section `? ∈ (𝒞/Γ)(1, ∑ ⟦B⟧)`

<!-- TODO! -->

<!-- Σ-type doesn't have concise intro/elim rule. We need to  -->

* (Introduction Rule)
* (Elim Rule)



## Function Extensionality

# Exercises for (Ref 1, Part 2, §4)

# Exercises for (Ref 1, Part 2, §5)
We will do exercise in Ref 1, but our internal language is using MB language + internal dependent type theory. So we need to connect two different styles of internal language of topos.

* (Prop 5.1)  `∃ₓ ⊣ πₓ* ⊣ ∀ₓ : 𝒞/(Γ, X) → 𝒞/Γ`
  * Given `f ≡ g ∈ (𝒞/(Γ, X))(1, Y)`,
  * iff `⊢ ∀ₓ (f = g)` is valid in topos
(=>) since `f ≡ g`, thus `(f = g) ∈ Sub((Γ, X))` is actually `id ∈ Sub((Γ, X))`

# Exercises for (Ref 1, Part 2, §7)