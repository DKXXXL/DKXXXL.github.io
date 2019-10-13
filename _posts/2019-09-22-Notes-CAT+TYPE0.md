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

***

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


Recall the definition of substitution functor:
> Given fibre ${\LARGE{\downarrow}}^{\cal E}_ {\cal B}$ and $u : I \rightarrow J \in {\cal B_1}$
> 
> $u$ can have several cartesian lifting, in which if we fix one as the choice then we get the lifting $\bar{u}(X): u^{\*}(X) \rightarrow X$
> 
> In this context, 
> * after this fixing, we call this fibration **cloven** with a **cleavage**
> * $u^{\*}$ is an induced functor ${\cal E}_ J \rightarrow {\cal E}_ I$
> since it preserves the association of the arrows (because of cartesian morphism)

Surprisingly, $u^{\*} \cdot \v^{\*}$ is naturally isomorphic to $(v \cdot u)^{\*}$, mostly because cartesian morphism is closed under association. We also have $id \cong id^{\*}$.

{% include _post_snip\CloveAssociateUpToIso.md %}



> * if $u^{\*} \cdot \v^{\*} \xrightarrow{\cong} (v \cdot u)^{\*}$ and $id \xrightarrow{\cong} id^{\*}$ are *identities*, then this fibration is **split**

Example: Show that fibration ${\LARGE{\downarrow}}^{\mathbf{Set^\rightarrow}}_ {\mathbf{Set}}$ defined by the canonical pullback is a split fibration.


It is easy to notice that $X \mapsto {\cal E}_ X$ and $u \mapsto u^{\*}$ can together become a **pseudo-functor**. It is almost a functor since $u^{\*} \cdot \v^{\*} {\cong} (v \cdot u)^{\*}$ instead of equal. In other words, a split fibration can induce a real functor. This functor/pseudo-functor ${\cal B}^{op} \rightarrow \mathbf{Cat}$ induces the concept of **${\cal B}$-indexed category/split ${\cal B}$-indexed category**.



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

## Exercises, mostly repeating the book, and exaggerate the details

Some exercises are put here. 

> There is an equivlanece of categories in the following commutative diagram
> 
> where $Fam(\mathbf{Sets}) \xrightarrow{\simeq} \mathbf{Sets}$ := 
> 
> $(X_ i)_ {i \in I} \mapsto$ [the arrow $(\coprod_ {i \in I} X_ i) \xrightarrow{\pi} I$] 

![](/assets/img/2019-09-29-17-51-13.png)

{% include _post_snip/FamSetEQVSetArr.md %}


*** 
***


Recall the definition of $\omega$-**Set**: 
> 
> objects are $(X \in \mathbf{Set_0}, E_X : X \rightarrow \mathbb{N})$. 
> 
> arrows are $f: X \rightarrow Y$ such that there exists a natural number $e$ **tracking** $f$, i.e.  for all $x \in X$, $\varphi_ e(E_ X(x)) \subseteq E_ Y(f(x))$ (can you see a commutative diagram here?)
> 
> Here $\varphi_e$ is the $e$-th partial recursive function (since partial recursive function is enumerable just like turing machines are enumerable, details please see any recursion theory)

Notice that the existence of the number is enough, we don't care about what the tracking number actually is. In other words, two arrows are equal when they are same functions in **Set**, even if they have different tracking number.

> $\omega$-**Set** has finite limit and exponential.

{% include _post_snip/OmegaSetCCC.md %}

Recall the definition of $PER$:
> 
> objects are partial equivalence relations (relations transitive and symmetric)
> 
> arrows are 

$PER$ is thought to be a complete lattice: $\bigwedge_ i S_ i = \bigcap \\{ R \in PER : R \supseteq \bigcup_ i S_ i  \\} $. 

**Question: Why not $\bigwedge_ i S_ i = \bigcup_ i S_ i $.**

It is also said it is easy to see $PER$ is closed under intersection. 

Recall the definition of subobject, which is basically an equivalence class of monos. Then recall the definition that a relation on an object $I$ in category  ${\cal B}$ with finite limits is a subobject $R \rightarrowtail I \times I$; and  a category $Rel({\cal B})$ is
> objects: subobjects with codomain of $I \times I$ for some object $I$ in ${\cal B}$
> 
> arrows: an arrow $u: I \rightarrow J \in {\cal B_0}$ that satisfies the following commutative diagram



After categorify the relations, the reflectivity, symmetricity and transitivity are:


Let's verify the transitivity in **Set** context: (TBD).





