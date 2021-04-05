---
layout: post
title:  "Knowledge Base Application Concept"
date:   2021-03-04 00:56:11 -0400
categories: CS
---
Use text searching please

## Semantic Web
* semantic web goal:
  * Describe and link web content in a manner that's meaningful to machines
  * extend the original/current World Wide Web with semantic web
* Semantic Architecture:
  * ![](../assets/img/2021-04-04-00-03-13.png)
  * Green - Realized; Purple - In Progress; Orange -- Not yet started
  * Trust, Proof, Unifying Logic,
  * Query & Rules, Schema & Ontologies; Data Model
  * SPARQL & RIF, RDFS & OWL
  * Syntax, identifiers, characters
    * ![](../assets/img/2021-04-03-22-55-46.png)
    * ![](../assets/img/2021-04-03-22-56-12.png)
    * ![](../assets/img/2021-04-03-22-56-36.png)
* RDF triple:
  * consist of subject, predicate, object
    * which will link its subject to an object, and predicate is along the edge
* RDF graph -- a collection of RDF triple
  * subject, objects are nodes
    * predicate as edges
  * But no meaning, needs a formal ontology
* Formal Ontology
  * provide a computer-interpretable specification of the intended meanings of terms.
  * a computer-interpretable specification for data that captured in the RDF graph
  * An ontology is a formal description of the concepts and relationships within a specific domain.
  * general properties
  * a lot of 
  * reusable
  * common language
* Web ontology is using Description Logic based languages
  * there are also first order ontologies
* Knowledge Graph are with two components:
  * a Data Graph : Usually RDF graphs are used as the data graph to structure data.
  * Ontologies: Represent the formal semantics of a KG
    * together describe concepts and relationship that are used in the data
    * able to give structure to the data
    * enable reasoning about the data

## Description Logic + Rule Languages:
* a strict subset of First Order Logic
* classification, subsumption, hierarchical information
* Domain are individuals
* Concepts: a set of individuals (unary predicates)
* roles : binary relationships  (binary predicates)
* constructors : like connectives
* Descriptions : Variable-free expressions which can be built up from primitive symbols in the vocabulary using constructors.
* Semantics
  * ![](../assets/img/2021-04-04-00-04-16.png)
* $\mathcal{AL}$  Language, AL language
  * ![](../assets/img/2021-04-04-00-06-49.png)
* Extension of $\mathcal{AL}$
  * ![](../assets/img/2021-04-04-00-07-30.png)
* Terminological Sentences:
  * subsumption: $C \sqsubseteq D$ : $C^I \subseteq D^I$
  * Definition: $C \equiv D$ : $C^I = D^I$
* Assertion Sentences:
  * concept assertions: $A(c)$ : $c^I \in A^I$
  * role assertion: $R(c,d)$ : $(c^I,d^I) \in R^I$
* Terminological Knowledge Base (TBox)
  * A set of terminological sentences.
* Assertional Knowledge Base (ABox)
  * A set of assertional sentences.
* Basic Reasoning Task: for knowledge base $K = \langle T, A \rangle$
  * Concept Satisfiability on $T$
    * :find a model $I$ s.t. $I \models T$ where $C^I \neq \emptyset$
  * Subsumption, Equivalence, Disjointness on $T$: All to prove $T \models ...$
  * satisfiability on $K$: find model of $K$
  * is $K \models C(a)$ assertional?
  * Reductions:
    * $C$ is unsatisfiable iff $C \sqsubseteq \bot$
    * $C \equiv D \iff C \sqsubseteq D$ and $D \sqsubseteq C$
    * disjointness = intersection is subseteq of bottom
    * other reductions
      * ![](../assets/img/2021-04-04-19-15-02.png)
  * Translation to First Order Logic:
    * ![](../assets/img/2021-04-04-19-15-58.png)
  * Web Ontology can be Description Logic Based or Rule based
* DL's advantage 
  * it is decidable nad less (time)-complex, has well-defined semantic
      * a lot of inference tasks
* DL's limitation, limitation of Description Logic:
  * ![](../assets/img/2021-04-04-20-11-20.png)
* Rule language:
  * head, body
  * ![](../assets/img/2021-04-04-20-20-04.png)
  * Horn-based Rule Language
    * ![](../assets/img/2021-04-04-20-21-36.png)
    * Expressive Limitation of Horn Rules
      * No disjunctions and existential quantifiers in the head.
      * No negation in the body
### Rules 
* a restricted FOL in implication form, mostly use Horn Logic
  * at most one positive literal when in clausal form
* Description Language vs. Rule Language
  * ![](../assets/img/2021-04-04-20-22-59.png)
  * So combining two seems good
* Combining DL and Rules
  * Homogeneous Approaches: Tight Semantic Integration
    * make no distinction between two vocabulary; include both parts; sub parts have exactly same semantic as the original ones
    * Rules may be used for defining classes and ontologies 
    * Undecidable
      * solution: 
        * find a  subset of combined language that is still decidable, computable and expressive
          * DL-safe rules: variable only appear in non-DL-atom
    * Example:Semantic Web Rule Language (SWRL):
      * ![](../assets/img/2021-04-04-20-53-23.png)
  * Hybrid Approaches: Strict Semantic separation
    * make distinction between rule predicates and ontology predicates
    * rule cannot be used to define classes and properties of ontologies
    * communication via safe interface
      * but interface is complicated
      * DL are mostly monotonic
      * efficient rule reasoner are not monotonic
        * but rules are non-monotonic -- we will have default and non-montonic reasoning again

## Diagnosis and Explanation
* Abductive Reasoning:
  * Given a KB and a formula β, abduce sufficient reasons for β to be true, with respect to the (implicit or explicit)facts in the KB.
  * Explanation Task: Given a KB and a observed formula $\beta$
    * what would be a sufficient reason for $\beta$ to be true
      * what would explain observed $\beta$ being true?
  * Diagnosis Task: Given a KB all of which in the following form
    * ![](../assets/img/2021-04-04-21-47-33.png)
    * Find causes that best explain $\beta$
  * **Adequacy Criteria** for Explanations of $\alpha$ as an explanation of $\beta$ under KB
    * Also called 
    * sufficiency: $KB \cup \alpha \models \beta$ or $KB \models \alpha \supseteq \beta$
    * not rule out $KB \cup \alpha$ is consistent
    * $\alpha$ is as simple as possible
      * (syntactically) include as few terms as possible
    * $\alpha$ is in the appropriate vocabulary
      * usually we will have a set of Hypothesis (set of atomic sentences) with which explanation are phrased
      * hypothesis fix the vocabulary the explanation will use
  * Simplified Criteria for Propositional case
    * and look for explanation for atoms $p$
      * it is enough as we can add $p \equiv \beta$ into the KB and look for explanation of $p$
      * $KB \cup a \models b \iff KB \cup (P   \iff b), \alpha \models P$
    * because we are working on propositional case:
      * every explanation will be negation of clauses/conjunction of literals
        * ![](../assets/img/2021-04-04-22-39-22.png)
      * Thus we only need prime implicates
      * prime implicate for explanation
        * ![](../assets/img/2021-04-04-23-20-47.png)
        * ![](../assets/img/2021-04-04-23-26-59.png)
* Prime implicate
  * a clause $C$ s.t. $KB \models C$ and for all $C' \subsetneq C$, $KB \not \models C'$
  * minimal clause $KB$ entails
  * resolution is complete or propositional non-tautological prime implicates:
    * ![](../assets/img/2021-04-04-23-29-42.png)
  * Algorithm to compute prime implicate:
    * ![](../assets/img/2021-04-04-23-30-38.png)
  * we can also compute validity/entailment using prime implicate
    * to query $KB \models A$ we just compute $KB$'s prime implicate and see if $A$ is inside
* Abductive Diagnosis: 
  * using abnormal behaviour (Fault Models) to compute if $KB \models$ (**entailed**) observed behaviour
  * then making a table, enumerating $Ab(b_i)$
    * ![](../assets/img/2021-04-04-23-39-17.png)
  * then checking the table
    * find a minimal conjunction of $Abn$ literals that entailment happens
    * example:
    * ![](../assets/img/2021-04-04-23-39-53.png)
    * the other solutions include $Abn(b_1) \land \neg Abn(a_1) \land \neg Abn(a_2)$
      * $Abn(b_2) \land \neg Abn(a_1) \land \neg Abn(o_1)$
* Consistency-based Diagnosis:
  * similar, also considering fault models
  * but find those cases that **consistent** with observed behaviour
  * but find a minimal set of $D$
    * ![](../assets/img/2021-04-04-23-44-05.png)
    * example:
    * ![](../assets/img/2021-04-04-23-45-15.png)
    * ![](../assets/img/2021-04-04-23-44-52.png)