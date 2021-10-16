---
layout: post
title:  "Notes on Soundness"
date:   2021-05-23 00:56:11 -0400
categories: CS Type-Theory
---
Soundness is a concept from Logic. It means a bunch of inference rule is deriving "truth" with respect to a certain (class of) models/semantics. 

Similarly, soundness in type theory means the (syntactical) type system / type inference rules is deriving "truth" with respect to a certain semantic. In industrial PL, one of the most prevalent way of specifying semantic is operational semantic. 

This translation does make sense -- because a programming language with only operational semantic can be considered as dynamic typed; and I can also see operational semantic is merely a kind of state-transitioning machine. Then type system is a static asserting tools that is syntactic deriving (with no really running the underlying program using operational semantic) upon it that can claim "well-typed program doesn't go wrong" -- as the key of operational semantic is to not go wrong/reduce to values. This coincides how Robert Harper downplay *Formalism* and praise *Computation*. 

What's more, you can see in logic, we will at the same time have turnstiles $\vdash$ and value interpretation $\models$. Formal Type Theory uses $\vdash$ a lot, but we barely see $\models$ at all. 