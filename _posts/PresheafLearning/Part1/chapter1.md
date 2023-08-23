## Page 20

[Q.]() `f` is a monomorphism/epi `Y → X` iff ``fᶜ : Y(C) → X(C)` is set-theoretical injection/surj, for every C ∈ ℂ.

By Yoneda, we know  Hom(ℂ(C, -), Y) ≅ Y(C), 
s.t. Φ ↦ Φ(C)(id)
     y ↦ λ g . 

Since we have a ∈ Y(C), by yoneda, we will have a *unqiue  corresponding* `a' ∈ Hom(ℂ(C, -), Y)`, s.t. `a'(C)(id) = a` 
thus (*) `a' = b'` iff `a = b`
and also `f ∘ a' ∈ Hom(ℂ(C, -), Y)`
again by yoneda back, we will have a *unique corresponding* `(f ∘ a')(C)(id) = f(C)(a'(C)(id)) = fᶜ(a)`

Thus (*) `fᶜ(a) = fᶜ(b)` iff `f ∘ a' = f ∘ b'` 

#### For monomorphism <-> injection
(=>) Now given monomorphism of f, say `fᶜ(a) = fᶜ(b)`,  we will have `f ∘ a' = f ∘ b'` by monomorphism, we have `a' = b'` and thus `a = b`
(<=) is similar

***

#### For epimorphism <-> surjection
Y(f)(g) := f ∘ g 
Given f : Y → X, 

(=>) Given epi, for arbitrary Z, `u v : X → Z`, `u ∘ f = v ∘ f ⇒ u = v`
      Given x ∈ X(C), if x ∉ img(f),  
      then we define χ₁ and χ₂ only different in input x,
      and thus χ₁ ∘ f = χ₂ ∘ f → χ₁ = χ₂, a contradiction

     
(<=) Given surjection,   
    natural transformation only decides by its data on object, so it is immediate

***

Another way : f is mono iff Y(f) := (f ∘ -) is injective 