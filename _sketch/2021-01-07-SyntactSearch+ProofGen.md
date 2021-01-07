---
layout: post
title:  "Syntactic Searching and Proof Term (trace) Generation"
date:   2021-01-07 00:56:11 -0400
categories: CS miniKanren
---
## Syntactic Searching

I will illustrate the whole design now with pseudo code aside.

There are two parts of goal solving, 

1. syntactical solving (structual pattern matching) and 
2. semantical solving (unification based/state changing) , the implemented (original one)

The intuition (issue?) with them is that they almost don't interact with each other (but just invoking each other). 

```Haskell

start :: Assumptions -> State -> Goal -> Stream 
start assumpt state g =
     mplus (syn assumpt assumpt state g) 
           (sem assumpt state g)


-- sem is the function that is basically the original `start`. 
-- sem will invoke start again all the time (remember `(pause st g)`? That has same specification as `(start st g)`)
sem :: Assumptions -> State -> Goal -> Stream 
sem assumpt state (== a b) = ..
sem assumpt state (=/= a b) = ..
-- All the parts are almost the same except for constructive implication
sem assumpt state (Cimpl antecident conseq) =
  (start (assumpt ++ antecident) state conseq)

-- syn is the one we are currently focusing on
syn :: Assumptions -> Assumptions -> State -> Goal -> Stream 
syn asmpt orgs 
```
`syn` will be recursive down on the first `asmpt` assumption argument, the second assumption `orgs` will leave untouched ...

.. (*thus used in another invocation of `start` using the same assumption base*) ..

Intuitively speaking, `syn` is just doing one job -- finding out one assumption that match/unifies exactly, and then one solution is found (of course it will continue the pattern matching to find more solution). 
```Haskell
syn ((a /\ b) : asmpt) utched state g =
  let one-solution = 
          (if (unifies (a /\ b) g) then ONESOLUTION else NONE)
      remain-solution = syn (a:b:asumpt) utched state g
      -- it continues to deconstruct (a/\b) into a b
      --   to see if there are more solutions using these two to pattern-match
  in (cons one-solution remains)
```

Note that, the unifies here is "exact unifying", not finding subpart to unify.

**Even though the above is written in a pattern matching form, the whole `syn` will actually be wrapped into a stream of computation**

*In other words, `syn` is actually a struct, and the pattern matching is written inside `step`*

What's more, there is an intuition here:

**The only case when `syn` invoke `start` again (to start possibly semantic computation again) is when `g` changed. The only situation that happens is during constructive implication (in the assumption base), because we start to prove the antecedent**

So we now know the base case and disj case
```Haskell
syn [] asmpt utched state g = #f -- or suspend for further 
syn (a \/ b):rem ... = 
  -- unification (a \/ b) with g and then 
  -- note that we are pattern matching! and since g doesn't change, we won't invoke start! (otherwise duplicate searching)
  (bind (syn (a:[]) ...) to (syn b:rem ...))
  (bind (syn (b:[]) ...) to (syn a:rem ...))
  (syn rem ...)
```

**The only case when `syn` invoke `start` again (to start semantic computation again) is when `g` changed. The only situation that happens is during constructive implication, because we start to prove the**

## Proof Term Generation

We add a new part call proof-term or proof-term-w/hole into the state

And the `(start st g)` means the proof that satisfying `g` under the situation of `st` will be filled in the proof-term `st`. This specification can help us construct recursive step.

`forall` is still very hard as the algorithm itself is too complicated, (including relative complement, shrinking, To disjunctive normal form, etc). There will be a lot of decision procedure about the boundary checking.

`exists _1 . _2` is fine, because we will give proof term on `_2` first then go to give proof term on `_1`. The only issue when giving proof term `_1` is when the state doesn't give a specific value for a logical varaible (just say it is okay). So basically I only need to make a new kind of stream `force` that will consider the inequalities and type constraints and keep returning ground values that satisfies the thing. 

I haven't considered constructive implication. But the proof term for it and `forall` are both lambda, but with differnt input type : `forall` has input type `Lisp Universe`; constructive implicatioon has input type of kind `Prop`