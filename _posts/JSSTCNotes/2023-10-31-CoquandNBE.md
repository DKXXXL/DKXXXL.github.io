---
layout: post
title:  "Review Coquand's NbE, but for STLC"
date:   2023-10-29 00:56:11 -0400
categories: Type-Theory Cat-Theory
---


https://www.cse.chalmers.se/~coquand/norm.pdf
and 
https://arxiv.org/abs/1810.09367 

# Syntax 
Still start with QIIT, 

```agda
record STLC where 
  field 
    Con : Set -- this Con is different from that Con
    Ty  : Set 
    ∙   : Con
    _▹_ : Con → Ty → Con
    Tms : Con → Con → Set 
    Tm : Con → Ty → Set  
    ... 
    // we omit most stuff here
```

# More Syntax

Because we use quotient, which means pretty print of 1 can be 0 + 1. This is not what CS people actually want,
  they want a special syntax, i.e. normal forma and neutral form 

```
data Ne : Con → Ty → Set 
data Nf  : Con → Ty → Set  
```
with two functions 
```
Rnf : Nf Γ T → Tm Γ T 
Rne : Ne Γ T → Tm Γ T   
```
We also consider 
```
RawTm : Con → Ty → Set
```
as unquotiented terms



For the above two function `Rnf, Rne`, we consider them by notation `[-] : ? Γ T → Tm Γ T`, 
as somewhat taking quotient on the raw terms

# Internal Language

Our type theory is also used as internal language. We will explictly point out if internal language is used

Presheaf Topos is a rich cat structure with extensional dependent type theory as internal language. 

In this blog, we mainly use Presheaf over category of renaming, which can include (Tm ⋅ T), (Nf ⋅ T) ... as objects.
We especially use `PSet`` to indicate the universe inside this presheaf topos. We make sure to annotate enough to avoid 
 
For example, the above definitions (Tm, Nf, ..) are just inside normal mathematics, defined by induction.

Another way of thinking of internal language, can be considered as using type theory as a short hand
  to achieve certain operations on categorical objects.

***

Coquand also uses subtype {x : T | ...}, we need to think how to encode this in presheaf as well,
especially {x : Nf ⋅ T | [x] = ?}. I think this can be encoded

We also use `PSet` to indicate the rough idea of universe in the presheaf topos.


## What is PSet
In Coquand, he uses 
> We write V₀, V₁, . . . the cumulative sequence of presheaf universes, so that Vₙ(X) is the set of 𝑈ₙ-valued dependent presheaves on the presheaf represented by X.

y(X) is representing X, y(X) = Ren(?, X)

In other word, Vₙ : Presheaf over renaming category
Vₙ : Ren → Set
Vₙ X = (Z : Ren) → y(X)(Z) → 𝑈ₙ

But why it is a PSet? i.e. why it can be considered as a universe in presheaf topos?

Basically the extensional property we want for a Universe V, is that, if x : V, then "x" is an object, i.e. a presheaf


⊢ x : Vₙ, i.e. x ∈ Hom(1, Vₙ) ≅ Hom (y(1), Vₙ) ≅ Vₙ(1) = (Z : Ren) → y(1)(Z) → Uₙ ≅ (Z : Ren) → {∗} → Uₙ 
-- since product is a limit and yoneda preserves limit, and yoneda lemma

by the above, every presheaf is actually in the Hom(1, Vₙ). 
Actually not only presheaf, every function (Z : Ren) → Uₙ can be lifted to Vₙ 

0. More investigation on the presheaf universe 
1. Figuring out how normalization function work
2. Glue the Boolean type
3. Glue the function type (to figure out Var stuff)

# Semantic
The key is Coquand's simple formulation of the motive for normalization. 
We type-set type-thoeretically the computability strucutre (display algebra).

We note that, the display algebra always resides in presheaf topos while the syntax is in conventional math

***
We start from context





Now types

```agda
record Tyᴺ (T : Ty) : PSet 
  C : Tm ? T → PSet 
  // an arrow type by two objects in the presheaf topos
  // this is the hardest one to come up with, 
  // because usually when people think about presheaf model, 
  //    it is hard for them to think of "making them proof-relevant"
  // C T t means t is a normalizable term  

  // the following two is called tait yoga by Sterling, 
  //  but to be honest, reify-reflect yoga (a la sterling) is unintuitive
  // the following two used by Coquand is more intuitive and easier to remember
  ⇑ : (t : Ne ? T) → C [t] // reflect: a dependent function between two objects in presheaf topos
  ⇓ : (t : Tm ? T) → C t → {x : Nf ? T | [x] = t}

```


Context is similar

First, given `Γ : Con`, we have a notion `|Γ|` to be a presheaf over renaming category
```agda
|Γ| (X) = Tms X Γ
|Γ| = Tms ? Γ
```


```agda
record Conᴺ (Γ : Con) : PSet where 
  C : Tms ? Γ → PSet
  ⇑ : (t : Nes ? Γ) → C [t] // reflect: a dependent function between two objects in presheaf topos
  ⇓ : (t : Tms ? Γ) → C t → {x : Nfs ? Γ | [x] = t}
```

Before giving motive for Tm and Tms, we need to notice that
1. For t : Tm Γ T, it defines  | Γ | → Tm ? T : Psh(Ren) := ρ ↦ t[ρ]; a natural trans induced by substitution
   1. we denote it as -[-] 
2. For γ : Tms Γ Δ, it defines | Γ | → Tms ? Δ: Psh(Ren) := ρ ↦ γ ∘ ρ;a natural trans induced by compose


```agda
Tmᴺ Γᴾ Aᴾ : Tm Γ A → PSet
Tmᴺ Γᴾ Aᴾ t = (ρ : |Γ|) → (ρᴺ : Γᴺ.C ρ) → Aᴺ.C (t[-] ρ)

// Tms is similar
Tmsᴺ Γᴾ Δᴾ : Tms Γ Δ → PSet
Tmsᴺ Γᴾ Δᴾ γ = (ρ : |Γ|) → (ρᴺ : Γᴺ.C ρ) → Δᴺ.C ( [γ ∘] ρ )

```

## Adequacy

The above motive, lest we can construct a model according to it, can give us normalization function already

we have ⟦ t ⟧ : Tmᴺ Γᴾ Tᴾ t = (ρ : Tms ? Γ) → (ρᴺ : Γᴺ.C ρ) → Tᴺ.C (t[-] ρ)

⟦ T ⟧.⇓ : (t : Tm ? T) → ⟦ T ⟧.C t → {x : Nf ? T | [x] = t}
<!-- is the following true? -->
⟦ T ⟧.⇓ Γ : (t : Tm Γ T) → ⟦ T ⟧.C Γ t  → {x : Nf Γ T | [x] = t}
<!-- is the following true? -->
⟦ t ⟧ Γ : (ρ : Tms Γ Γ) → (ρᴺ : Γᴺ.C Γ ρ) → Tᴺ.C Γ (t[ρ])

⟦ t ⟧ Γ id (⟦ Γ ⟧.⇑ id) : Tᴺ.C Γ (t[id])

Thus finally 
⟦ T ⟧.⇓ Γ t (⟦ t ⟧ Γ id (⟦ Γ ⟧.⇑ id)) : {x : Nf Γ T | [x] = t}

<!-- The only concern is that, dependent natural transformation, can
      they be instantiated to get the above stuff? -->

