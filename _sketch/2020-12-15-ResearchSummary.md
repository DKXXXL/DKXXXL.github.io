---
layout: post
title:  "Summary on miniKanren research for Fall"
date:   2020-12-15 00:56:11 -0400
categories: CS miniKanren
---
# miniKanren + Universal Quantifier
* We try to add a new goal (construction) $\texttt{forall x. G}$ into the **current** miniKanren
  * "current": the miniKanren with inequalties, and several type constraint
  * We talk about Universal Quantifier in a closed universe -- lisp universe ${\mathbb L}$
    * data -- number, string, symbol
    * pair of elemenets of lisp universe

## The algorithm
* $\texttt{forall}$ actually has three field:
  *  $\texttt{forall x [Domain] G}$
     *  x is the variable, $G$ is the goal
     *  Domain, is also a goal, is the domain that x applies to, 
        *  trivial to see that if miniKanren cannot find solution for Domain, then the whole forall-goal is already completed (? what is the returned [stream of] states?) 
     *  Domain, semantically speaking, is just a precondition of an implication
* When confronting $\texttt{forall x [Domain] . G}$, 
  1.  we first solve Domain to see if $x$ is satisfiable (using miniKanren itself)
  2.  then we solve $\texttt{fresh x. Domain}  \land G$
  3.  after solving, we get a [possibly infinite stream of]  state of $x$ that satisfied $\texttt{Domain} \land G$ as the solution, $S$
       * At this point, we want to continue searching $x$ with those remaining domain that is not covered by the solution $S$ (*) **Relative Complement**
       * What's more, if $S$ covers actually all of $x$'s domain, we want to use $S$ as one state (as one solution) of the returning stream of the goal, but we need to make sure $S$ doesn't have mentioning of $x$ in its solution state (**) **Shrinking**
  4. If we can do (*), then we apply relative complement to $S$ to get the $\texttt{new-Domain}$ and continue with the  $\texttt{forall x [conj new-Domain Domain] . G}$
  5. If we can do (**), at the very end where Domain is not actually satisfiable, we should return the current state after processed by Shrinking

***

***
Before diving in to the two details, we need some convention setup:
1. We currently only deal with $C$ conjunctions of atomic propositions
     * as we know stream of states can be seen as disjunctions of things, 
     * basically a very inefficient DisjunctiveNF
2. we denote 
     * $C^{\ni x}$ as the conjunction that each atomic propositions has $x$ appearing
     * $C^{\not \ni x}$  as the conjunction that each atomic proposition has no $x$ appearing
     * and thus $C = C^{\ni x} \land C^{\not \ni x}$
3. For goal $G$, and state $s$, we will use $⟦ G ⟧$ and $⟦ s ⟧$ to indicate their modeling in the (elements /ground terms of) lisp universe $\mathbb{L}$ (maybe actually $\mathbb{L}^n$ when multi-var involved)
     * Say $⟦ \texttt{(== x y)} ⟧ =$ {$(x,x) \in \mathbb{L}^2$} 

## Relative Complement + Shrinking

1. (*) has told us the semantic of relative complement, but to model that we need more mathematics involve, 
   1. like a formal definition of $\mathbb{L}$ and 
   2. a choice/domain function $f_x : \mathbb{L}^n \rightarrow 2^{\mathbb{L}}$ indicating the domain $x$ can take when other (before/shadowing) $n$ vars are fixed 
      * say $\exists y \forall x. x \neq y$ will be interpreted as $f_x$, 
        * where we know $f_x(1) =$ {$x \neq 1 : x \in {\mathbb{L}}$}
   3. This defines semantically relative complement (on $x$) of $S$ as $S_x$ :
        * $S_x =$ {$(x_1,x_2,..,x_n,x): x \in f_x(x_1,..,x_n)^{cwnp}$}
        * $X^{cwnp}$ is just complement of $X$ when $X \neq \emptyset$ 
          * otherwise still empty
        * note here $S$ is just a denotation of state or a goal
   4. there are some technical details about above involved/unverified/intuitvely correct
2. But a mathematical model is not enough, because it is not computable. We need a syntactical relative complement
3. It is claimed that, 
   1. $⟦ C^{\ni x} \land C^{\not \ni x} ⟧_x = ⟦ \overline{C^{\ni x}} \land C^{\not \ni x} ⟧$ (partially proved)
      1. yes, RHS (syntactic relative complement) will introduce disjunction inside,
   2. syntactical shrinking (about $x$) of $C^{\ni x} \land C^{\not \ni x}$ is actually just $C^{\not \ni x}$ (partially proved)
      1. semantical shrinking (about $x$) of a state $s$ can be modeled 
         1. to be the range of $⟦ s ⟧$ excluding $x$