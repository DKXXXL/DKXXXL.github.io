---
layout: post
title:  "A Review of NbE, intrinsically and dynamically"
date:   2022-08-02 00:56:11 -0400
categories: Type-Theory
---
References:

Sterling, Jonathan, and Bas Spitters. "Normalization by gluing for free {\lambda}-theories." arXiv preprint arXiv:1809.08646 (2018).

Altenkirch, Thorsten, Martin Hofmann, and Thomas Streicher. "Categorical reconstruction of a reduction free normalization proof." International Conference on Category Theory and Computer Science. Springer, Berlin, Heidelberg, 1995.

https://github.com/FrozenWinters/stlc

# What is NbE for?

The motivations for Normalization by Evaluation(NbE) are various. 
1. We want a partial evaluator that can do as much as possible, actually resulting *normal form*
2. We want a well-behaved partial evaluator that can lead judgemental equal input terms into same *normal form*
3. This same *normal form* can provide us the ability to decide if two terms are judgementally equal, which will be very useful for type checking for dependent type



# An intuitive inspiration for NbE proof
<!-- Copy and paste the intuition from our draft -->


Say we are writing this NbE function in Haskell -- which will do as much reduction as possible by just traversing and evaluating each node of the AST tree (if possible) recursively. Doing so is actually *reflecting* the open term AST $Γ ⊢ t : T$ (`t : Tm Γ T`) of the object language into some other Haskell's function $\Tilde{t} : Γ → T$ in meta language. But
1. This type of $\Tilde{t}$ doesn't make sense, because this `T : Ty` is not actually a type in our Haskell (meta-logic), it is another elements/stuff in the AST. Even in Agda with dependent type, we can only say something like `Tm ⋅ T` is a type.
2. This behaviour of NbE will remind people of closed value evaluator `eval t`: when inputting a series of closed terms `γ` to instantiate the context of `t`, we will have a `t[γ] : T` back.

Let's look at 2 first, this `eval t` will actually be type `eval t: Tms ⋅ Γ → Tm ⋅ T`, i.e. given a substitution (a series of closed terms), we have a closed final result back. Surprisingly, this reminds us of yoneda embedding! We have a natural transformation `y(t) : Tms ? Γ ⇒ Tm ? T` when embed `t` into the presheaf over the category of syntax (substitution calculus). So it is natural to ask our normalization function to also be a natural transformation `nbe? : Tms ? Γ ⇒ Tm ? T `
And the type is more than satisfactory (maybe even too strong) since `nbe? Γ : Tms Γ Γ → Tm Γ T`, and we just input the identity substitution, we should get out `Tm Γ T` back. Thus it seems like we only need to know how concretely `nbe?` computes.

But there is another problem here, namely 'quotiented to much on `Tm Γ T`'(Sterling & Spitters, 2018)-- since we have judgemental equality `lam(app t)≡t`, now a normalization function returning `t` and another failed normalization function returning `lam(app t)` are **equal** to each other. The problem here is that, normalization function is sensitive to the concrete representation but now our definition of the object language only work on *equivalence classes of lambda terms*. 

The solution is to define concrete representation -- actually define for each equivalence (judgementally equal) class one normal form `Nf Γ T` with trivial injection `inj : Nf Γ T → Tm Γ T`. and make sure we have finally `nf : Tm Γ T → Nf Γ T` with the specification `inj (nf t) ≡ t`. 

But on the other hand, the 'quotiented-too-much' problem might provide a good specification for the concrete `nbe?` we want : `nbe? t ≡ y(t)`. With this, we can deduce `(nbe? t) Γ id ≡ y(t) Γ id ≡ t[id]`. 

## Normal Form/Neutral Form

Note that, due to similar reason, there cannot be any quotient in `Nf`, `Ne`, otherwise we are returning to "equivalence class".

## But I thought we are working on figuring out the yoneda?
The problem is back again as now we know `y(t) : Tms ? Γ ⇒ Tm ? T` is not working, it should be at least some term of type `?? : Tms ? Γ ⇒ Nf ? T`, but then (1). it is not yoneda embedding, (2). it is not even an arrow in one category!

2 is more serious, to fix this, we need to enlarge the presheaf category so that `Nf ? T`, `Ne ? T`, `Tm ? T`, `Tms ? T` are all objects in this category, and that is *Presheaf over Renaming Category* as the generalization of Kripke Semantic with context as words. (Sterling & Spitters, 2018) points out embedding functor `i : Ren-Cat → Nf-Cat`, `Ne-Cat` and `Tm-Cat`, and thus we have precomposition functors ` _∘i = i* : Pr(Nf-Cat) → Pr(Ren-Cat)`, thus `i*(Tms ? T)` and `i*(Nf ? Γ)` are all embedded objects in `Pr(Ren-Cat)`. 




# A quick review of NbE Proof


# Dynamism
Due to the power of category theory, we can stick with reduction-free style and equational theory and has a clear math semantic. However, this does bring challenge on understanding how under the hood NbE is running and doing 'beta reduction' and 'eta expansion'.


Looking closely at the definition of NbE, 
```Haskell
nf : Tm Γ T → Nf Γ T
nf t =  ((↓Ty T Γ) ∘ ⟦ t ⟧Γ  ∘ (↑Con Γ Γ)) (id')
```
We notice that the key ingredient of the correctness of `nf` comes from the fact that, we have a good 'denotation', i.e.  `⟦_⟧` will map judgementally equal term into same denotation. Then by reification we can end up with the same normal form. In fact, even without normalization, this denotation along should help us to decide judgemental equality. 

Thus to understand the dynamic, the key is to understand what happens in the denotation.

## How denotation looks like

According to our intuition, we consider using a function $t : Γ → T$ to model $Γ ⊢ t : T$, then explicit subsitution is just composition on function. But this above doesn't quite make sense because what the hell is $Γ, T$ in  $t : Γ → T$? 

Thanks to yoneda lemma,  we can have a function outputing normal form $t : YR?? Γ ⇒ YRNf T$ instead as encoding the meaning of $Γ → T$. Since `YRNf T` can really provide "set-theoretic" (or collection of terms) semantic.
<!-- here it might not be YRNf at all? We are only sure it is a presheaf, but why it is `YRNf T` ? Maybe it is `YR?? T`? -->

1. The naturality condition arised from the natural transformation $t$ might be weird, but it is directly related to yoneda lemma.
2. This `YR??s Γ` is due to the fact that, we are not sure using `YRTms,YRNes,YRNfs` or anything else. We are only sure `YR?? Γ` is a presheaf. What's more, we need to have `YRNes Γ Γ ⇒ YR?? Γ Γ` 
3. The meaning of `YRNf T` is quite obvious -- a "variant" set parametrized on the context. In other words, an indexed set of set that include those **well-typed terms** of type `T`, indexing on the context. Pedantcally, this is called a presheaf.

Basically each syntactic term `t` is now denoted by `〚t〛` a natural transformation between presheaf. Let's do some computation on 


## Explicit Substitution

Explicit substitution is the simplest -- because we use a natural transformation to model, and substitution is directly a composition of two natural transformation. 

But concretely



## Beta-reduction

## Eta-Expansion

# Dynamic of Explicit Substitution
However, when not using function/natural transformation to model terms, the explicit substitution is purely syntax and it is a bit confusing on how dynamic is working here. Let's sort it out here.