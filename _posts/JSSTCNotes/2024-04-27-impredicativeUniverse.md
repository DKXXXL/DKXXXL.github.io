In this post, we review/sort out the definition and construction of proof-relevant impredicative universe.

Ref
1. https://arxiv.org/pdf/2210.02169 def 2.1
2. https://www2.mathematik.tu-darmstadt.de/~streicher/REAL/REAL.pdf realizability topos
3. https://www2.mathematik.tu-darmstadt.de/~streicher/NOTES/UniTop.pdf definition of Universe
4. https://www.danielgratzer.com/papers/phd-thesis.pdf definition of universe
5. https://www.math.mcgill.ca/rags/LCCC/LCCC.pdf LCCC interpretation of dependent type
6. https://cstheory.stackexchange.com/a/37712/40632 correct formulation of impredicativity
7. https://proofassistants.stackexchange.com/a/1836/455 correct impredicative data encoding
8. Revisiting the categorical interpretation of dependent type theory 
9. https://www.cs.cmu.edu/~rwh/students/sterling.pdf Sterling Thesis
***

# Review Impredicativity
[Ref 6] and [Ref 1, Def 2.1]
The key point is that, even impredicativity doesn't gives us `Ω : Ω` which is automatically causing inconsistency.

The correct formulation of impredictive `Type` is `A : BigType`, `B : Type`, then `(∀ A B) : Type`. 
This is useful in a lot of situation.



# We have dependent product closed under 𝒮
We use the universe definition in [Ref 3] (and [Ref 4]).

Following [Ref 3, Def 2.1],
the universe 𝒮 is a set of morphisms in the category .

[Ref 3, Def 2.1∗(4)], mentions how dependent product is closed under 𝒮
> Given `f : A → I ∈ 𝒮` and `g : B → A ∈ 𝒮`, then `∏f g : 𝒞/I ∈ 𝒮`


## We unfold this definition a bit:

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

# 𝒮 and 𝒰
The universe 𝒮 is a set of morphisms in the category.
The generic family/map `El : E → 𝒰` is defined in [Ref 3, Def 2.1] (and [Ref 4, Def 3.2.10]), basically it weakly classifies the morphisms in 𝒮.

One way to look at 𝒮 and 𝒰 is that:
1. an arrow `𝑇 ∈ 𝒮` stands for a corresponding type judgement `𝑇` `Γ ⊢ 𝑇 type`, as in the interpretation, we can consider arbitrary arrow as a type
2. `𝑇 : Γ → 𝒰` as an arrow corresponds to `Γ ⊢ 𝑇 : 𝒰`, the code of type 

# We have dependent product closed under 𝒮's generic family 𝒰

Now we know what it means to have dependnet product in 𝒮, as 𝒰 is so strong, we should have a similar definition:
"What it means that 𝒰 equips dependent product type?"

This is covered by [Ref 4, Lemma 3.2.13] and [Ref 9, §3.2∗4].


# We have cumulative universe
and thus especially for `x : 𝒰0 ⊢ T : 𝒰0`  we have  `((x : 𝒰0) → T x) ：𝒰1`


# If we have impredicative universe
contrary to above, when given `x : 𝒰 ⊢ T : 𝒰`  we have  `((x : 𝒰) → T x) ：𝒰`

# We have dependent product closed under 𝒮's generic family 𝒰, impredicative
So the correct categorical formulation of impredicative universe, with respect to that generic mapping 𝒰, is 
# Realizability Topos has this impredicative universe

