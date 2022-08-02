---
layout: post
title:  "Review of NbE proof"
date:   2022-08-02 00:56:11 -0400
categories: Type-Theory
---

# An intuitive inspiration for NbE 
<!-- Copy and paste the intuition from our draft -->

# A quick review of NbE Proof


# Dynamism
Due to the power of category theory, we can stick with reduction-free style and has a clear math semantic. However, this does bring challenge on understanding how under the hood NbE is running and doing 'beta reduction' and 'eta expansion'.


Looking closely at the definition of NbE, 
```Haskell
nf : Tm Γ T → Nf Γ T
nf t =  ((↓Ty T Γ) ∘ ⟦ t ⟧Γ  ∘ (↑Con Γ Γ)) (id')
```
We notice that the key ingredient of the correctness of `nf` comes from the fact that, we have a good 'denotation', i.e.  `⟦ ⟧` 

## How denotation looks like

## Explicit Substitution

## Beta-reduction

## Eta-Expansion

