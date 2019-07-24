---
layout: post
title:  "Summary: How do we prove specifications on formal computing systems? 1"
date:   2019-07-20 00:00:00 -0400
categories: logic
---
### Prologue
'Formal computing system' is a phrase I made up. You can just understand it literally, maybe there is a word to stand for it: What I am talking about are the automata, turing machine, regular expression, lambda calculus and all sorts of programming languages with formal semantic. Because they can compute, and mainly used for computing.

Automata and turing machines are abstract machines; regular expression, lambda calculus are languages. [The classification](https://cstheory.stackexchange.com/questions/30581/how-would-a-theory-of-computation-course-that-culminated-in-lambda-calculus-as/30589) is not made up by me. 

"Proving specification", means this article is mainly about proving the meaning of a "program" written in those languages. You see when we write programs in abstract machines, we always use a directed graph <sup id="not-really-graph">[${}^{1}$](#nrg)</sup> to represent the computing. While in the language, at least in all sorts of programming languages, we really use a program/script/(sequence of) statement(s) to represent program.

But how do we prove "Program will run as we want"? "Program will terminate as we want"? Because ultimately, we only have induction as the only widely-accepted axiom. What about those abstract machines?At least in those programming languages, we have axiomatic semantic, or take Hoare Logic as example, the semantic of a program can be proved in a much simpler although still horrible and tedious way. The way this was approached in *Software Foundations* is by defining languages' operational semantic and after proving it is well defined, we can start to construct the axiomatic semantic of the language and prove the constructed axiomatic semantic coincides with the operational semantic. However, this is not what this article wants to talk about.

This article is all about giving examples, **of proving specifications**.

This article is also about summary. And thanks to the wonderful Prof. Ellen, Prof. Nikolov, Prof. Chechik, Prof. Hehner, Prof. Rossman; and the great figure Stephen Cook, who I couldn't make it to take his course because I was too young. The range of this article will be in the knowledge of the undergraduate. 

It is so sad I haven't been exposed enough on the abstract machines. There are a lot driven by the development of Programming Language Theory, there are too many for me to even mention here.

#### Automata
Start with NFA. Please construct 



#### Turing Machines



### Epilogue

We can see that how tedious it is to prove a specification on any of these two abstract machines. The basic idea is always attaching some property to each state in the given abstract machine (proved by induction). We may need to prove several properties altogether when the induction hypoethesis is too weak or too strong.


In our computability/computational complexity course, after the first assignment, we were never asked to give a formal definition of a turing machine. Instead, we just give a higher description on how the turing machine will **compute**. Even though we ultimately need to prove the computation coincides with the specification, it is much simpler. You can see how horrible it is to really **formally prove** the correctness.

However, if it is really that hard to prove property about a specific turing machine, why does everyone always use it? The reason is that, on turing machines, the definitions of the computational complexity, whether time or space, are all intuitive and easy (even though maybe not in a simple form). Time is just steps (on deterministic turing machine, basically just the number of movement of the pointer) and Space is just how many cells on that tape are used. This simplicity of the measurement is strongly favoured. 

But practially, is it true that if we really want to prove something formally on automata, just like the concept of proof assistant, there are no tools we can use? We always have to go through this tedious induction step? The point is, I haven't heard of any of the programming language taking state machines as running models. Most programming languages I heard may explicitly control a part of the memory, but the state space is not clearly specified. In that case, a tool based on automata doesn't seem to be useful.

I have heard of model checking, which seems to be related to the automata, but I have never used it.



<b id="nrg">1</b> the *graphs* here, obviously, always include multi-graph (because we have NFA!) and I am sorry for this confusing word. [<](#not-really-graph)