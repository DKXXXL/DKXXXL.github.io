---
layout: post
title:  "Secure Compilation"
date:   2023-11-20 00:56:11 -0400
categories: Type-Theory
---

Our notion of security is actually :
* any program will not impact/be impacted by unreachable memory
  
This notion is quite intensional.

## Relax to Lexical Stuff

We first relax the semantic environment into syntax environment, i.e.
given heap, stack (as semantic environment), we consider those
relaxed weaker notion as syntax context (e.g. let list).

For example, a heap `{l₁ ↦ x}` can be relaxed into a syntax `let h = alloc (); let !h = x ; ...`

i.e. so that we only consider the lexical context.

Now we can introduce the concept of equivalent context

We use ⋈ as a general notion of linking. But usually it can be just fill-in the context.



* **Extensional Equivalent Context** : `C₁ ~ C₂` := for arbitrary program `f`, `C₁ ⋈ f ~ C₂ ⋈ f`
* **Intensional Equivalent Context** `C₁ ~ C₂` := the context value are point-wise equivalent
* **Detect Intensional Equivalent Context** `C₁ ~ C₂` :=  `C₁ ⋈ id ~ C₂ ⋈ id`

Basically we need to 
1. The **Detect Intensional Equivalent Context** is sound and complete. i.e. it can really detect two intensionally, fill-ed in values are equivalent
2. show intensional equivalent context implies extensional one
3. `C ⋈ f` is a closed program, so that we can talk about obs-eq on it

Actually **Intensional Equivalent Context** is the main concept of our definition, because we define heap and stack intensionally

## Context of Continuation

However, the above 3 is asking too much. For example, it isn't true that `C₁ ~ C₂` iff  `C₁ ⋈ id ~ C₂ ⋈ id`,
unless we impose some restriction.

So we focus on the "Context of Continuation", i.e. those context with holes at the end.

This relaxation is justified by the fact that we assume we mostly do whole-program compilation, thus all the intermediate environment are contributed by syntactic contexts.


What's more, under this restriction, we want to show three notions of Equivalent Context are equivalent.

***

Now our security property becomes, each program cannot distinguish intensionally equivalent context; this is exactly 
"intensional equivalent context implies extensional one".

## We want Compilation Preserve this property
Now we want to prove, given intensionally `C₁ ~ C₂`, we support compilation on the context `⟦C₁⟧ ~ ⟦C₂⟧`, 
i.e. arbitrary `⟦f⟧` (compiled program) cannot distinguish these two compiled contexts

## Is Full Abstraction Enough?

It is possible. we also need that, for context of continuation `C`, we have 
⟦ C ⋈ f ⟧ = ⟦ C ⟧ ⋈ ⟦ f ⟧

```
C₁ ~ C₂ : Source Program Context of Continuation
⇔ C₁ ⋈ id ~ C₂ ⋈ id
⇔ ⟦ C₁ ⋈ id  ⟧ ~ ⟦ C₂ ⋈ id ⟧ : Full Abstraction
⇔ ⟦ C₁ ⟧ ⋈ ⟦ id ⟧ ~ ⟦ C₁ ⟧ ⋈ ⟦ id ⟧ : The above property
⇔ ⟦ C₁ ⟧ ~ ⟦ C₁ ⟧
```
