---
layout: post
title:  "Type Theory, Categorical Aspect, 0."
date:   2019-09-23 00:56:11 -0400
categories: CAT Math Type-Theory
---

# IN CONSTRUCTION

#### References:
As a study note, there is nothing nontrivially original. Currently the references include *Categorical Logic and Type Theory*(by *Jacobs*). 

This post is mostly about Fibration.

## Fibration & Category

In *Jacobs*, the starting point is just fibrational category theory. Even though, as nlab suggests, to have a categorical model for STLC(**Simply Typed Lambda Calculus**) or **Dependent Typed Lambda Calculus**, a (locally) closed cartesian category is basically enough. But no one can stop Jacobs using more modern language.



> A functor $p:\mathbb{E} \rightarrow \mathbb{B}$ is a **fibration** if for every $Y \in \mathbb{E}$ and $u (\in \mathbb{B}): I \rightarrow pY$, there is a **Cartesian Morphism** $f (\in \mathbb{E}):X\rightarrow Y$ above $u$ (i.e. $pf = u$).

> With functor $p:\mathbb{E} \rightarrow \mathbb{B}$, an arrow $f:X\rightarrow Y$ is **Cartesian over** $u :I \rightarrow J$ if 
> 
> 1. $pf = u$
> 
> 2. for every $g: Z \rightarrow Y$ with the property that $pg$ can be composed by $u$, (i.e. there is a $w$ s.t. $pg = u \circ w$)
>       we have a **unique** arrow $h$ s.t. $g = f \circ h$

> and if $f$ is cartesian over $u$, we call $f$ as $u$'s cartesian lifting.

The definition of cartesian morphism is easily demonstrated by the following diagram in the original book.

![](/assets/img/2019-09-22-15-48-39.png)



This **unique**ness is shouting out the up-to-isomorphism.

> Show that: if $f,f'$ are both the cartesian lifting of $u$, then there is isomorphism $i$ s.t. $f = f' \circ i$

<details>
    <summary>To find the isomorphism:</summary>
    <p>

    </p>
</details>


#### Example : Codomain Fibration

In this example, we can see our old friends arrow category and slice category.


> $cod: \mathbb{B}^\rightarrow \rightarrow \mathbb{B}$ is a fibration 
> 
> iff the $\mathbb{B}$ has pullback


Observe that given a functor $F:{\mathbb{C}} \rightarrow \mathbb{D}$, if we denote $F^{-1}(X)$ as the collection of objects in $\mathbb{C}$ that will be mapped to $X$. 

Now for a fixed $X$, $F^{-1}(X)$ can actually become a category, by taking the arrows to be $F^{-1}(id_X)$. This category will be called **fibre category**.

Now consider if the above $F$ is the codomain fiberation, what is the category constructed? *Slice Category!*

#### Example : Set Indexed Category ($Fam$) 

> $Fam(\mathbb{C})$ is a category
> 
> objects: $(I,X)$ where $I \in$ **Set** and $X: I \rightarrow  \mathbb{C_0}$ (that maps elements in $I$ to objects in $\mathbb{C}$). We most of the time will use $X_i$ to denote $X(i)$ and thus an object is denoted as $\\{X_i\\}_{i\in I}$ 
> 
> arrows : $(u: I \rightarrow J$, {$f_i: X_i \rightarrow X_{u(i)}$} where $i \in I$) as a tuple of arrows and collections of arrows.

We would have a fibration $Fam(\mathbf{Set}) \rightarrow \mathbf{Set}$ s.t. mapping objects $\\{X_i\\}_{i \in I} \mapsto I$

> Claim : That is really a fibration (i.e. cartesian lifting exists.)


### Cloven & Split

### Change-of-Base

Recall

> Given $\mathbb{A} \xrightarrow{f} \mathbb{C} \xleftarrow{g} \mathbb{B}$ where $\mathbb{A}, \mathbb{B}, \mathbb{C}$ are categories
> 
>  an **ordinary pullback** is an object (category) $\mathbb{X}$ 
> 
>  where objects are ${(A, B): f(A) = g(B)}$
>  
>  and arrows are ${(u,v): f(u) = g(v)}$
> 
>  It can easily proved that an ordinary pullback is a pullback.

<details>
    <summary>To Show it is a pullback:</summary>
    <p>

    </p>
</details>

Now we can give a definition on **Change-of-base**.

> **(Change-of-Base)** Given $\mathbb{A} \xrightarrow{f} \mathbb{B} \xleftarrow{p} \mathbb{E}$ where $p$ is a fibration,
> then we have the ordinary pullback $\mathbb{A} \xleftarrow{\pi_1} \mathbb{X} \xrightarrow{\pi_2} \mathbb{E}$ 
> 
> and also $\pi_1$ is a fibration, which is cloven/split given $p$ is cloven/split.

<details>
    <summary>To Show it is a fibration:</summary>
    <p>

    </p>
</details>

#### Fibrations $\mathbf{Set}^\rightarrow \rightarrow \mathbf{Set}$ and $Fam(\mathbf{Set}) \rightarrow \mathbf{Set}$ are very much the same.

The formal statement is as below:

## Exercises

Some exercises are put here. 

> There is an equivlanece of categories in the following commutative diagram
> 
> where $Fam(\mathbf{Sets}) \xrightarrow{\simeq} \mathbf{Sets}$ := 
> 
> $(X_ i)_ {i \in I} \mapsto$ [the arrow $(\coprod_ {i \in I} X_ i) \xrightarrow{\pi} I$] 

![](/assets/img/2019-09-29-17-51-13.png)

<details>
    <summary>To Show it is an equivalence:</summary>

        Denote the mapping $Fam(\mathbf{Sets}) \xrightarrow{\simeq} \mathbf{Sets}$ as $F$,

        <br/>
        
        Denote the mapping [the arrow $X \xrightarrow{f} I$] $ \mapsto (f^{-1}(i))_ {i \in I}$ as $G$

        <br/>

        Let $F$ become a functor by throwing the arrow $(u, (f_ i: X_ i \rightarrow Y_ {u(i)})_ {i \in I})$ to $(\coprod_ {i \in I}f_i, u)$. For the former one (in the tuple), it is obviously mapping $\coprod X$ to $\coprod Y$. It is easy to check commutativity and see that is an arrow in the arrow category and thus $F$ is a functor.

        <br/>

        Let $G$ become a functor by throwing the commutative arrow (in the arrow category) $(v:X\rightarrow Y, u:I \rightarrow J)$ to $(u, (v)_ {i \in I})$ since it is easy to prove $v : f^{-1}(i) \rightarrow g^{-1}(u(i))$

        <br/>

        Now we have to give $\eta : G\circ F \rightarrow Id$ and $\gamma :F \circ G \rightarrow Id$.

        Given $(X_ i)_{i \in I}$, $\eta((X_ i)_{i \in I}) : G(F((X_ i)_{i \in I})) \rightarrow (X_ i)_{i \in I} = (i, X_ i)_{i \in I} \rightarrow (X_ i)_{i \in I}$. Thus $\eta(X) = \pi_2$.

        <br/>

        Given $X \xrightarrow{f} I$, $\gamma(f): F(G(f)) \rightarrow f = [\coprod_ {i \in I} f^{-1}(i) \rightarrow I] \rightarrow [X \xrightarrow{f} I]$.
        Thus $\gamma(f) = (\pi_2, id)$

        <br/>

        Now we need to check commutativity for the natrual transformations.

        <!-- ![](/assets/img/2019-09-30-21-24-50.png) -->
        <!-- <img src="/assets/img/2019-09-30-21-24-50.png"> -->
         <img src="/assets/img/2019-09-30-21-48-03.png">
        <br/>

        The other one is similar.

</details>