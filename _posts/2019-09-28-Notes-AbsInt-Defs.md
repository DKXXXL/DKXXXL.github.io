---
layout: post
title:  "Notes on Abstract Interpretation: DefinitionS"
date:   2019-09-28 00:56:11 -0400
categories: Abstract-Interpretation
---

# IN CONSTRUCTION


#### References:
Chechik, M (2018) CSC410; 

Semantics with Applications: An Appetizer (Flemming Nielson and Hanne Riis Nielson); 

Basic Concepts of Abstract Interpretation (Patrick Cousot and Radhia Cousot).

#### 

This blog is about the three Definitions on Abstract Interpretation/Dataflow Analysis I encountered and try to connect them together.

We all know that no matter DFA or AI, they are both just frameworks. All kinds of concrete analysis are derived from them, e.g. live analysis and constant propogation. With this common knowledge in mind, we will focusing on formulating the abstract framework and instantiation of the framework.

### Just easy computation of DFA:
Professor Chechik introduces (I don't know where this way comes from originally) a very simple way of computing data flow analysis. Given a control flow graph, we can do either forwards or backwards flow analysis, which decides on which order of the blocks (in CFG) we will go through and do the analysis upon; we also decides whether we take intersection or union according to our expected semantic -- do we want a "mustbe" answer? Or a "maybe" answer?

Let me mke it concrete with two examples.

#### Constant Propogation


#### Live variable analysis


You can see that, the definition of live variable is "$p$ is live if $p$ is possible to be used in the future", which is just a "maybe" answer, that is why we take union when "joining" two control flows. While doing constant analysis, we need to know at a point of program, no matter what computational history the program went through, when it arrives a syntactical point, some variable is doomed to be a constant. That is just a "mustbe" answer, taking intersections.

This calculation, for each possible control flow, will always terminate. Because there are finite value for each block and value can only "increase". Once this computation reachest fix points, the computation stops.


A much more mathematical formulate is in the 

### Nielsons' based on denotational semantic

In the book, this part is phrased as Dataflow analysis. This definition is starting from denotational semantic of the program. Denotational semantic is basically using mathematical language to simulate what is happening when program is running. As Nielsons, we will just take language _while_ as an example.



After we have defined denotational semantic, to introduce AI/DFA is pretty simple, we just make the domain we are computing from concrete to abstract; for example, from $\mathbb{Z}$ to { {$x : x > 0$}, {$0$}, {$x : x < 0$} }, in which example, the originally infinite domain becomes a domain with only three elements.




There is something quite interesting going on here because if you see closely, we cannot ask "Is $x$ a constant at this point of the program?". Because all of our definitions are defined upon a complete syntax construct, and thus the dataflow analysis cannot process just half of the while body and ignore the other half. This makes this approach non-practical.

The fix I can come up with are (1) change to SSA; (2) do non-trivial transformation so that the point you want to ask about are transformed outside of any incomplete function body. Neither are really practical.


### Cousots' based on transistion systems

Different from Nielsons', Cousots' abstract interpretation starts its journey from transistion systems. I cannot quite understand Cousots' point of view so I may have to copying and pasting from the text books a lot. You will see that, the most confusing part is, in the above two frameworks, we can easily ask "if variable $x$ at line 9 is a constant or not". However, in this framework, it doesn't seem so obvious.

> Transition system is just a state machine using three tuples to represent 
> $\tau = \langle \Sigma, \Sigma_ t, t \rangle$
> 
> where $\Sigma$ is the possible states, $\Sigma_t$ are the initial states and $t \subseteq \Sigma \times \Sigma$ stands for transition relationship

Note that Cousots points out $t$ stands for __possible__ succeeding states but never explicitly says non-determinism in the whole introduction.

They then suggests a program's semantic, (which was once a function from input domain to functions on __State__ in denotational semantic), can be represented by the "trace"s of the program.

> A **finite partial execution trace** is a sequence of states $s_ 0 s_ 1 ... s_ n$ where $s_ 0$ doesn't have to be initial state and each consequent pair is in relationship w.r.t $t$. $\Sigma_ \tau ^{n}$ stands for the set of all partial execution traces of length $n$.

> The **collecting semantic** $\Sigma_{\tau}^{\overrightarrow{\*}}$ of the transistion system $\tau$ is the set of all such finite partial execution trace



Now, easy for me, without a concrete example to demonstrate the concrete semantic, we can still proceed to define abstract semantic. But before that, we start with a simple concept:
> **Galois Connection** between $\alpha, \gamma$ means $\alpha(X) \subseteq Y \Leftrightarrow X \subseteq \gamma(Y)$

Some category theorists will tell you Galois connection is just an example of adjunction.
$$\frac{\alpha(X)\rightarrow Y}{X \rightarrow \gamma(Y)}$$

#### Fixpoint Transfer Theorem

#### Widening + Narrowing