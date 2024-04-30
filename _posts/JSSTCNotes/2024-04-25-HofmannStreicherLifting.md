We review the Hofmann-Stricher Lifting of the universe.
We start with reviewing the concept of the universe, generic family and their type-connective closure.
We compute several example to get the concrete feeling of Hofmann-Stricher Generic Family.

Ref
1. https://www2.mathematik.tu-darmstadt.de/~streicher/NOTES/UniTop.pdf definition of Universe
2. https://www.danielgratzer.com/papers/phd-thesis.pdf definition of universe
3. https://www.math.mcgill.ca/rags/LCCC/LCCC.pdf LCCC interpretation of dependent type
4. Revisiting the categorical interpretation of dependent type theory 
5. https://www.cs.cmu.edu/~rwh/students/sterling.pdf Sterling Thesis
6. https://www2.mathematik.tu-darmstadt.de/~streicher/NOTES/lift.pdf Lifting

***

# Universe and Generic Family
## We have dependent product closed under 𝒮
We use the universe definition in [Ref 3] (and [Ref 4]).

Following [Ref 3, Def 2.1],
the universe 𝒮 is a set of morphisms in the category .

[Ref 3, Def 2.1∗(4)], mentions how dependent product is closed under 𝒮
> Given `f : A → I ∈ 𝒮` and `g : B → A ∈ 𝒮`, then `∏f g : 𝒞/I ∈ 𝒮`


### We unfold this definition a bit:

[Ref 5, Def 4.4.1] and [Ref 8, §3]
tells us how to interpret dependent type in LCCC.

Basically given 
```C
Γ ⊢ A; Γ, A ⊢ B 
----------------
Γ ⊢ ∏ A B
```
we interpret each context as object, and each type judgemnt `Γ ⊢ A`, as the morphism `𝐴 : Γ.A → Γ`. Due to certain syntax rule in depndent type theory, `Γ.A` will have the "same" interpretation as `∑ Γ A`, so they are quite close. 

Thus this rule we have `𝐴 : Γ.A → Γ`， `𝐵 : Γ.A.B → Γ.A`
and `∏ 𝐴 : 𝒞/(Γ.A) → 𝒞/Γ`
and thus `∏ 𝐴 𝐵 : 𝒞/Γ` is the type `∏ A B` we want. We can further verify its intro,elim, computation, rules to see this is a correct definition.


Thus [Ref 3, Def 2.1∗(4)] as part of the universe definition can cover the closure of dependent function.

## Universe 𝒮 and Generic Family 𝒰
The universe 𝒮 is a set of morphisms in the category.
The generic family/map `El : E → 𝒰` is defined in [Ref 3, Def 2.1] (and [Ref 4, Def 3.2.10]), basically it weakly classifies the morphisms in 𝒮.

One way to look at 𝒮 and 𝒰 is that:
1. an arrow `𝑇 ∈ 𝒮` stands for a corresponding type judgement `𝑇` `Γ ⊢ 𝑇 type`, as in the interpretation, we can consider arbitrary arrow as a type
2. `𝑇 : Γ → 𝒰` as an arrow corresponds to `Γ ⊢ 𝑇 : 𝒰`, the code of type 

We will say an object `T` resides in `𝒮` when the terminal map `T → 1` is in `𝒮`, according to the above interpretation, this simply means `⊢ T type` is a valid type judgement.

# Hofmann-Stricher Lifting (HS Lifting) of the universe
[Ref 6] is the main reference about lifting a universe into generic family. 
Its notation is a bit too unfamiliar for the PL people, we will unfold and explain it.

We fix `𝒞` as a 𝒰-small category. In other words, there is a grothendieck universe 𝒰. Thus `𝒞.obj, 𝒞.Hom ∈ 𝒰`.
HS lifting is about making a set `𝒰` into a generic family `𝑈` in `Pr(𝒞)`. 

The main insight this can work is that
1. The 𝒰-small presheaf and dependent presheaf `A ⊢ B` , their dependent product `∏ A B` is still 𝒰-small
2. The `𝒰`-small presheaf [Ref 6, Page 1] is `𝑈`-small in presheaf topos [Ref 5, ], i.e. these two definitions, set-theoretic and category-theoretic, coincides

We will

1. `F ∈ Pr(𝒞)` is small iff `F(I) ∈ 𝒰` for all `I ∈ 𝒞`
2. Recall the equivalence between `P(𝒞)/F` ≅ `Pr(∫F)`, where `∫F` is the category of element of a presheaf `F`
3. 
