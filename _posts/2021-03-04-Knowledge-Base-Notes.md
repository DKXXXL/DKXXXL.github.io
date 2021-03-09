---
layout: post
title:  "Knowledge Base Reasoning Concept"
date:   2021-03-04 00:56:11 -0400
categories: CS
---
Use text searching please

* Consistency is equivalent to satisfiability
  * $\Phi$ is consistent means $\Phi \not \models \bot$ 
  * which means $\exists M, M \models \phi, M \not \models \bot$
* Not Every consistent set is complete
  * $\{p \lor q\}$
* Not every complete set is consistent
  * $\{p, \neg p\}$
* every inconsistent set is complete
  * $\Phi \models \bot \models p, \neq p$
* Not every complete set of first-order sentences is decidable
  * Denote $N$ as the model for true arithmetic,
    * with addition, multiplication, successor function symbol, equality and less-than relation, and constant zero
    * $N \models k$ if $k$ holds in natural number arithmetic
    * It is proved that $Th(N) := \{x : N \models x\}$ is undecidable, because it is $Th(N)$ is not a recursive set and not recursive enumerable, and in fact it has no recursive set of axioms, (so enumeration of proofs is impossible)
    * it is easy to see it is a complete set of theory, because $N$ is a model
* CWA, closed-world assumption
  * $CWA(\Phi) = \Phi \cup \{ \neg \alpha : \alpha \text{ is ground atomic formula and } \Phi \not \models \alpha  \}$
* GCWA, generalized closed-world assumption
* ![](../assets/img/2021-03-04-21-42-16.png)
* if $\Phi$ is a set of first order sentences (without quantifiers and equality symbols), $GCWA(\Phi)$ is not necessarily complete (w.r.t all the sentences generated from $\Phi$ w/o quantifier and equality)
  * Say $\Phi=\{p \lor q\}$, $GCWA(\Phi) = \Phi$ is still not complete
* if $\Phi$ is a set of first order sentences (without quantifiers and equality symbols), $CWA(\Phi)$ will be complete (w.r.t all the sentences generated from $\Phi$ w/o quantifier and equality)
* Reasoning under CWA is non-monotonic
  * $\{p \lor \neg p\} \models_{CWA} \neg p$ 
    * but $\{p \lor \neg p, p\} \models_{CWA} p$ as $CWA(\{p \lor \neg p, p\}) = \{p \lor \neg p, p\}$
* Reasoning under GCWA is non-monotonic
  * $\{p \lor \neg p\} \models_{GCWA} \neg p$ 
    * but $\{p \lor \neg p, p\} \models_{GCWA} p$ as $GCWA(\{p \lor \neg p, p\}) = \{p \lor \neg p, p\}$
* Horn Logic is still semi-decidable
  * Even with just Horn clauses,in the first-order case the possibility of generating an infinite branch of resolvents exists
  * ![](../assets/img/2021-03-05-10-13-41.png)
* Circumscription is not easy to cause inconsistency
  * because we don't directly manipulate KB
* Issue with circumscription:
  * ![](../assets/img/2021-03-05-10-22-21.png)
  * solution: 
    * Fixed / Variable Predicate
    * Mc Carthy's definition for Models with Minimal Abnormality
* Extension for Default Logic can be not complete
  * $\mathcal{F} = \{\beta\}, \mathcal{D} = \{ \alpha \Rightarrow \beta \}$
  * $\mathcal{F}$ is an incomplete extension
* Stable Expansion for Default Logic can be not complete
* $\mathcal{M} \models \phi [\sigma]$ means $\mathcal{M}$ with variable assignemnt $\sigma$ is satisfies $\phi$ 
  * $\mathcal{M} \models \phi [\sigma(m/x)]$ where $\sigma(m/x)$ is just like $\sigma$ except mapping $x$ to $m$
* During answer extraction, we create $\exists x. P(x) \land \neg A(x)$
  * when the result of $A(s)$ is proved,
  * it is not possible to have something like $A(s) \land \neg P(s)$
    * Say there's a constant a in the KB such that $\neg P(a)$ holds, and we're extracting answers that satisfy $P$. 
    * Then we must resolve the literal $\neg P(x)$ in the clause $[\neg P(x),A(x)]$ with some ground literal like $P(b)$ (where $b$ is some constant) somewhere in the extraction resolution to get the resolvant $[A(b)]$, but it's not possible to resolve $\neg P(a)$ with $\neg P(a)$ as they both are negative literals.  
  * Similarly, if $A(a)$ is the result, then we must have derived $P(a)$ otherwise $\neg P(a)$ in the clause is not resolvable
* Resolution, convert to Clausal Form
  * ![](/assets/img/2021-03-08-23-02-26.png)
* Resolution tree, example  
  * ![](/assets/img/2021-03-08-23-07-39.png)
  * ![](/assets/img/2021-03-08-23-06-16.png)