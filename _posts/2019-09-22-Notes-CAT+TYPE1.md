---
layout: post
title:  "Type Theory, Categorical Aspect, 1."
date:   2019-09-23 00:56:11 -0400
categories: CAT Math Type-Theory
---

## Simply Typed Lambda Calculus

### Signature
This topic is quite similar to the *diagram* in my notes on category, but it is more 'universal algebra' style. 

Because we focus on Type Theory, thus the signatures are more around type theory instead of that of logic. But the definition below is a little abstract:

> **Sign** is the change-of-base (ordinary pullback) of the
> 
>  $Fam(\mathbf{Set}) \xrightarrow{p} \mathbf{Set} \xleftarrow{T \mapsto T^{*} \times T} \mathbf{Set}$, 
> 
> where $p$ is the family fibration (introduced in the last note)

$T^{\*}$ is the kleen-star of $T$, (i.e. $T^{*} = \bigcup_{i \in \mathbb{N}} T^i$)

And objects in the **Sign** are signatures. 


Let's see how actually the objects and the arrows look like.

We know $\Sigma = (T, \mathcal{F})$.


From now on, we will denote the Type-symbol collections as $\vert\Sigma\vert$

### S-Models

The first semantic model of the signature is set-theoretic. 

> Given a signature $\Sigma$, a model (or algebra) for $\Sigma$ are collections of sets $(A_ {\sigma})_ {\sigma \in T}$ and functions (each for a function symbol $F: \sigma_1 \times .. \times \sigma_n \rightarrow \sigma_r$), $[F] : A_{\sigma_1} \times ... \times A_{\sigma_n} \rightarrow A_{\sigma_r}$. 

Thus a set theoretic model is just $((A_\sigma)_{\sigma \in T}, [ \cdot ])$.

We can define the categories of models, named as **S-Models**.

> **S-Models** 
> 
> objects: $(\Sigma, (A_ \sigma)_ {\sigma \in T}, [ \cdot ])$ where $((A_ \sigma)_ {\sigma \in T}, [ \cdot ])$ is a model for $\Sigma$
> 
> arrows : $(\phi, (H_ {\sigma})_ {\sigma \in T})$ where $\phi$ is morphism in **Sign** (between $\Sigma$s), and $H_ \sigma : A_ \sigma \rightarrow A'_ {\phi(\sigma)}$ with the following diagram commutes.




BTW: You can easily see that the model defines here is basically a diagram where objects are $\{\sigma \in T\}$ and their products; and arrows are the function signatures. (Recall the definition of models in notes in cat). We can see that the above commutative diagram is just a result of natrual transformation between models of the diagram.


Also note that the below arrows are all fibrations
$$ \textbf{S-Models} \xrightarrow{F} \mathbf{Sign} \xrightarrow{G} \mathbf{Set} $$

$$ (\Sigma, (A_\sigma)_{\sigma \in T}, [ \cdot ]) \mapsto \Sigma \mapsto \vert\Sigma\vert $$


We denote **S-Models**$(\Sigma)$ as the fibre category above $\Sigma$ (defined in the last chapter). 
### Classifying Category
Consider syntactically, classifying category is at the heart of the semantic of (simple) type theory because it is how types and judgements are translated into categories.

> Given signature $\Sigma$, a **classifying category** $Cl(\Sigma)$ is a category where
> 
>   objects are contexts of judgements (or sequence of type declaration of variables)
> 
>   arrows are sequence of terms where
> 
>   $\Gamma \xrightarrow{M = t_1, .. ,t_n} \Delta = (v_1: \tau_1,..,v_n : \tau_n)$
> and $\Gamma \vdash t_i : \tau_i$ for each $i$


#### Classifying category $Cl(\Sigma)$ has finite product.

<details>
    <summary>Proof.</summary>
    <p>

    </p>
</details>


### Functorial Semantic

Functorial style is actually very natural because it presents an easy way to generalize semantic (the way to intepret) onto other categries than **Set**.

> Given $\Sigma$, **S-Models**$(\Sigma)$ $\cong$ **FPCAT**$(Cl(\Sigma), \mathbf{Set})$
> 
> where **FPCAT** stands for category with categories with finite product as objects, finite-product-preserving functors as arrows, and thus on the RHS, arrows and natural transformations are the ones to inspect.

<details>
    <summary>Proof:</summary>
    <p>

    </p>
</details>

The above proposition justifies the reason why **FPCAT**$(Cl(\Sigma), \cdot)$ can be a good way to generalize semantic. Of course we can have **FPCAT**$(Cl(\Sigma), Cl(\Sigma))$, called *generic model*, as one of the semantic, which is although trivial, is similar to Henkin Method: "using syntactic term to construct model for a logic".  

#### $Cl(\cdot) \dashv Sign(\cdot)$

> Let $Sign :$ **FPCAT** $\rightarrow$ **Sign** s.t. 
> For an object (category) $X \in $ **FPCAT**, we have each of them as types/objects in **Sign**
> For an arrow $f: X \rightarrow Y \in$ **FPCAT**, we have a function symbol with the corresponding type signature

<details>
    <summary>Proof of the adjunction:</summary>
    <p>

    </p>
</details>


### Three STLCs' classifying categories

Given $\Sigma$ as signature, we let $T=\vert\Sigma\vert$ (called *atomic type*) and 

$T_1$ be the smallest set that includes $T$ and closed under $T$.

$\lambda1$ denote the typed lambda calculus with only 
$\rightarrow$ type constructor, ending up with $Cl1$ classifying category;

$\lambda1_ {\times}$ denote the typed lambda calculus with only 
$\rightarrow, \times$ type constructor, ending up with $Cl1_ {\times}$ classifying category;

$\lambda1_ {\times, +}$ denote the typed lambda calculus with only $\rightarrow, \times, +$ type constructor  ending up with $Cl1_ {\times,+}$ classifying category.

> $Cl1(\Sigma)$ has finite product
> 
> $Cl1_ {\times}(\Sigma)$ is cartesian closed
> 
> $Cl1_ {\times, +}(\Sigma)$ is cartesian closed with finite coproduct.