---
layout: post
title:  "Type Theory, Categorical Aspect, 1."
date:   2019-09-23 00:56:11 -0400
categories: CAT Math Type-Theory
---

## Simply Typed Lambda Calculus

### Signature
This topic is quite similar to the *diagram* in my notes on category, but it is more 'universal algebra' style. 

Because we focus on Type Theory, thus the signatures are more about type theory instead of logic.

> **Sign** is the change-of-base (ordinary pullback) of the
> 
>  $Fam(\mathbf{Set}) \xrightarrow{p} \mathbf{Set} \xleftarrow{T \mapsto T^* \times T} \mathbf{Set}$, 
> 
> where $p$ is the family fibration (introduced in the last note)
> 
> $T^*$ is the kleen-star of $T$, (i.e. $T^* = \bigcup_{i \in \mathbb{N}} T^i$)

And objects in the **Sign** are signatures. Let's see how actually they and the arrows look like.

We know $\Sigma = (T, \mathcal{F})$.


From now on, we will denote the Type-symbol collections as $T = |\Sigma|$

### S-Models

The first semantic model of the signature is set-theoretic. 

> Given a signature $\Sigma$, a model (or algebra) for $\Sigma$ are collections of sets $(A_\sigma)_{\sigma \in T}$ and functions (each for a function symbol $F: \sigma_1 \times .. \times \sigma_n \rightarrow \sigma_r$), $[F] : A_{\sigma_1} \times ... \times A_{\sigma_n} \rightarrow A_{\sigma_r}$.

Thus a set theoretic model is just $((A_\sigma)_{\sigma \in T}, [ \cdot ])$.

We can define the categories of models, named as **S-Models**.

> **S-Models** 
> 
> objects: $(\Sigma, (A_\sigma)_{\sigma \in T}, [ \cdot ])$ where $((A_\sigma)_{\sigma \in T}, [ \cdot ])$ is a model for $\Sigma$
> 
> arrows : $(\phi, (H_{\sigma})_{\sigma \in T})$ where $\phi$ is morphism in **Sign** (between $\Sigma$s), and $H_\sigma : A_\sigma \rightarrow A'_{\phi(\sigma)}$ with the following diagram commutes.



BTW: You can easily see that the model defines here is basically a diagram where objects are $\{\sigma \in T\}$ and their products; and arrows are the function signatures. (Recall the definition of models in notes in cat). We can see that the above commutative diagram is just a result of natrual transformation between models of the diagram.


Also note that the below arrows are all fibrations
$$ \textbf{S-Models} \xrightarrow{F} \mathbf{Sign} \xrightarrow{G} \mathbf{Set} $$

$$ (\Sigma, (A_\sigma)_{\sigma \in T}, [ \cdot ]) \mapsto \Sigma \mapsto |\Sigma| $$

### Functorial Semantic

Functorial style is actually very natural because it presents an easy way to generalize semantic (the way to intepret).

