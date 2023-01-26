---
layout: post
title:  "Review of Algebraic Effect Handler, 2"
date:   2023-01-22 00:56:11 -0400
categories: PL Cat-Theory
---
References is like before:
1. What is algebraic about algebraic effects and handlers? https://arxiv.org/abs/1807.05923 [AB]
2. The Logic and Handling of Algebraic Effects by Matija Pretnar [Pretnar]

Other references are either not tutorial/introduction friendly enough or just with weird notation. For example
3. Plotkin, Gordon, and John Power. "Semantics for algebraic operations." Electronic Notes in Theoretical Computer Science 45 (2001): 332-345. [PP]
4. Algebraic theory of type-and-effect systems by Ohad Kammar [Kammar]

And our aim is to formalize 
5. Abstraction-Safe Effect Handlers via Tunneling [ZA] This is the main target
6. Binders by Day, Labels by Night Effect Instances via Lexically Scoped Handlers [BPPS]
6. First-class Named Effect Handlers [XCL]
***

We will start with big-step operational semantic (closer to denotational semantic). 
And 
1. either prove its soundness w.r.t. small-step
2. or prove computational adequacy w.r.t. the [Pretnar] Semantic in handler
3. doing abstraction on the semantic domain used by big-step to see how categorical stuff comes in


Concretely, our plan is:
0. CBPV 
1. Lexically scoped (capability based) non-resumable effect-free(don't allow raising exception in handler) exception handler
2. big step operational semantic + type safety (this is the specification, because we yet only have operational semantic)
3. denotational semantic + computational adequacy (first step to cat semantic)
   1. investigate the categorcial smeantic here
   2. and for each step below, we redo the above two
4. adding (non-trivial) effect signature (and extend the model above)
5. adding effect polymorphism (abstracting ϵ)
6. effectful effect (i.e. allow raise exception in handler)

## Warmup : CBPV, QIIT+intrinsic style
```
Con : Set
data VTy : Set
data CTy : Set where
  U : CTy → VTy
  F : VTy → CTy
  _×_ : VTy → VTy → VTy
  _→_ : VTy → CTy → CTy
  1 : VTy
  0 : VTy
  ▷ : Con → Ty → Con

data VTm : Con → VTy → Set 
data VTms : Con → Con → Set
data CTm : Con → CTy → Set
  _,_ : VTms Γ Θ → VTm Γ A → VTms Γ (Θ ▷ A)
  p : VTms (Γ ▷ A) Γ
  q : VTm  (Γ ▷ A) A
  _[_] : VTm Γ A → VTms Θ Γ → VTm Θ A
  _[_] : CTm Γ A → VTms Θ Γ → CTm Θ A
  produce : VTm Γ A → CTm Γ (F A)
  thunk   : CTm Γ B → VTm Γ (U B)
  force   : VTm Γ (U B) → CTm Γ B
  bind    : CTm Γ (F A) → CTm (Γ ▷ A) B → CTm Γ B
  lam     : CTm (Γ ▷ A) B → CTm Γ (A → B)
  app     : CTm Γ (A → B) → CTm (Γ ▷ A) B
```
## Lexically scoped (capability based) non-resumable effect-free exception handler
we don't allow raise exception in the effect handler

Γ ctx
Δ capability ctx

The following three is the basic idea

Judgements:
Γ | ϵ₁ .. ⊢ e : T / {ϵₙ , ..}
Γ | ϵ₁ .. ⊢ ϵₙ Exception


should be interpreted as an arrow from LHS to〚T〛+ {ϵₙ , ..}

Sketches of two important rules:

  Γ | .. ϵᵢ .. ⊢ ϵᵢ Exception
/----------------------------------------(Exception)
  Γ | .. ϵᵢ .. ⊢ raise ϵᵢ : 0 / {ϵᵢ} 

  Γ | Δ, ϵ ⊢ e : T / E₁   Γ | Δ ⊢ h : T / E₂ 
  ϵ is absent from T; E' = E₁ ∪ E₂ \ {ϵ}
/----------------------------------------(Try)
  Γ | Δ ⊢ try[ϵ] e h : T / E'


The above are statics, the dynamics look likes open-reduction. i.e. ultimately we have

`try[ϵ] (raise ϵ) h ≡ h`

the big-step semantic for it looks like 

  e ⇊ raise ϵ
/---------------------
  try[ϵ] e h ⇊ h

It seems that **when reduction happens, we should well-acknowledge the type/capability** of `e`. 
THis is fine for intrinsic style formulation

`⇊ : (Γ | Δ ⊢ e : T / E) → (Γ | Δ ⊢ e' : T / E)`

But maybe we should make the above Γ into empty

Let's QIIT it!

### Syntax

Every computation needs to decorate with effect info
```C
// proof-relevant capability tracking
CCon : Set
Capability : Set // currently equals 1 : Set
HasC  : CCon → Capability → Set
SubC : CCon → CCon → Set
  ▷ : CCon → Capability → CCon
  p₁ : HasC (Δ ▷ A) A
  p₂ : SubC (Δ ▷ A) Δ
  _,_ : SubC Γ Δ → HasC Γ A → SubC Γ (Δ ▷ A)


// power set on Δ
ℙC : CCon → Set // power set made from CCon
  ∅ : ℙC Δ
  ∪ : ℙC Δ → ℙC Δ → ℙC Δ
  s : HasC Δ X → ℙC Δ 

_rm : ℙC (Δ ▷ X) → ℙC Δ
_[_] : SubC Δ₁ Δ₂ → ℙC Δ₂ → ℙC Δ₁ // not used I think 

Con : CCon → Set
data VTy : CCon → Set
data CTy : CCon → Set where
  U : CTy Δ → ℙC Δ → VTy Δ
  F : VTy Δ → CTy Δ
  _×_ : VTy Δ → VTy Δ → VTy Δ
  _→_/_ : VTy Δ → CTy Δ → ℙC Δ → CTy Δ
  1 : VTy Δ
  ▷ : Con Δ → Ty Δ → Con Δ

_[_] : SubC Δ₁ Δ₂ → VTy Δ₂ → VTy Δ₁
_[_] : SubC Δ₁ Δ₂ → CTy Δ₂ → CTy Δ₁

data VTm : (Δ : CCon) → Con Δ → VTy Δ → Set 
data VTms : (Δ : CCon) → Con Δ → Con Δ → Set
// Γ | Δ ⊢ _ T / {ϵ₁ ...}
data CTm : (Δ : CCon) → Con Δ → CTy Δ → ℙC Δ → Set
  _,_ : VTms Γ Θ → VTm Γ A → VTms Γ (Θ ▷ A)
  p₁ : VTms Δ (Γ ▷ A) Γ
  p₂ : VTm  Δ (Γ ▷ A) A
  _[_] : VTm Γ A → VTms Θ Γ → VTm Δ A
  _[_] : CTm Γ C A E → VTms Θ Γ → CTm Θ C A E
  produce : VTm Γ A → CTm Γ C (F A) ∅
  thunk   : CTm C Γ B s → VTm Γ (U B s)
  force   : VTm Γ (U B s) → CTm C Γ B s
  bind    : CTm C Γ (F A) s₁ → CTm C (Γ ▷ A) B s₂ → CTm C Γ B (s₁ ∪ s₂)
  raise   : HasC Δ ϵ → CTm Γ C (F T) {ϵ} 
  // another choice raise   : HasC Δ ϵ → CTm Γ C T {ϵ}  but syntax too ugly
  // another choice is raise   : In ϵ C → CTm Γ C (F 0) {ϵ} 
  // another choice is raise   : In ϵ C → CTm Γ C 0 {ϵ} 
  // another another choice is raise   : In ϵ C → CTm Γ C T E → CTm Γ C T (E ∪ {ϵ})
  // informally try[_]  : (ϵ : Capability) → ϵ not in C →
  //                      CTm Γ (C :: ϵ) T E → CTm Γ C T ∅ →
  //                      ϵ free in T → 
  //                      CTm Γ C T (E rm ϵ)
  try[_] : CTm (C ▷ ϵ) (Γ[p₁]) (T[p₁]) E → CTm C Γ T ∅ → CTm C Γ T (E rm)
  lam     : CTm Δ (Γ ▷ A) B s       → CTm Δ Γ (A → B / s) ∅
  app     : CTm Δ Γ (A → B / s₁) s₂ → CTm Δ (Γ ▷ A) B (s₁ ∪ s₂)

_*_ : CTm Δ (Γ ▷ A) B → VTm Δ Γ A → CTm Δ Γ A 

// terminal
data tml : (CTm Γ C T A) → Set 
  tml-p : tml (product v)
  tml-λ : tml (lam f)
  tml-r : tml (raise ϵ)

// big step operational semantic
data _~>*_ : CTm Γ C T E₁ → CTm Γ C T E₂ → Set where
  ~>*tml   : tml e                → e ~>* e
  ~>*bind1 : e ~>* (produce v)    → (bind e kont) ~>* 
  ~>*bind2 : e ~>* (raise ϵ)      → (bind e kont) ~>* (raise ϵ) // non-resumable exception
  ~>*try1  : e ~>* (raise ϵ)      →  (try[ϵ] e h) ~>* h // specification
  ~>*app   : e ~>* (lam f)        → (app e) ~>* f
  ~>*force : e ~>* v              → (force thunk e) ~>* v

```
```C
type-safety : (t : CTm ⋅ [] T E) → exists v, tml v /\ t ~>* v


Conₚ : Con → Set
Conₚ Γ = VTms ⋅ Γ → Set
Con₂     = ∑ (Γ : Con). Conₚ Γ
⋅ₚ : Conₚ ⋅
⋅ₚ = λ _ → ⊤ 

Γ₂ ▹ₚ T₂ : Conₚ (Γ ▹ T)
Γ₂ ▹ₚ T₂ = λ (γt : Tms ⋅ (Γ ▹ T)) → ∑ (γₚ : Γₚ (π₁ γt)), Tₚ  (π₂ γt)

VTyₚ : (Δ₂ : CCon₂) → VTy Δ → Set
VTyₚ Δ₂ T =  VTm Δ ⋅ T → Set 
CTyₚ : (Δ₂ : CCon₂) → CTy Δ → Set
CTyₚ Δ₂ T =  CTm Δ ⋅ T → Set 

CTy₂ Δ₂ = ∑ T : CTy Δ, CTyₚ Δ₂ T

Uₚ : (T₂ : CTy₂ Δ₂) → (S : ℙC Δ) → VTyₚ Δ₂ (U T S)
Uₚ T₂ S = λ v → (∑ (k : CTm Δ ⋅ T S), v ≡ thunk k)
Fₚ : (T₂ : VTy₂ Δ₂) → CTyₚ Δ₂ (F T) 
Fₚ T₂   = λ t → (∑ v, (t ~>* produce v) or (t ~>* raise ϵ /\ HasC Δ ϵ))

_→_/_ : (A₂ : VTy₂ Δ₂) → (B₂ : CTy₂ Δ₂) → (S₂ : ℙC₂ Δ₂) → CTyₚ Δ₂ (A → B / S)
A₂ → B₂ / S = λ t → ∑ f. (t ~>* lam f) and (x₂ : VTm₂ Δ₂ ⋅₂ A₂) → Bₚ (f * x)

VTmₚ  : (Δ₂ : CCon₂) → (Γ₂ : Con₂) → (T₂ : VTy₂ Δ₂) → VTm Δ Γ T → Set 
VTmsₚ : (Δ₂ : CCon₂) → (Γ₂ : Con₂) → (Θ₂ : Con₂) → VTms Δ Γ Θ → Set 
CTmₚ : (Δ₂ : CCon₂) → (Γ₂ : Con₂) → (T₂ : CTy₂ Δ₂) → CTm Δ Γ T → Set
CTmₚ Δ₂ Γ₂ T₂ S₂ t = (γ₂ : Γ₂) → Tₚ (t[γ]) 
// so weird S is not used at all..

lamₚ : (f₂ : CTm₂ Δ₂ (Γ₂ ▷₂ A₂) B₂ s₂)       → CTmₚ Δ₂ Γ₂ (A₂ →₂ B₂ / s₂) ∅₂ (lam f)
     ≡ (f₂ : CTm₂ Δ₂ (Γ₂ ▷₂ A₂) B₂ s₂) → (γ₂ : Γ₂) → (A₂ →₂ B₂ / s₂)ₚ ((lam f) [γ])
     ≡ (f₂ : CTm₂ Δ₂ (Γ₂ ▷₂ A₂) B₂ s₂) → (γ₂ : Γ₂) → ∑ g . ((lam f) [γ]) ~>* (lam g) and (x₂ : VTm₂ Δ₂ ⋅₂ A₂) → Bₚ (g * x)
lamₚ f₂ γ₂ = 
  //
    let g = f [ γ ^ _ ]
    let ~>*tml : ((lam f) [γ]) ~>* (lam g) ≡ ((lam f[γ ^ _]) ) ~>* (lam g)
    since fₚ : CTmₚ Δ₂ (Γ₂ ▷₂ A₂) B₂ s₂ f 
       ≡ (γa₂ : (Γ₂ ▷₂ A₂)) → Bₚ (f[γa])
  //
```