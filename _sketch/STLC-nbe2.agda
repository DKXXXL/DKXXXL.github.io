-- This is just a sketch of twisted gluing

-- work in an extensional type theory, to formalize in agda, that
--    would be allowing UIP, axiom K, rewriting
-- don't consider Cubical first 

record Category : Set where
  ob : Set 
  mor : ob → ob → Set
  _∘_ : mor B C → mor A B → mor A C 
  id : mor A A 
  idL : id ∘ f = f 
  idR : f ∘ id = f 
  ∘-assoc : (a ∘ b) ∘ c ≡ a ∘ (b ∘ c)

record Functor (C D : Category) where 
-- as expected
  F₀ : C.ob → D.ob 
  F₁ : C.mor 



-- Natural transformation only on presheaf. We don't want too generalized and too verbosed
record NatTrans {C D: Category} (F G : Functor C D) : Set where 
  FG₀ : ∀ (X : C.ob) → F₀ X → G X 
  FG₁ : {h : C.mor Γ Γ'}  → FG₀ ∘ (F₁ h) ≡ (G₁ h) ∘ FG₀




-- maybe need universe level
SetCat : Category 


PSh (C : Category) : Category 
-- Define as expected
ob (Psh C) = Functor C.ob SetCat
mor (Psh C) X Y = NatTrans X Y  
-- ...


-- we have to postulate the initial for the ↓Con and ↓Ty
--    and so on
postulate 
  iTy : Set 

-- record PSh {c : Category} : Set where
--   open Category c 
--   field F₀ : ob → Set 
--         F₁ : mor Γ Γ' → F₀ Γ' → F₀ Γ

-- record PShR : Set where
--   field F₀ : Con → Set 
--         F₁ : Ren Γ Γ' → F₀ Γ' → F₀ Γ
-- we need to single out Con and Ty
--   because they will both be used in Tms and Ren category
-- module Contextual
data iCon {Ty : Set} : Set where 
  ⋅ : Con 
  _▷_ : Con → Ty → Con  

-- data Ren where 


Ren-Cat : Category 
-- define as expected

PShR = PSh Ren-Cat

-- YR₀ {X} (f : Con → X → Set) : X → PShR.ob
-- YR₀ f x = λ Γ → f Γ x





-- Yoneda embedding
YE {C : Category} {X : C.ob} : X → (PSh C).ob -- that is X → Functor C.ob SetCat
-- YE x = λ Γ → (C.mor Γ x)

-- Yoneda Embedding into renaming category, 
--  mapping each object in renaming category into a functor, and thus 
--    an object in PShR 
YR {X : Ren-Cat.ob} : X → PShR.ob 

-- the above might not be useful



-- Simpler notation -- actually natural transformation
_⇒_: PShR.ob → PShR.ob → Set
X ⇒ Y = PShR.mor X Y

-- YRren : (ar : Ren-Cat.mor A B) → (YR B) ⇒ (YR A)
-- expected


-- natural transformation
-- record _↠_ : (F : PShR) → (G : PShR) → Set where
--   field FG₀ : {Γ : Con} → F₀ Γ → G₀ Γ
--         FG₁ : {h : Ren Γ Γ'}  → FG₀ ∘ (F₁ h) ≡ (G₁ h) ∘ FG₀

-- Substitution Calculus, simple form -- there is no 
-- this is restricting the type for arbitrary `category`/`algebra` 
--   Interestingly, modern gluing argument doesn't require initiality from the first place 
-- we are more syntax and will call it simple substituion calculus,
--    somehow, this is a contextual category
record SimpleSC where 
  field 
    Con : Set -- this Con is different from that Con
    Ty  : Set 
    ∙   : Con
    _▹_ : Con → Ty → Con
    Tms : Con → Con → Set 
    Tm : Con → Ty → Set  
    _∘_ : Tms Θ ∆ → Tms Γ Θ → Tms Γ ∆
    id  : Tms Γ Γ
    ε   : Tms Γ ∙ 
    _,_ : (σ : Tms Γ ∆) → Tm Γ A → Tms Γ (∆ ▹ A)
    π₁ : Tms Γ (∆, A) → Tms Γ ∆

    _[_] : Tm Θ A → (σ : Tms Γ Θ) → Tm Γ A
    π₂ : (σ : Tms Γ (∆, A)) → Tm Γ A

    [][] : t[σ][ν] ≡ t[σ ◦ ν]
    ◦◦ : (σ ◦ ν) ◦ δ ≡ σ ◦ (ν ◦ δ)
    id◦ : id ◦ σ ≡ σ
    ◦id : σ ◦ id ≡ σ
    εη : {σ : Tms Γ ∙} → σ ≡ ε
    π₁β : π₁ (σ, t) ≡ σ

    πη : (π₁ σ, π₂ σ) ≡ σ
    ,◦ : (v, t) ◦ σ ≡ (v ◦ σ), t[σ]
    π₂β : π2 (σ, t) ≡ t (by π₁β)


record Arrow (C : SimpleSC) where 
  open SimpleSC C 
  field 
    Π : Ty → Ty → Ty
    lam : Tm (Γ, A) B → Tm Γ (⇒ A B)
    app : Tm Γ (⇒ A B) → Tm (Γ, A) B
    Πβ : app (lam t) ≡ t
    Πη : lam (app t) ≡ t
    lam[] : (lam t)[σ] ≡ lam (t[σ ↑ A]) 

record Boolean (C : SimpleSC) where 
  open SimpleSC C
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

-- Now we construct the presheaf model as part of the SimpleSC
PresheafModel : SimpleSC
Con PresheafModel = PShR.ob 
Ty  PresheafModel = PShR.ob -- possibly ok
Tms PresheafModel = PShR.mor
Tm  PresheafModel = PShR.mor -- possibly ok
-- ... omitted a lot


-- Next we need embed (Tms ⋅ T) into PShR
--    also a lot functor in type of Con →  Set 
YRTm : {C : SimpleSC} → C.Ty → PShR.ob -- ≡ Functor()
-- YRTm T = λ Γ → (C.Tm Γ T), ... naturality because we have renaming embedding into Tms
YRTms : {C : SimpleSC} → C.Con → PShR.ob
-- YRTm Δ  = λ Γ → (C.Tms Γ Δ)

YRNf : {C : NormalSC} → C.Ty → PShR.ob
-- YRNf T = λ Γ → (C.Tm Γ T), ... naturality because we have renaming embedding into Nfs

-- similarly, we have YRNfs, YRNe, YRNes

record NTy  (C : SimpleSC) where 
  T : C.Ty 
  PT : PShR.ob 
  ↓Ty : PT ⇒ YRNf T 
  ↑Ty : YRNe T ⇒ PT
  Rnf : YRNf T ⇒ YRTm T
  Rne : YRNe T ⇒ YRTm T


NormalizationModel : (C : SimpleSC) → SimpleSC
Ty NormalizationModel = NTy 

 

```




# Concrete Proof

Apart from `Tm, Tms`, 
now we will have `Nf, Nfs, Ne, Nes`, all with signature `Con → Ty → Set`.

We will use `YR` prefix to indicate the embedding into presheaf over renaming category --
 i.e. `YRTm T Γ = Tm (i Γ) T`.
The difference between it and flipping is that, we know `YRTm T` can only input object and arrows from renaming
category -- the object is still those context, but the arrows have to be renaming



We now define the  presheaf(over renaming) model, we postfix M to indicate the model. 
Note that, when syn

Before beginning, I need to define natural transformation between two presheaves (over renaming category)
```C++
-- For presheaf F : Con/Ty → Set, we will have F acting a functor s.t.
-- Fᵒ : {X Y : Con} {F: Con → Set} →  (f : Tm  X Y) →  Tm  (F X) (F Y)
Fᵒ : {X Y : Con} {F: Con → Set} →  (f : Ren X Y) →  (F X) → (F Y)


-- the we define  ↠
↠ :  (Con → Set) → (Con → Set) → Set
-- the we define  ↠, four variants, we will not trying to disambiguiate them notationally
-- F ↠ G = ∑ η : (Γ : Con) → (F Γ) → (G Γ), ∀ {f : Tm  X Y},  ηY ∘ (Fᵒ f) = (Gᵒ f) ∘ ηX
-- F ↠ G = ∑ η : (Γ : Con) → (F Γ) → (G Γ), ∀ {f : Ren X Y},  ηY ∘ (Fᵒ f) = (Gᵒ f) ∘ ηX
-- let's make it weaker by remove naturality condition
F ↠ G = (Γ : Con) → (F Γ) → (G Γ)
-- ↠ :  (Con → Set) → (Ty → Set) → Set
-- F ↠ G = ∑ η : (x : Con) → Tm (F x) (G x), ∀ {f : Tm  X Y},   ηY ∘ (Fᵒ f) = (Gᵒ f) ∘ ηX
-- F ↠ G = ∑ η : (x : Con) → Tm (F x) (G x), ∀ {f : Tms X Y},   ηY ∘ (Fᵒ f) = (Gᵒ f) ∘ η

Psh

```





```C++
ConM : Set
ConM = ∑ f : Con → Set . ∀ Δ Θ, Ren Θ Δ → f Δ → f Θ
TyM  : Set
TyM  = ∑ T. YRTm T


TmsM : ConM → ConM → Set
TmsM ⟦Γ⟧ ⟦Δ⟧ =  ⟦Γ⟧.0 ↠ ⟦Δ⟧.0 
-- natural transformation!
TmM : ConM → TyM → Set
TmM ⟦Γ⟧ ⟦A⟧ = ⟦Γ⟧.0 ↠ ⟦A⟧.0
-- This part seems a bit awkward


⋅M : ConM 
⋅M  = (λ_. ⊤, _) 

-- Presheaf on a CCC is still a presheaf, thus we will use the same construction as presheaf ccc guiding
_▹M_ : ConM → TyM → ConM
⟦Γ⟧ ▹M ⟦A⟧ = λΔ. (⟦Γ⟧Δ) × (⟦A⟧Δ)

_∘M_ : TmsM Θ ∆ → TmsM Γ Θ → TmsM Γ ∆
-- composition of natrual transformation is still a natural transformation, so we will elide this part

idM : TmsM ⟦Γ⟧ ⟦Γ⟧
-- identity natural transformation ...

εM   : TmsM ⟦Γ⟧ ⟦⋅⟧
-- presheaf as CCC so it still has terminal object

_,M_ : TmsM ⟦Γ⟧ ⟦Δ⟧ → TmM ⟦Γ⟧ ⟦A⟧ → TmsM ⟦Γ⟧ (⟦Δ⟧ ▹M ⟦A⟧)
σM ,M tM : (X : Con) → ⟦Γ⟧X → (⟦Δ⟧ ▹M ⟦A⟧)X
         ≡ (X : Con) → ⟦Γ⟧X → ⟦Δ⟧X × ⟦A⟧X

π₁M : TmsM ⟦Γ⟧ (⟦Δ⟧ ▹M ⟦A⟧) → TmsM ⟦Γ⟧ ⟦Δ⟧
π₂M : TmsM ⟦Γ⟧ (⟦Δ⟧ ▹M ⟦A⟧) → TmM ⟦Γ⟧ ⟦A⟧
-- product of presheaf

_[_]M : TmM ⟦Θ⟧ ⟦A⟧ →  TmsM ⟦Γ⟧ ⟦Θ⟧ → TmM ⟦Γ⟧ ⟦A⟧
-- still compositionality of natural transformation


-- function is still the exponential of presheaf, we rolled out the definition here
-- it seems like this is the only place YRen appear (i.e. renaming category appear)
--    because other places, renaming category has the same object as Tms category

-- but Sterling says it should be pullback in presheaf category
--    which is usually point-wise pullback

-- we try to use exponential of presheaf, and don't track it is definable stuff
--    to see what happens, especially if app rule will broken
⇒M : TyM → TyM → TyM
AM ⇒M BM : TyM = Con → Set
AM ⇒M BM = λ Γ. (YRTms Γ) × AM ↠ BM

-- When trying to reify, we can input ((YRTms Γ) × AM ↠ BM) with (Γ  ▹M AM)
--      then we will have ((YRTms Γ ((Γ  ▹M AM))) × AM ((Γ  ▹M AM)) ↠ BM ((Γ  ▹M AM)))
--    which gives us BM ((Γ  ▹M AM)) easily, and should be able to get back to Γ ⊢ AM ⇒ BM
--    but currently it has problem on reification....


-- the following constructor and eliminator should be the same
--    as the presheaf CCC
lamM : TmM (ΓM ▹M AM) BM → TmM ΓM (AM ⇒M BM)
     ≡ ((ΓM ▹M AM) ↠ BM) →  ΓM ↠ (AM ⇒M BM)
lamM t Δ :  ΓM Δ  → YRTms Δ × AM ↠ BM
lamM t Δ γ Θ : YRTms Δ Θ × AM Θ → BM Θ
lamM t Δ γ Θ (t₁, t₂) : BM Θ
  let t₀ = t Θ: ΓM Θ × AM Θ → BM Θ
  let t₁ = t₀ (γ[t₁], t₂) : BM Θ 
  -- ... using presheaf
appM : TmM ΓM (AM ⇒M BM) → TmM (ΓM ▹M AM) BM 




𝔹M : TyM 
   = Con → Set
𝔹M = YRNf 𝔹

ttM : TmM ΔM 𝔹M = ΔM ↠ YRNf 𝔹
    ≡ (Γ : Con) → ΔM Γ → YRNf 𝔹 Γ 
ttM Γ _ = tt

ffM : TmM ΔM 𝔹M = ΔM ↠ YRNf 𝔹
    ≡ (Γ : Con) → ΔM Γ → YRNf 𝔹 Γ 
ffM Γ _ = ff

ifb cM aM bM : TmM 

```


```C++
ConM : Set
ConM = Con → Set
TyM  : Set
TyM  = Con → Set
TmsM : ConM → ConM → Set
TmsM ⟦Γ⟧ ⟦Δ⟧ = ⟦Γ⟧ ↠ ⟦Δ⟧  
-- natural transformation!
TmM : ConM → TyM → Set
TmM ⟦Γ⟧ ⟦A⟧ = ⟦Γ⟧ ↠ ⟦A⟧ 
-- This part seems a bit awkward


⋅M : ConM 
⋅M Γ = ⊤

-- Presheaf on a CCC is still a presheaf, thus we will use the same construction as presheaf ccc guiding
_▹M_ : ConM → TyM → ConM
⟦Γ⟧ ▹M ⟦A⟧ = λΔ. (⟦Γ⟧Δ) × (⟦A⟧Δ)

_∘M_ : TmsM Θ ∆ → TmsM Γ Θ → TmsM Γ ∆
-- composition of natrual transformation is still a natural transformation, so we will elide this part

idM : TmsM ⟦Γ⟧ ⟦Γ⟧
-- identity natural transformation ...

εM   : TmsM ⟦Γ⟧ ⟦⋅⟧
-- presheaf as CCC so it still has terminal object

_,M_ : TmsM ⟦Γ⟧ ⟦Δ⟧ → TmM ⟦Γ⟧ ⟦A⟧ → TmsM ⟦Γ⟧ (⟦Δ⟧ ▹M ⟦A⟧)
σM ,M tM : (X : Con) → ⟦Γ⟧X → (⟦Δ⟧ ▹M ⟦A⟧)X
         ≡ (X : Con) → ⟦Γ⟧X → ⟦Δ⟧X × ⟦A⟧X

π₁M : TmsM ⟦Γ⟧ (⟦Δ⟧ ▹M ⟦A⟧) → TmsM ⟦Γ⟧ ⟦Δ⟧
π₂M : TmsM ⟦Γ⟧ (⟦Δ⟧ ▹M ⟦A⟧) → TmM ⟦Γ⟧ ⟦A⟧
-- product of presheaf

_[_]M : TmM ⟦Θ⟧ ⟦A⟧ →  TmsM ⟦Γ⟧ ⟦Θ⟧ → TmM ⟦Γ⟧ ⟦A⟧
-- still compositionality of natural transformation


-- function is still the exponential of presheaf, we rolled out the definition here
-- it seems like this is the only place YRen appear (i.e. renaming category appear)
--    because other places, renaming category has the same object as Tms category

-- but Sterling says it should be pullback in presheaf category
--    which is usually point-wise pullback

-- we try to use exponential of presheaf, and don't track it is definable stuff
--    to see what happens, especially if app rule will broken
⇒M : TyM → TyM → TyM
AM ⇒M BM : TyM = Con → Set
AM ⇒M BM = λ Γ. (YRTms Γ) × AM ↠ BM

-- When trying to reify, we can input ((YRTms Γ) × AM ↠ BM) with (Γ  ▹M AM)
--      then we will have ((YRTms Γ ((Γ  ▹M AM))) × AM ((Γ  ▹M AM)) ↠ BM ((Γ  ▹M AM)))
--    which gives us BM ((Γ  ▹M AM)) easily, and should be able to get back to Γ ⊢ AM ⇒ BM
--    but currently it has problem on reification....


-- the following constructor and eliminator should be the same
--    as the presheaf CCC
lamM : TmM (ΓM ▹M AM) BM → TmM ΓM (AM ⇒M BM)
     ≡ ((ΓM ▹M AM) ↠ BM) →  ΓM ↠ (AM ⇒M BM)
lamM t Δ :  ΓM Δ  → YRTms Δ × AM ↠ BM
lamM t Δ γ Θ : YRTms Δ Θ × AM Θ → BM Θ
lamM t Δ γ Θ (t₁, t₂) : BM Θ
  let t₀ = t Θ : ΓM Θ × AM Θ → BM Θ
  -- using presheaf
appM : TmM ΓM (AM ⇒M BM) → TmM (ΓM ▹M AM) BM 




𝔹M : TyM 
   = Con → Set
𝔹M = YRNf 𝔹

ttM : TmM ΔM 𝔹M = ΔM ↠ YRNf 𝔹
    ≡ (Γ : Con) → ΔM Γ → YRNf 𝔹 Γ 
ttM Γ _ = tt

ffM : TmM ΔM 𝔹M = ΔM ↠ YRNf 𝔹
    ≡ (Γ : Con) → ΔM Γ → YRNf 𝔹 Γ 
ffM Γ _ = ff

ifb cM aM bM : TmM 

```
We will denote ⟦⟧ as the model mapping.


Then we have a series mutual recursive reflect `↑` and reification `↓`, and they are actually natural transformation in the presheaf (over renaming category) category

in the following, we are not sure if we impose naturality condition on ↠, or just think of it as a family of functions

We now write down *reflect* and *reify*,

```C++
↓Con : (Δ : Con) → ⟦ Δ ⟧  ↠ YRNfs Δ
↓Ty  : (A : Ty)  → ⟦ A ⟧  ↠ YRNf  A
    ≡  (A : Ty)  → (Γ : Con) → ⟦ A ⟧ Γ →  YRNf A Γ

↓Con ⋅ Γ : ⟦ ⋅ ⟧Γ  → YRNfs ⋅ Γ
↓Con ⋅ Γ _ = ε

↓Con (Θ ▹ X) Γ :  ⟦ (Θ ▹ X) ⟧ Γ → YRNfs (Θ ▹ X) Γ
              ≡  ⟦Θ⟧ Γ × ⟦X⟧ Γ → Nfs Γ (Θ ▹ X)
↓Con (Θ ▹ X) Γ (θ, x) =
  let σθ = ↓Con Θ Γ θ : Nfs Γ Θ
  let xθ = ↓Ty X Γ x : Nf Γ X
  in (σθ, xθ)


↓Ty B Γ : ⟦ B ⟧ Γ →  YRNf B Γ 
        ≡ YRNf B Γ → YRNf B Γ 
↓Ty B Γ = -- identity

↓Ty (X ⇒ Y) Γ : ⟦(X ⇒ Y)⟧ Γ → YRNf (X ⇒ Y) Γ
              ≡ ((YRTms Γ) × ⟦X⟧ ↠ ⟦Y⟧) → YRNf (X ⇒ Y) Γ
↓Ty (X ⇒ Y) Γ F = 
  let F₀ = F (Γ ▹ X) : YRTms Γ (Γ ▹ X) × ⟦X⟧ (Γ ▹ X) → ⟦Y⟧ (Γ ▹ X) 
  let t₁ = F₀ (π₁, ↑Ty X (Γ ▹ X) π₂) : ⟦Y⟧ (Γ ▹ X)
  let t₂ = (↓Ty Y (Γ ▹ X) t₁)        : YRNf Y (Γ ▹ X) 
  in (lam t₂)                        : YRNf (X ⇒ Y) Γ
= lam (↓Ty Y (Γ ▹ X) (F (Γ ▹ X) (π₁, ↑Ty X (Γ ▹ X) π₂)))
-- it seems like renaming category is not really necessary, but we definitely
--    need the "YRTms Γ (Γ ▹ X)", so the structure is at least enriched as renaming category
--    here you will have a feeling that we are working on original category
--    this is perfectly normal because we don't manipulate arrow here at all
--  we delete most information on naturality as well (not using natural transformation but directly family of function)

↑Con : (Δ : Con) → YRNes Δ ↠ ⟦ Δ ⟧
↑Ty  : (A : Ty)  → YRNe  A ↠ ⟦ A ⟧


↑Con ⋅ Γ : YRNes ⋅ → ⟦ ⋅ ⟧Γ  
↑Con ⋅ Γ _ = tt

↑Con (Θ ▹ X) Γ :  YRNes (Θ ▹ X) Γ → ⟦ (Θ ▹ X) ⟧ Γ 
              ≡   Nes Γ (Θ ▹ X)   → ⟦Θ⟧ Γ × ⟦X⟧ Γ
↑Con (Θ ▹ X) Γ (θ, x) =
  let σθ = ↑Con Θ Γ θ : ⟦Θ⟧ Γ
  let xθ = ↑Ty  X Γ x : ⟦X⟧ Γ
  in (σθ, xθ) : ⟦Θ⟧ Γ × ⟦X⟧ Γ

```

Thus the first invariant is that
 for t : Tm Γ T


 ⟦ t ⟧ : TmM ⟦ Γ ⟧ ⟦ T ⟧ = ⟦ Γ ⟧ ↠ ⟦ T ⟧
 ↓Ty T : ⟦ T ⟧  ↠ YRNf  T 
 Rnf T : YRNf T ↠ YRTm T

 ↓Con Γ :  ⟦ Γ ⟧  ↠ YRNfs Γ
 Rnf  Γ :  YRNf T ↠ YRTm T
 t[-] : Tms ? Γ → Tm ? T 
       = YRTms Γ ↠ YRTm T  -- Prove this to be a natrual transformation?
 
 and thus
 Rnf T ∘ ↓Ty T ∘ ⟦ t ⟧ ≡  t[-] ∘ Rnf Γ ∘ ↓Con Γ

 inj T ∘ ↓Ty T ∘ ⟦ t ⟧ ≡ t[-] ∘ inj Γ ∘ ↓Con Γ 
where t : Tm Γ T
      ⟦t⟧ : ⟦ Γ ⟧ ↠ ⟦ T ⟧
      t[-] : YRTms Γ ↠ YRTm T  -- a term waiting for substitution
      inj Γ : YRNf Γ ↠ YRTm Γ
      inj T : YRNf T ↠ YRTm T


 and there is a similar invariant for substitution

 The second invariant is that
  ↑Ty T : YRNe T ↠ ⟦ T ⟧
  ↓Ty T : ⟦T⟧   ↠ YRNf T
  Rnf T : YRNf T ↠ YRTm T

  Rne T : TNe T ↠ YRTm T

  and thus 
    Rnf T ∘ ↓Ty T ∘ ↑Ty T ≡ Rne T (reify and reflect yoga)
    Rnfs Γ ∘ ↓Con Γ ∘ ↑Con Γ ≡ Rnes Γ
inj Γ ∘ ↓Con Γ ∘ ↑Con Γ ≡ inj Γ
where ↑Con Γ : YRNes Γ ↠ ⟦ Γ ⟧
      ↓Con Γ : ⟦ Γ ⟧  ↠ YRNfs Γ
      inj Γ  : YRNfs Γ ↠ YRTms Γ
      inj Γ  : YRNes Γ ↠ YRTms Γ

  and there is a similar invariant for substitution

  Since we will define `nf : Tms Γ T → Nf Γ T` as 
  nf t =  ((↓Ty T Γ) ∘ ⟦ t ⟧Γ  ∘ (↑Con Γ Γ)) (id')

  we type check it :
   we need an id' : YRNes Γ Γ, 
    with Rnes Γ Γ id' = id : Tms Γ Γ

    ↑Con Γ Γ   : YRNes Γ Γ → ⟦ Γ ⟧Γ
    ⟦ t ⟧Γ     : ⟦ Γ ⟧Γ → ⟦ T ⟧Γ
    ↓Ty T Γ    : ⟦ T ⟧Γ → YRNf  T Γ
               = ⟦ T ⟧Γ →  Nf  Γ T

    Rnf T Γ    : Nf  Γ T → Tm Γ T

  the completeness is `inj T (nf t) ≡ t`, and can be proved by the above two invariance,
    this is directly copy and paste from Sterling
  Rnf T Γ (nf t) ≡ (↓Ty T Γ) ∘ ⟦ t ⟧Γ  ∘ (↑Con Γ Γ) (id')
    ≡ (Rnf T ∘ (↓Ty T) ∘ ⟦ t ⟧ ∘ (↑Con Γ)) Γ (id')
    ≡ ((t[-] ∘ Rnfs Γ  ∘ ↓Con Γ) ∘ (↑Con Γ)) Γ (id')   (by first invariance)
    ≡ (t[-]  ∘ Rnes Γ) Γ (id')  (by second invariance)
    ≡ t[-]Γ (Rnes Γ Γ id') ≡ t[-] Γ id ≡ t[id] ≡ t

inj T Γ (nf t) ≡ ((inj T Γ) ∘ (↓Ty T Γ) ∘ ⟦ t ⟧ Γ ∘ (↑Con Γ Γ)) (id')
≡ (inj T ∘ (↓Ty T) ∘ ⟦ t ⟧ ∘ (↑Con Γ)) Γ (id')    
          -- (they are all natural transform)
≡ ((t[-] ∘ inj Γ  ∘ ↓Con Γ) ∘ (↑Con Γ)) Γ (id')   -- (by second invariance)
≡ (t[-]  ∘ inj Γ) Γ (id')                         -- (by first  invariance)
≡ t[-]Γ (inj Γ Γ id') ≡ t[-] Γ id                 -- by definition
≡ t[id] ≡ t

    



Finally, we can specify the proof relevant logical relation proving the first invariant

## Logical Relation about it

Now we construct the dependent model for it, upon presheaf model, to track the completeness proof.


```C++
Con : Set
ConP : Con → Set
ConP Γ = ∑ f : ⟦ Γ ⟧ ↠ YRTms Γ. f ≡ Rnf Γ ∘ ↓Con Γ
-- ⟦ Γ ⟧ is parametric on the denotational model (presheaf model)

Ty : Set
TyP : Ty → Set
TyP T =  ∑ f : ⟦ T ⟧ ↠ YRTm T.  f ≡ Rnf T ∘ ↓Ty T

Tm : Con → Ty → Set
TmP : (Γ₂ : Con₂) → (T₂ : Ty₂) → Tm Γ T → Set
TmP Γ₂ T₂ t = 
  -- Rnf T ∘ ↓Ty T ∘ ⟦ t ⟧ ≡  t[-] ∘ Rnf Γ ∘ ↓Con Γ 
  Tₚ ∘ ⟦ t ⟧ ≡ t[-] ∘ Γₚ
-- where a is the element in the semantic domain related to t, but where does it come from? 
--    how to consider binary relational logic as categorical gluing?
-- this is also the place where "definable function" is induced, this logical relation proposition
--    induces 

Tms : Con → Con → Set
TmP : (Γ₂ : Con₂) → (Δ₂ : Con₂) → Tms Γ Δ → Set
TmP Γ₂ Δ₂ σ = 
  -- Rnf T ∘ ↓Ty T ∘ ⟦ t ⟧ ≡  t[-] ∘ Rnf Γ ∘ ↓Con Γ 
  Δₚ ∘ ⟦ σ ⟧ ≡ (σ∘-) ∘ Γₚ


A₂ ⇒P B₂ : TyP (A ⇒ B) 

lamP : (t₂ : Tm₂ (Γ₂ ▹₂ A₂) B₂) → TmP Γ₂ (A₂ ⇒₂ B₂) (lam t)
lamP t₂ = 
  tₚ : Bₚ ∘ ⟦ t ⟧ ≡ t[-] ∘ (Γ₂ ▹ₚ A₂)
  -- we want to show 
  -- (A₂ ⇒ₚ B₂) ∘ ⟦ lam t ⟧ ≡ (lam t)[-] ∘ (Γₚ)

-- ⟦lam t⟧     : ⟦ Γ ⟧ ↠ ⟦A ⇒ B⟧ 
-- ↓Ty (A ⇒ B) : ⟦A ⇒ B⟧ ↠ YNf (A ⇒ B)
LHS = Rnf (A ⇒ B) ∘  ↓Ty (A ⇒ B) ∘ ⟦ lam t ⟧
-- let's see ↓Ty (A ⇒ B) ∘ ⟦ lam t ⟧
-- let γ : ⟦ Γ ⟧ Δ, π₁ : Tms (Δ ▹ A) Δ, γ[π₁] : ⟦ Γ ⟧ (Δ ▹ A)
(↓Ty (A ⇒ B) Δ ∘ ⟦ lam t ⟧ Δ) (γ)
= ↓Ty (A ⇒ B) Δ (λ Θ (t₁, t₂). ⟦t⟧ Θ (γ[t₁], t₂))
-- F = λ Θ (t₁, t₂). ⟦t⟧ Θ (γ[t₁], t₂)
-- F (Δ ▹ A) (π₁, ↑Ty A (Δ ▹ A) π₂) = ⟦t⟧ (Δ ▹ A) (γ[π₁], Ty A (Δ ▹ A) π₂)
= lam (↓Ty B (Δ ▹ A)  (⟦t⟧ (Δ ▹ A) (γ[π₁], ↑Ty A (Δ ▹ A) π₂)) )
= lam ((↓Ty B ∘ ⟦t⟧) (Δ ▹ A)  (γ[π₁], ↑Ty A (Δ ▹ A) π₂) )

(Rnf ∘ ↓Ty (A ⇒ B) Δ ∘ ⟦ lam t ⟧ Δ) (γ)
= lam (t[-] ∘ (Γ₂ ▹ₚ A₂) (Δ ▹ A)  (γ[π₁], ↑Ty A (Δ ▹ A) π₂) )
-- we need something like, (↓Con γ)[π₁] ≡ (↓Con γ[π₁])

appP : (t₂ : Tm₂ Γ₂ (A₂ ⇒₂ B₂)) → TmP (Γ₂ ▹₂ A₂) B₂ (app t) 
  tₚ : (A₂ ⇒ₚ B₂) ∘ ⟦ t ⟧ ≡ t[-] ∘ (Γₚ) 

-- we want to show 
-- (Bₚ) ∘ ⟦ app t ⟧ ≡ (app t)[-] ∘ (Γ₂ ▹ₚ A₂)
-- let's see ↓Ty B ∘ ⟦ app t ⟧
↓Ty B ∘ ⟦ app t ⟧
= 

BP :  TyP B 
    ≡ ∑ f : ⟦ B ⟧ ↠ YRTm B.  f ≡ Rnf B ∘ ↓Ty B
-- BP holds trivially

ttP : TmP Γ₂ B₂ tt
    ≡ (BP ∘ ⟦ tt ⟧ ≡ tt[-] ∘ Γₚ)

```

## Presheaf and natural transformation

```
data Var : Con → Ty → Set where
  vz : Var (Γ ▹ A) A
  vs : Var Γ A → Var (Γ ▹ B) A

data Ren : Con → Con → Set where
  ε : Ren Γ ⋅
  _,_ : Ren Γ Δ → Var Γ A → Ren Γ (Δ ▹ A)

-- we know these two are special kinds of Tm/Tms
var-as-tm  : Var Γ T → Tm Γ T
ren-as-tms : Ren Γ Δ → Tms Γ Δ



-- we assume it is already a CCC category
```
Using this notion, we also introduce YR as a helpful notion that
will map stuff into presheaf category

```
YRNfs : Con → PShR
YRNfs Δ = record {F₀ = λ Γ . Nfs Γ Δ ; F₁ = ..}
YRTms : Con → PShR
YRTms Δ = record {F₀ = λ Γ . Tms Γ Δ ; F₁ = ..}
YRNf  : Ty → PShR
YRNf  T = record {F₀ = λ Γ . Nf Γ T ; F₁ = ..}
YRTm, YRNe   ,..  : Ty → PShR
YRNes, YRRen ,..  : Con → PShR 
```

Basically for each kind of representation of terms, if we attach
YR in the front, then its argument flipped and is also a presheaf.


```haskell

ConM : Set
ConM = PShR
TyM  : Set
TyM  = PShR
TmsM : ConM → ConM → Set
TmsM ⟦Γ⟧ ⟦Δ⟧ = ⟦Γ⟧ ↠ ⟦Δ⟧  
-- natural transformation!
TmM : ConM → TyM → Set
TmM ⟦Γ⟧ ⟦A⟧ = ⟦Γ⟧ ↠ ⟦A⟧ 


⋅M : ConM 
⋅M = record {F₀ = λ_ . ⊤ ; F₁ = λ_ _. true}
-- directly use product object in presheaf category
_▹M_ : ConM → TyM → ConM
⟦Δ⟧ ▹M ⟦A⟧ = record {F₀ = λ Γ . ⟦Δ⟧Γ × ⟦A⟧Γ ; 
  F₁ (h : Ren Γ Γ') ((a , b) : ⟦Δ⟧Γ' × ⟦A⟧Γ') =  (⟦Δ⟧₁ h a, ⟦A⟧₁ h b)}

-- We use CCC similarly on other parts ...
-- ... now look at functions 
--    we use exponential of presheaf,
⇒M : TyM → TyM → TyM
⟦A⟧ ⇒M ⟦B⟧ : TyM = Con → Set
⟦A⟧ ⇒M ⟦B⟧ = record { F₀ Γ = (YRRen Γ × ⟦A⟧) ↠ (⟦B⟧) ; F₁ = .. }

-- When trying to reify, we can input ((YRTms Γ) × AM ↠ BM) with (Γ  ▹M AM)
--      then we will have ((YRTms Γ ((Γ  ▹M AM))) × AM ((Γ  ▹M AM)) ↠ BM ((Γ  ▹M AM)))
--    which gives us BM ((Γ  ▹M AM)) easily, and should be able to get back to Γ ⊢ AM ⇒ BM
--    but currently it has problem on reification....


-- the following constructor and eliminator should be the same
--    as the presheaf CCC
lamM : TmM (ΓM ▹M AM) BM → TmM ΓM (AM ⇒M BM)
     ≡ ((ΓM ▹M AM) ↠ BM) →  ΓM ↠ (AM ⇒M BM)
lamM t Δ :  ΓM Δ  → YRTms Δ × AM ↠ BM
lamM t Δ γ Θ : YRTms Δ Θ × AM Θ → BM Θ
lamM t Δ γ Θ (t₁, t₂) : BM Θ
  let t₀ = t Θ : ΓM Θ × AM Θ → BM Θ
  -- using presheaf
appM : TmM ΓM (AM ⇒M BM) → TmM (ΓM ▹M AM) BM 




𝔹M : TyM 
   = Con → Set
𝔹M = YRNf 𝔹

ttM : TmM ΔM 𝔹M = ΔM ↠ YRNf 𝔹
    ≡ (Γ : Con) → ΔM Γ → YRNf 𝔹 Γ 
ttM Γ _ = tt

ffM : TmM ΔM 𝔹M = ΔM ↠ YRNf 𝔹
    ≡ (Γ : Con) → ΔM Γ → YRNf 𝔹 Γ 
ffM Γ _ = ff

ifb cM aM bM : TmM 

```


## Normal and Neutral Form
```haskell

data Nf : Con → Ty → Set where
data Ne : Con → Ty → Set where
data Nfs : Con → Con → Set where
data Nes : Con → Con → Set where
  nenf : Ne Γ A → Nf Γ A
  lam : Nf (Γ ▹ X) Y → Nf Γ (X ⇒ Y)
  if   : Ne Γ B → Nf Γ A → Nf Γ A → Ne Γ A
  _,_  : Nfs Γ Δ → Nf Γ T → Nfs Γ (Δ ▹ T)
  _,_  : Nes Γ Δ → Ne Γ T → Nes Γ (Δ ▹ T)


```