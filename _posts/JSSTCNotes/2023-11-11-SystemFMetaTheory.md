---
layout: post
title:  "Review System F Meta-theory"
date:   2023-11-07 00:56:11 -0400
categories: Type-Theory Cat-Theory
---

We review meta-theory of System F, in QIIT style

# Syntax


```Haskell

-- Type Context 
TCon : Set
TCon = ℕ

-- judgements, explicit substitution for type and term variables 
Ty : TCon → Set 
Con : TCon → Set
SubTCon : TCon → TCon → Set
Tm : (Δ : TCon) → Con Δ → Ty Δ → Set 
SubCon : (Δ : TCon) → Con Δ → Con Δ → Set


-- substitution calculus on SubTy, this is like renaming
-[-] : Ty N → SubTCon M N → Ty M
-[-] : Con N → SubTCon M N → Ty M
-[-] : Tm N Γ T → 
-- substitution calculus on SubTm
-[-] : Tm N  → SubTCon M N → Ty M



-- type quantifier formation
∀ : Ty (S n) → Ty n

-- type quantifier intro
Λ : Tm (S n) Γ T → Tm n ? ?


-- function type, lambda
⇒ : Ty n → Ty n → Ty n
λ : Tm n (Γ ▷ A) B → Tm n Γ (A ⇒ B)
-- nightmare -- you have A LOT OF substitution lemmas here



```