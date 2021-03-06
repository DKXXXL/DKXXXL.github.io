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

Basic Concepts of Abstract Interpretation (Patrick Cousot and Radhia Cousot);

Abstract Interpretation (Susan B. Horwitz)

***

This blog is about several Definitions on Abstract Interpretation/Dataflow Analysis I encountered and try to connect them together.

We all know that no matter DFA or AI, they are both just frameworks. All kinds of concrete analysis are derived from them, e.g. live analysis and constant propogation. With this common knowledge in mind, we will focusing on formulating the abstract framework and instantiation of the framework.


### Nielsons' based on denotational semantic

In the book (*Nielsons*), this part is phrased as Dataflow analysis. This definition is starting from denotational semantic of the program. Denotational semantic is basically using mathematical language to simulate what is happening when program is running. As Nielsons, we will just take language __while__ as an example.



After we have defined denotational semantic, to introduce AI/DFA is pretty simple, we just make the domain we are computing from concrete to abstract; for example, from $\mathbb{Z}$ to { {$x : x > 0$}, {$0$}, {$x : x < 0$} }, in which example, the originally infinite domain becomes a domain with only three elements.




There is something quite interesting going on here because if you see closely, we cannot ask "Is $x$ a constant at this point of the program?". Because all of our definitions are defined upon a complete syntax construct, and thus the dataflow analysis cannot process just half of the while body and ignore the other half. This makes this approach non-practical.

The fix I can come up with are (1) change to SSA (*removes mutation*); (2) do non-trivial transformation so that the point you want to ask about are transformed outside of any complete syntax construct. Neither are really practical.


### Just an easy computation of DFA:
Before the next definition, we see a concrete way of computation.

Professor Chechik introduces (I don't know where this way comes from originally) a very simple way of computing data flow analysis. Given a control flow graph, we can do either forwards or backwards flow analysis, which decides on which order of the blocks (in CFG) we will go through and do the analysis upon; we also decides whether we take intersection or union according to our expected semantic -- do we want a "mustbe" answer? Or a "maybe" answer?

Let me mke it concrete with two examples.

#### Constant Propogation


#### Live variable analysis


You can see the definition of live variable is "$p$ is live if $p$ is possible to be used in the future", which is just a "maybe" answer, that is why we take union when "joining" two control flows. While doing constant analysis, we need to know at a point of program, no matter what computational history the program went through, when it arrives a syntactical point, some variable is doomed to be a constant. That is just a "mustbe" answer, thus taking intersections.

This calculation, for each possible control flow, will always terminate. Because there are finite value for each block and value can only "increase". Once this computation reachest fix points, the computation stops.


### Formalized based on CFG
*This content was also avaliable at* Principle of Program Analysis, *but I also took Horwitz's as reference*.

Let's formalize/abstract the above computation -- using CFG as the underlying starting point. 
<!-- But this time, instead of directly instantiating the analysis we want, whether the join is intersection or union, we literally do "abstract interpretation" -- we want to have as result a function of type *CFG-node* $\rightarrow$ *set-of-states*, which indicate what states are possible in the corresponding *CFG-node*. Actually, this function is possibly all the information to do constant propogation -- we just check in the CFG-node, if in all the possible states one variable has the same value. Then what about live variable analysis? -->

<!-- 
But before "abstract interpretation", we first define "interpretation" in this style -- you will find "interpretation" is actually the same type as "abstract interpretation", both *CFG-node* $\rightarrow$ *set-of-states*, since there can be multiple entrace of one codeblock during running of the program and the entering state is not likely the same. -->


But before "abstract interpretation", we first define "interpretation" as a function *CFG-node* $\rightarrow$ *set-of-states*, since there can be multiple entrace of one codeblock during running of the program and the entering state is not likely the same.

> **Collecting Semantic** maps CFG nodes to sets of states, indicating "what states can arise just before the cfg-node is executed", formally defined below
$$
recColl(x) = 
\begin{cases} 
\{all \ states\} & x \text{ is beginning} \\
\bigcup_ {p \in pred(x)}f_{p \rightarrow x}(recColl(p)) & \text{otherwise}
\end{cases}
$$

> where $f_ {p \rightarrow x}$ is of *state* $\rightarrow$ *state* indicating the state after $x$ given the state exactly after $p$ and before $x$. There is a notation-abused in the above since $recColl$ is returning a set of states while $f_ {p \rightarrow x}$ is originally thought single state as input.


We can see in the most cases, the $recColl$ is not practially computable because it is at least the same complexity as the original program. 

Collecting Semantic can be defined not in a recursive way. If we denote $coll_n := reColl(n)$, then the above definition will become equations about $\overrightarrow{coll}$ (a tuple of set of the states). Thus $\overrightarrow{coll}$ is the fixpoint of that equation, and also the least fixpoint. Even though it is still not practically computable. And in most cases, it is not even computable.

We have a way to describe the semantic of programming language based on CFGs, i.e. "interpretation". Now we proceed to abstract interpretation. We need some concepts before hand.



> **Galois Connection** between $\alpha, \gamma$ means $\alpha(X) \prec Y \Leftrightarrow X \prec' \gamma(Y)$



The $\prec, \prec'$ is just some partial order, since Galois Connection is not an idea owned by abstract interpretation, it of course can have a wide range of usage. In the current case, one of them would be the $\subseteq$ relationship.

Some category theorists will tell you Galois connection is just an example of adjunction.
$$\frac{\alpha(X)\rightarrow Y}{X \rightarrow \gamma(Y)}$$

Now we can proceed to AI.

> An **Abstract Interpretation** is
> 
> *    



You can see that, any interpretation would be a trivial "abstratc interpretation" according to the definition. That means the definition of abstract interpretation cannot guarantee practially computable.

### Cousots' based on transistion systems

Different from Nielsons' and Horwitz's, Cousots' abstract interpretation starts its journey from transistion systems. It abstract away any control flow/continuation, and just assume the computation only relies on a transition system. I cannot quite understand Cousots' point of view so I may have to copying and pasting from the text books a lot. You will see that, the most confusing part is, in the above frameworks, we can easily ask "if variable $x$ at line 9 is a constant or not". However, in this framework, it doesn't seem so obvious. 

> Transition system is just a state machine using three tuples to represent 
> $\tau = \langle \Sigma, \Sigma_ i, t \rangle$
> 
> where $\Sigma$ is the possible states, $\Sigma_i$ are the initial states and $t \subseteq \Sigma \times \Sigma$ stands for transition relationship

Note that Cousots points out $t$ stands for __possible__ succeeding states but never explicitly says non-determinism in the whole introduction.

They then suggests a program's semantic, (which was once a function from input domain to functions on __State__ in denotational semantic), can be represented by the "trace"s of the program.

> A **finite partial execution trace** is a sequence of states $s_ 0 s_ 1 ... s_ n$ where $s_ 0$ doesn't have to be initial state and each consequent pair is in relationship w.r.t $t$. $\Sigma_ \tau ^{n}$ stands for the set of all partial execution traces of length $n$.

> The **collecting semantic** $\Sigma_{\tau}^{\overrightarrow{\*}}$ of the transistion system $\tau$ is the set of all such finite partial execution trace

We again see this terminology ... Question: are these two same concepts? If you assume that in each state of the transition system, there is a *PC counter* or a *continuation* or a *CFG-node* number, then we can see that these two concepts are basically telling the same story: *CFG-node* $\rightarrow$ ${\cal P}(State)$ gives same amount of information as $State \times$*CFG-node*. However, a partial executrion trace order the state, which is not expressed by the original definition.
Then this collecting semantic is truly a generalization and strengthening of the above.

Now, easy for me, without a concrete example of a programming language to demonstrate the concrete semantic, we can still proceed to define abstract semantic. As before, we need Galois Connection.

<!-- But before that, we start with a simple concept:

Some category theorists will tell you Galois connection is just an example of adjunction.
$$\frac{\alpha(X)\rightarrow Y}{X \rightarrow \gamma(Y)}$$ -->

#### Fixpoint Transfer Theorem

#### Widening + Narrowing


At the very end, I still don't know how to generate answer for a question like "Is the variable at Line 42 a constant?" in this framework. This framework seems completely interpret the whole program, just like the denotational semantic in some sense.