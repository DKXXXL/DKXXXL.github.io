
-- Substitution Calculus, simple form -- there is no 
-- this is restricting the type for arbitrary `category`/`algebra` 
--   Interestingly, modern gluing argument doesn't require initiality from the first place 

record SimpleSC where 
  field 
    Con : Set 
    Ty  : Set 
    Tms : Con → Con → Set 
    Tm : Con → Ty → Set  
    ∙   : Con
    _▹_ : Con → Ty → Con
    _∘_ : Tms Θ ∆ → Tms Γ Θ → Tms Γ ∆
    id  : Tms Γ Γ
    ε   : Tms Γ ∙ 
    _,_ : (σ : Tms Γ ∆) → Tm Γ A → Tms Γ (∆ ▹ A)
    π₁ : Tms Γ (∆, A) → Tms Γ ∆

    _[_] : Tm Θ A → (σ : Tms Γ Θ) → Tm Γ A
    π₂ : (σ : Tms Γ (∆, A)) → Tm Γ A
    -- How to incorporate it with rewriting from agda?
    [][] : t[σ][ν] ≡ t[σ ◦ ν]
    ◦◦ : (σ ◦ ν) ◦ δ ≡ σ ◦ (ν ◦ δ)
    id◦ : id ◦ σ ≡ σ
    ◦id : σ ◦ id ≡ σ
    εη : {σ : Tms Γ ∙} → σ ≡ ε
    π₁β : π₁ (σ, t) ≡ σ

    πη : (π₁ σ, π₂ σ) ≡ σ
    ,◦ : (v, t) ◦ σ ≡ (v ◦ σ), t[σ]
    π₂β : π2 (σ, t) ≡ t (by π₁β)



record SimpleArrow (C : SimpleSC) where where 
  field 
    ⇒ : Ty → Ty → Ty
    lam : Tm (Γ, A) B → Tm Γ (⇒ A B)
    app : Tm Γ (⇒ A B) → Tm (Γ, A) B
    ⇒β : app (lam t) ≡ t
    ⇒η : lam (app t) ≡ t
    lam[] : (lam t)[σ] ≡ lam (t[σ ↑ A]) 



record SimplBoolean (C : SimpleSC) where
  field 
    𝔹 : Ty  -- boolean type
    tt : Tm Γ 𝔹
    ff : Tm Γ 𝔹
    -- do we want below or not?
    -- ifb : Tm Γ 𝔹 → Tm Γ A → Tm Γ A → Tm Γ A
    -- ifbβ₁:
    --   ifb tt a b ≡ a
    -- ifbβ₁:  
    --   ifb ff a b ≡ b



-- we show how to construct Canonicity Model
--   a glued model
module canonicity_SimpleSC where 

  canonicity_simplesc : SimpleSC → SimpleSC
  -- define each component in below, based on M
  -- SimpleSC.Con canonicity_simplesc = ... 
  section : SimpleSC → SimpleSC
  -- we also need to show section of canonicity model, i.e. we can get the original model back
  section= : section (canonicity_simplesc M) ≡ M


module canonicity_SimpleArrow where 
  canonicity_simplearrow : {M : SimpleSC} {MA : SimpleArrow M} → SimpleArrow (canonicity_simpleSC M)
  section : SimpleArrow (canonicity_simpleSC {M} {MA}) → SimpleArrow M
  section= : {M} {MA} → section (canonicity_simplearrow {M} {MA}) ≡ MA 

module canonicity_SimpleArrow (M : SimpleSC) where
  -- we will construct a canonicity model upon the above canonicity model
  canonicity_simplearrow : (SimpleArrow (canonicity_SimpleSC(M).canonicity_simpleSC))

-- similarly for boolean