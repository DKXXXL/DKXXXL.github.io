---
layout: post
title:  "A Intuitive Review of Structure for NbE Proof, intrinsically and dynamically"
date:   2022-08-02 00:56:11 -0400
categories: Type-Theory
---
References:

Sterling, Jonathan, and Bas Spitters. "Normalization by gluing for free {\lambda}-theories." arXiv preprint arXiv:1809.08646 (2018).

Altenkirch, Thorsten, Martin Hofmann, and Thomas Streicher. "Categorical reconstruction of a reduction free normalization proof." International Conference on Category Theory and Computer Science. Springer, Berlin, Heidelberg, 1995.

https://github.com/FrozenWinters/stlc

Abel, Andreas. "Normalization by evaluation: Dependent types and impredicativity." Habilitation. Ludwig-Maximilians-Universität München (2013).

# What is NbE for?

The motivations for Normalization by Evaluation(NbE) are various. 
1. We want a partial evaluator that can do as much as possible, actually resulting *normal form*
2. We want a well-behaved partial evaluator that can lead judgemental equal input terms into same *normal form*
3. This same *normal form* can provide us the ability to decide if two terms are judgementally equal, which will be very useful for type checking for dependent type



# An intuitive review for the structure of NbE proof
<!-- Copy and paste the intuition from our draft -->


Say we are writing this NbE function in Haskell -- which will do as much reduction as possible by just traversing and evaluating each node of the AST tree (if possible) recursively. Doing so is actually *reflecting* the open term AST $Γ ⊢ t : T$ (`t : Tm Γ T`) of the object language into some other Haskell's function $\hat{t} : Γ → T$ in meta language. But
1. This type of $\hat{t}$ doesn't make sense, because this `T : Ty` is not actually a type in our Haskell (meta-logic), it is another elements/stuff in one of the AST type `Ty`. Even in Agda with dependent type, we can only say something like `Tm ⋅ T` is a type.
2. This behaviour of NbE will remind people of closed value evaluator `eval t`: when inputting a series of closed terms `γ` to instantiate the context of `t`, we will have a `t[γ] : Tm ⋅ T` back.

Let's look at 2 first, this `eval t` will actually be type `eval t: Tms ⋅ Γ → Tm ⋅ T`, i.e. given a substitution (a series of closed terms), we have a closed final result back. Surprisingly, this reminds us of yoneda embedding! We have a natural transformation `y(t) : Tms ? Γ ⇒ Tm ? T` when embed `t` into the presheaf over the category of syntax (substitution calculus). So it is natural to require our normalization function to also be a natural transformation `nbe? : Tms ? Γ ⇒ Tm ? T `

And the type is more than satisfactory (maybe even too strong) since `nbe? Γ : Tms Γ Γ → Tm Γ T`, and we just input the identity substitution, we should get out `Tm Γ T` back. Thus it seems like we only need to know how concretely `nbe?` computes. The weirdest/most counter-intuitive part is there are so many (seemingly unnecessary) naturality condition arised from the natural transformation `t` --- but the motivation is directly justified by yoneda lemma.

But there is another problem here, namely 'quotiented too much on `Tm Γ T`'(Sterling & Spitters, 2018)-- since we have judgemental equality `lam(app t)≡t`, now a succeessful normalization function returning `t` and another failed normalization function returning `lam(app t)` are **equal** to each other. The problem here is that, normalization function is sensitive to the **concrete representation** but now our definition of the object language only work on *equivalence classes of lambda terms*. 

The solution is to define concrete representation -- actually define for each equivalence (judgementally equal) class *one* normal form `Nf Γ T` with trivial injection `inj : Nf Γ T → Tm Γ T`. and make sure we have finally `nf : Tm Γ T → Nf Γ T` with the specification `inj (nf t) ≡ t`. 

(But on the other hand, the 'quotiented-too-much' problem might provide a good specification for the concrete `nbe?` we want : `nbe? t ≡ y(t)`. With this, we can deduce `(nbe? t) Γ id ≡ y(t) Γ id ≡ t[id]`. )

## Normal Form/Neutral Form

Note that, due to similar reason, there cannot be any quotient in `Nf`, `Ne`, otherwise we are returning to "equivalence class".

## But I thought we are working on figuring out the yoneda? -- Presheaf over REN
The problem is back again as now we know `y(t) : Tms ? Γ ⇒ Tm ? T` is not working, it should be at least some term of type `?? : Tms ? Γ ⇒ Nf ? T`, but then (1). it is not yoneda embedding, (2). it is not even an arrow in one category!

2 is more serious, to fix this, we need to enlarge the presheaf category so that `Nf ? T`, `Ne ? T`, `Tm ? T`, `Tms ? T` are all objects in this category, and that is *Presheaf over Renaming Category* as the generalization of Kripke Semantic with context as worlds. 

You might feel confused why the hell is world useful here. 
0. Notes that Presheaf over arbitrary small category, including terminal category 𝟙, are all topos (Actually `Pr(𝟙) ≃ Set`). So STLC (or even simple MLTT) can find (standard model) semantic in it. That means `Pr(?)` is enough to model everything here. 
1. The best way to understand the `?` in `Pr(?)` as worlds/stages from Kripke Semantic. They are not used in standard semantic or canonicity model.
2. [Define Exponential on Pr(?)](https://ncatlab.org/nlab/show/closed+monoidal+structure+on+presheaves)
3. But still ... why renaming and stages? Where is renaming and stages used? 


(Sterling & Spitters, 2018) points out embedding functor `i : Ren-Cat → Nf-Cat`, `Ne-Cat` and `Tm-Cat`, and thus we have precomposition functors ` _∘i = i* : Pr(Nf-Cat) → Pr(Ren-Cat)`, thus `i*(Tms ? T)` and `i*(Nf ? Γ)` are all embedded objects in `Pr(Ren-Cat)`. 

Now that we have a larger category, we can still use the embedding `Nf ? T`, `Nfs ? Γ` and etc. to embed syntactic terms (though we may only use `Nf ? T` and `Nfs ? Γ`). Yoneda over presheaf of renaming here, due to the fact that there are only variable permutation in renaming, will be pretty weak.

## Summary of Denotation

To summary, To reflect syntactic information back to meta-logic, we use Yoneda Embedding to denote types/ctxs `T, Γ` and term `Γ ⊢ t : T` information in syntactical category with objects and arrows in `Pr(Ren-Cat)`.

To make this denotation work, we need to make sure judgemental equal stuff are mapped to same things, i.e. We need to construct functors `〚_〛` that map types/ctxs and terms to objects and arrows in `Pr(Ren-Cat)`,**by constructing models of STLC syntax as QIIT**. This is done by inductively construct stuff according to the signature of STLC. Let's call the "codomain" of `〚_〛` normalization structure `N` -- then we have corresponding `NCon, NTy, NTm, NTms`, each of them will contain objects and arrows in `Pr(Ren-Cat)` -- roughly speaking
```Haskell
record NCon : Set where 
  syn : Con            -- storing the syntax
  denote : Pr(Ren-Cat) -- the denotation

Record NTm (Γ' : NCon) (T' : NTy) where 
  syn : Tm Γ'.syn T'.syn 
  -- we make sure we can peel back the original syntax from the denotation, one of the feature of categorical gluing, the lesson canonicity proof told us
  denote : Γ'.denote ⇒ T'.denote 
  -- natural transformation between two presheaves
```


Once we make sure judgemental equal stuff are mapped to the same thing, and once we can decide the equality of mapped stuff, we can use this `〚_〛` to decide judgemental equality! But NbE is further -- it is something close to partial evaluation so we need to port back from `NCon, NTy, NTm, NTms` to `Nf` stuff.

## Reflection and Reification

Note that for `t : Tm Γ T` we have `〚t〛 : NTm 〚Γ〛〚T〛` s.t. `〚t〛.denote : 〚Γ〛.denote ⇒ 〚T〛.denote`, thus we need a "quote" back or "reification" that is `↓Ty T :〚T〛.denote ⇒ Nf ? T` to get normal form syntax, similarly, we need at least a "reflection" function `↑Con Γ : Nes ? T ⇒ 〚Γ〛.denote` to provide a proper input. Bridge them together, we have a big natural transformation
`Nes ? Γ ⇒ 〚Γ〛.denote ⇒ 〚T〛.denote ⇒ Nf ? T`, then we can have our normalization function easily:
```Haskell
nf : Tm Γ T → Nf Γ T
nf t =  ((↓Ty T ) ∘ ⟦ t ⟧  ∘ (↑Con Γ)) Γ (id)
  where id : Nes Γ Γ -- is the identity function 
```
To make induction/normalization structure work with reflection and reification, our normalization structure will attach these two natural transformations as well, and thus

```
record NCon : Set where 
  syn : Con            -- storing the syntax
  denote : Pr(Ren-Cat) -- the denotation
  ↑Con : Nes ? syn ⇒ denote
  ↓Con : denote ⇒ Nfs ? syn

record NTy : Set where
  syn : Ty 
  denote : Pr(Ren-Cat)
  ↑Ty : Ne ? syn ⇒ 
```

Naturally, we will expect `NTms, NTm` to change correspondingly. Surprisingly, they will change but only carry proof of naturality condition -- they are only used to prove the correctness of nbe.

Note that, we require reification and reflection is asking to be sandwiched between `Ne` and `Nf` (as the type `Nes ? Γ ⇒ 〚Γ〛.denote ⇒ 〚T〛.denote ⇒ Nf ? T` suggested), and this is called candidate space (in Abel's thesis).

## Two Invariance for the proof

To prove the correctness of `nf`, we need soundness and completeness, basically `a ≡ b ↔ nf a ≡ nf b`, which also hints how decidability of judgemental equality is achieved since in `Nf` judgemental equality is trivially decidable.

To prove from left to right is trivial as we are working in QIIT framework thus `nf` automatically respects equality. The other direction is the key of the proof -- 

### One more thing - Definable Lambda



# Dynamism
Due to the power of category theory, we can stick with reduction-free style and equational theory and has a clear math semantic for NbE. However, this does bring challenge on understanding how under the hood NbE is running and doing 'beta reduction' and 'eta expansion'.


Looking closely at the definition of NbE, 
```Haskell
nf : Tm Γ T → Nf Γ T
nf t =  ((↓Ty T ) ∘ ⟦ t ⟧  ∘ (↑Con Γ)) Γ (id)
```
We notice that the key ingredient of the correctness of `nf` comes from the fact that, we have a good 'denotation', i.e.  `⟦_⟧` will map judgementally equal term into same denotation. In fact, even without normalization, this denotation along should help us to decide judgemental equality. 

Thus to understand the dynamic, the key is to understand what happens in the denotation -- how denotation doing beta-reduction and eta-expansion correspondingly. Let's do some computation for each syntactic term `t` the denotation as a natural trnasformation between presheaves `〚t〛`.

## How denotation looks like


### Explicit Substitution

Explicit substitution is the simplest -- because we use a natural transformation to model, and substitution is directly a composition of two natural transformation. 

But concretely

### Boolean


### Function


### Product



# Dynamic of Explicit Substitution, Syntacically
However, when not using function/natural transformation to model terms, the explicit substitution is purely syntax and it is a bit confusing on how dynamic is working here. Let's sort it out here. This part is mainly referring to Abel's Thesis.