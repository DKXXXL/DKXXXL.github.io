---
layout: post
title:  "Topos of Trees"
date:   2023-11-30 00:56:11 -0400
categories: Type-Theory
---

Ref : 
1. https://arxiv.org/abs/1208.3596
2. https://abizjak.github.io/documents/thesis/semantics-applications-gr.pdf
3. https://pure.itu.dk/en/publications/denotational-semantics-in-synthetic-guarded-domain-theory
4. introduction to higher order categorical logic, Part II, Section 9

***

## §2.2 , 
I think the graph looks incorrect, it should be 
 ? -----------> ▶ A
 |                |
▷ m              ▶ m
 |                |
 X  ---nextX---> ▶ X
  
And the correct read of the pullback seems to be type-substitution：
i.e. A latered-dependnet type `▶ A` is lifted to the current `X` by `nextX`, that is the latered subobject/type is now in a current word. Consider `m` and `▷m` are both in the current work but in different context. (`X` vs. `▶ X`)

***
Thus we have three `later`


1. ▶ as a functor on 𝒮
2. ▷ : Ω → Ω
3. ▷ : Sub(A) → Sub(A) for arbitrary `A ∈ 𝒮`

1 and 3 is connected by the above pullback. 
Since we have decode `decode : Hom(X,Ω) → Sub(X)`, we should be able to prove `decode (▷ x) = ▷ decode (x)`.

TODO: Prove it

## Definition 2.2

Simply because Prop 2.5 says, `▷ (x = y) ⟺ nextX x = nextX y`, so 
`f = g ∘ nextX` means `▷ (x = y) → f x = f y` means `f` to be contractive

So this `nextX` name is weird. Why it is called `nextX`? maybe because `nextX x` depends on all the information of `x` in the past world `▷ (x = ?)`, so it is like making a past `x` into the "next" world?



## Thm 2.4

Just look `f : X × Y → X` as `Y → (X → X)`, so point-wise on `Y` we extract `X`, and get the result

## § 2.4
In Ref4, we know that, in topos of trees, `Ω(n) = {0,1,..,n}`, and `⊤ : 1 → Ω` is that `⊤(n)(∗) = n`. 

In fact, in Ref4, denote `[n] = {0,1,..,n}`, `Ω(n) = {[0],[1],..,[n]}`, and `⊤ : 1 → Ω` is that `⊤(n)(∗) = [n]`. But we can ignore this

## Thm 2.7

To prove these :

According to Ref4,
To prove a internal language proposition `⊢ ϕ`, we only need to show `1 ⊩ ϕ` where `1` is the terminal. However, we cannot easily see what `1` is here and prove it.

The easiest way is to prove   `∀ n, n ⊩ ϕ`, then by Ref4, Prop 8.3 and Prop 9.2, we know `1 ⊩ ϕ`. So it reduces to prove `∀ n, n ⊩ ϕ`, using induction.