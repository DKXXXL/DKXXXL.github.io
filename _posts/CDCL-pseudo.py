# CDCL : AssignmentTrail × CNF × LearnedClause → FullAssignment ∪ {UNSAT}
def CDCL(φ, f, lc):
  # **we will maintain the invariance ((f ∧ gₙ) → dₙ)**
  # ** and the invariance f ⊨ lc **
  if some_frequency_achieved(): # doing restart!
    return CDCL([('∅','∅')], f, lc)
  if some_frequency_achieved(): # doing forget!
    return CDCL(φ, f, forget_some(lc))
  bcp = BCP(φ, f + lc) 
  # Assume BCP : AssignmentTrail × CNF → FullAssignment ∪ {CONFLICT}
  if bcp == 'CONFLICT':
    if len(φ) == 1: # No Decision Variable yet!
      return 'UNSAT'
    else: # Do Conflict Analysis and BackTrack!
      NewClause = ConflictAnalysis(φ, f, lc) # !!! PARAMETRIZED !!!
      # only assume f ⊨ NewClause, NewClause ∉ lc
      #   can return empty if no new clause
      ψ = BackTrack(φ, f, lc + NewClause)    # !!! PARAMETRIZED !!!
      # only assume ψ ⊆ φ
      return CDCL(ψ, f, lc + NewClause)
  else: # no Conflict!
    ψ = bcp # update dₙ, there are newly deduced literals
    if FullyAssigned(ψ, f):
      return ψ[-1] # return the tail (gₙ, dₙ) of the assignment trail
    else: # Not fully assigned, we need to do some decision
      ψ = Decide(φ, f, lc)
      return CDCL(ψ, f, lc)
# Assignment Trail φ is encoded as a stack of pair of list
#    i.e. φ = [(g₁, d₁),(g₂, d₂),..(gₙ, dₙ)]
#    where gₙ is all the decision(guessed) literals
#          dₙ is all the deduced literals, including gₙ
#       and every time a new decision literal is added, 
#           φ will add a new (gₙ₊₁, dₙ₊₁) at the end
#    however newly deduced literal will just stick to the end dₙ
#   **we will maintain the invariance ((f ∧ gₙ) → dₙ)**




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