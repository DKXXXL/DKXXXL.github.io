---
layout: post
title:  "A Review of NbE"
date:   2022-08-02 00:56:11 -0400
categories: Type-Theory
---
References:

Sterling, Jonathan, and Bas Spitters. "Normalization by gluing for free {\lambda}-theories." arXiv preprint arXiv:1809.08646 (2018).

Altenkirch, Thorsten, Martin Hofmann, and Thomas Streicher. "Categorical reconstruction of a reduction free normalization proof." International Conference on Category Theory and Computer Science. Springer, Berlin, Heidelberg, 1995.

https://github.com/FrozenWinters/stlc



# An intuitive inspiration for NbE 
<!-- Copy and paste the intuition from our draft -->

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