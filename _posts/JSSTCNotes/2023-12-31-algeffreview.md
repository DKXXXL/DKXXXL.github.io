Ref

1. https://era.ed.ac.uk/bitstream/handle/1842/4611/Pretnar2010.pdf Pretnar's thesis

2. https://arxiv.org/pdf/1807.05923.pdf

3. https://www.cs.ox.ac.uk/people/ohad.kammar/publications/kammar-ohad-thesis.pdf



# Algebraic Operation, by Lawvere Theory

Algebraic Op can be modeled by single-sort countable equational theories

For example, non-determinstic op, `or` has arity of 2, `or: 2`.

By (Ref 1, 2.4.2), we have
```
z ⊢  or (z, z) = z 
z1, z2 ⊢ or (21, 22) = or (22, 21) 
z1, z2, z3 ⊢ (z1 or z2) or z3 = z1 or (z2 or z3)

```

The single-sort means there is only one type;

the countable means, we can have infinite arities for an operation


## induced monad from the Lawvere Theory Above


## induced PL operation



Apparently, this alg-op is off from the materials and programming language.



## First Generalization

In (Ref2, 1.8, 1.9). In 1.8, we know arity can be seen as continuation, 
because `op: Xⁿ → X` becomes `op: (n → X) → X`, so the continuation `((n → X))` is one argument.




In 1.9, we add an additional 'parameters'. So basically parameters is the input of the alg-op while the arities is the output of the alg-op.

So now, an `op: P ~> A`.

(Ref2, 1.9) provides a set-theoretic semantic. While categorical one is not introduced here.

You, last week | 1 author (You)

## Second Generalization to PL

In (Ref3) `op: P ~> A` corresponds to `op: P ⟨ A ⟩`, 10.1 typing rule indicates how to lift an elg-op into a PL. (P221)


```
V: P , M : A → Bcomp
-------------------------
opV(M): BComp

```

Basically (A → X) → X, X is a computation, and A → X is a continuation


## Generalization of Algebraic Equations

As Ref2 said, to use Algebraic theory to model computation is exactly

> We may model these phenomena mathematically as operations on an algebra whose elements are computations.

That means, equations are about computations! This is weird as we cannot see how to systematically lift algebraic equations!

For example, `or(z, z) = z`, there are two ways to use this alg-op,

1. if we pass in a continuation, i