Now we define canonicity model M, using extension type

M: { STLC | ¶ → Syn }

<!-- 

we need to use refinement type to construct M. ty.

because of the incompetency of the original dependent pair we can try either.

  M.ty = (σ : S.ty) × { Set | ¶ ↪ S.el σ}
  M.tm : {? | ¶ ↪ S.el } ⊆ M.ty → Set
  M.tm σ* = σ*.₂

  -- or 
  M.ty = (σ : S.ty) × ⚈{ Set | ¶ ↪ S.el σ}


the first one won't work because ¶ ↪ M.ty ≡ (σ : S.ty x S.el σ)

the second one we cannot have ¶ ↪  M.tm ≡ S.el

but we need dependent pair somehow to make el work, so we need refinement type

-- but we need to look at M.tm first to see how to construct M.ty

-->

M.ty : { STLC | ¶ ↪ S.ty }

<!-- thus -->

M.ty = [¶ ↪ T: S.ty | ? ]

<!-- then by judgemental equality, we will have ¶ => M.ty = S.ty -->

M.el : { ? | ¶ ↪ S.el} ⊆ M.ty → Set

M.el T* : { ? | ¶ ↪ S.el T} ⊆ Set

<!-- --so we simply  -->

M.el T*: { Set | ¶ S.el T } = Set

and make this term into M.ty

I

M.ty [¶ T: S.ty | Set | ¶ S.el T } ]

and this Set ¶ S.el T is sealed so it is well-formed type

M.el T* T*.2

Now we head for function type, still the old story, we

M.arr ? ¶ S.arr} M.ty M.ty M.ty