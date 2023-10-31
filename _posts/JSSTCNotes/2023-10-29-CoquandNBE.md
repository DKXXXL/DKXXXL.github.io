---
layout: post
title:  "Review Coquand's NbE, but for STLC"
date:   2023-10-29 00:56:11 -0400
categories: Type-Theory Cat-Theory
---


We review Coquand's NbE, it has clearer and more concise proof structure than Sterling and Altenkirch's approach. 

But ultimately, we are just type-setting Coquand's paper, in a more type-theoretic style.

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
  to finish certain operations on categorical objects.

***

Coquand also uses subtype {x : T | ...}, we need to think how to encode this in presheaf as well,
especially {x : Nf ⋅ T | [x] = ?}. I think this can be encoded

# Semantic
The key is Coquand's simple formulation of the motive for normalization

Remember the following spell : 
every logical relation structure is a certain computability structure

In NbE (for SLTC), we map each type to a record 
```agda
record Tyᴺ (T : Ty) : PSet where
  C :  Tm ? T → PSet // an arrow type by two objects in the presheaf topos
  // this is the hardest one to come up with, 
  // because usually when people think about presheaf model, 
  //    it is hard for them to think of "making them proof-relevant"
  // C T t means t is a normalizable term  

  // the following two is called tait yoga by Sterling, 
  //  but to be honest, reify-reflect yoga (a la sterling) is unintuitive
  // the following two used by Coquand is more intuitive and easier to remember
  ⇑ : (t : Ne ? T) → C [t] // reflect: a dependent function between two objects in presheaf topos
  ⇓ : ∀ (t : Tm ? T) → C t → {x : Nf ? T | [x] = t}

```
We construct QIIT-algebra, and the display algebra for type is where we starts.

Then we can use Ty² := Σ T : Ty, Tyᴺ T to become a normal algebra; 
but Ty² will be a Presheaf... trivially

and we do similar for other display algebra.

For STLC, Con is point-wise product of the types in the context. We can define it by induction

```agda
Conᴺ (Γ : Con) : PSet 
Conᴺ ⋅ = 1
Conᴺ (T × Γ) = Tyᴺ T × Conᴺ Γ
```

But correspondingly, we can make it 
```agda

record Conᴺ (Γ : Con) : PSet where
  C :  Tms ? Γ → PSet // an arrow type by two objects in the presheaf topos
  // this is the hardest one to come up with, 
  // because usually when people think about presheaf model, 
  //    it is hard for them to think of "making them proof-relevant"
  // C T t means t is a normalizable term  

  // the following two is called tait yoga by Sterling, 
  //  but to be honest, reify-reflect yoga (a la sterling) is unintuitive
  // the following two used by Coquand is more intuitive and easier to remember
  ⇑ : (t : Nes ? Γ) → C [t] // reflect: a dependent function between two objects in presheaf topos
  ⇓ : ∀ (t : Tms ? Γ) → C t → {x : Nfs ? Γ | [x] = t}


```


As Coquand, we define `El T := Tm ? T` as a presheaf, and we do glue/display algebra on it

```agda
Elᴺ T² : El T → PSet
Elᴺ T² t = Tᴺ.C t


Elᴺ Δ² : El Δ → PSet
Elᴺ Δ² γ = Δᴺ.C γ

```



Now the above motive is enough: For 
```agda
Given t : Tm Γ T, we have t[-] : Tms ? Γ → Tm ? T
⟦ t ⟧ t : Tmᴺ Γᴾ

⇓T :  ∀ (u : Tm ? T) → C u → {x : Nf ? T | [x] = u}

f (z : Tms ? Γ) = ⇓T (yt z) ()
```
