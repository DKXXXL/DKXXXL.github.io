# CDCL : AssignmentTrail × CNF × LearnedClause → FullAssignment ∪ {UNSAT}
def CDCL(φ, f, lc):
  # Assignment Trail φ is encoded as a stack of pair of list
  #    i.e. φ = [(g₁, d₁),(g₂, d₂),..(gₙ, dₙ)]
  # **we will maintain the invariance ((f ∧ lc ∧ gₙ) ⊨ dₙ)**
  # ** and the invariance f ⊨ lc **
  # precondition: partial assignment φ(f + lc) ≠ ⊥
  bcp = BCP(φ, f + lc) 
  # Assume BCP : AssignmentTrail × CNF → FullAssignment ∪ {CONFLICT}
  if bcp == 'CONFLICT': 
    # 'CONFLICT' by BCP means: we find a resolution proof φ ∧ f ∧ lc ⊢ᵣ ⊥
    if len(φ) == 1: # No Decision Variable yet!
      return 'UNSAT'
    else: # Do Conflict Analysis and BackTrack!
      ncs = ConflictAnalysis(φ, f, lc) # !!! PARAMETRIZED !!!
      # only assume post condition f ⊨ ncs, ncs are brand new for lc
      #   only return empty if no new clause can be deduced
      ψ = BackTrack(φ, f, lc + ncs)    # !!! PARAMETRIZED !!!
      # only assume post condition len(ψ) < len(φ), ψ(f+lc+ncs) ≠ ⊥
      return CDCL(ψ, f, lc + ncs)
  else: # no Conflict! by BCP: bcp(f + lc) ≠ ⊥
    ψ = bcp # update dₙ, there are newly deduced literals
    if FullyAssigned(ψ, f):
      return ψ[-1] # return the tail (gₙ, dₙ) of the assignment trail
    else: # Not fully assigned, we need to do some decision
      ψ = Decide(ψ, f, lc) # only assume post-cond: len(ψ) > len(φ)
      # ψ(f + lc) ≠ ⊥, because of BCP
      return CDCL(ψ, f, lc)
# Assignment Trail φ is encoded as a stack of pair of list
#    i.e. φ = [(g₁, d₁),(g₂, d₂),..(gₙ, dₙ)]
#    where gₙ is all the decision(guessed) literals
#          dₙ is all the deduced literals, including gₙ
#       and every time a new decision literal is added, 
#           φ will add a new (gₙ₊₁, dₙ₊₁) at the end
#    however newly deduced literal will just stick to the end dₙ
#   **we will maintain the invariance ((f ∧ gₙ) → dₙ)**
# if some_frequency_achieved(): # doing restart!
#   return CDCL([('∅','∅')], f, lc)
# if some_frequency_achieved(): # doing forget!
#   return CDCL(φ, f, forget_some(lc))

def BCP(x, y):
  pass

def ConflictAnalysis(x, y, z):
  pass 

def BackTrack(x,y,z):
  pass

def FullyAssigned(x, y):
  pass

def Decide(φ, f, lc):
  pass

def some_frequency_achieved():
  pass