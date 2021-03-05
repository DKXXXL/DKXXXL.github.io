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