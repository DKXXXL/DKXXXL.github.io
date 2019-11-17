---
layout: post
title:  "Notes on Curry Howard Iso, 0: Un(i)typed LC"
date:   2019-11-10 00:56:11 -0400
categories: CS Logic
---
# IN CONSTRUCTION

Notes that, this note is following the book *Lecture on Curry Howard Isomorphism*. 

## Preliminaries

The book introduces the syntax of the raw lambda calculus as pre-term $\Lambda^-$; while define $\Lambda$ term as the $\alpha$-equivalence classes of each pre-term. 

However, in this case, when working on equivalence classes, the definition of free variables, substitution and $\beta$-reduction requires proof of well-defined-ness.

The well-defined of "free-variable" requires a proof of
> for pre-term $a =_\alpha b$, $FV(a) = FV(b)$



## The Church-Rosser Property

Recall the beta conversion
> $\rightarrow_{\beta}$

Let's first show that
> If $\succ$ has diamond property, then $\succ^{\* }$ also has one.
> 
> Note: $\succ^{\*}$ stands for the *least* transitive closure of $\succ$

where 
> A relation $R$ has **diamond property** whenever: 
> 
> if $wRx, wRy$ for arbitrary $w,x,y$, there is $z$ s.t. $xRz$ and $yRz$.

<details>
    <summary>Comment.</summary>
    <p>
        We know the difference of *least* fixpoint and any other fixpoint: A least fixpoint correspond to the induction and also a greatest one corresponds to the co-induction; but not anyother fixpoint.
        <br/>
        More importantly, if you (inductively) define the transitive closure in Coq, you can easily seperate the transitive closure $\succ^{\* }$ into a number-indexed set of relations, $\bigcup_n \succ^n$, where $\succ^0 = \succ^=$ is just diagonal; $\succ^1 = \succ$ and "$a \succ^{n+1} c$ only when there is $b$ s.t. $a \succ^n b$ and $b \succ c$".
        <br/>
        That is being said, you can easily explicitly labeled out the once-implicit 'step' it takes in the transitive closure because it is defined to be the 'least' fixpoint. However, you cannot do the same thing in arbitrary fixpoint relation. Because some part of these relations might not even be "reachable" from the first place.
        <br/>
        From this perspective, the proof given in the book is clear: it is just a double induction (first-row-then-column-wise) on $x,y$ in the context of $w \succ^n x$ and $w \succ^m y$. 
    </p>
</details>

According to the book, we only need to show
> $\rightarrow_l$ has diamond property.

In other words,
> For arbitrary $A, B, C$, if $A \rightarrow_l B, A \rightarrow_l C$, then there exists $D$ s.t. $B \rightarrow_l D$ and $C \rightarrow_l D$. 

<details>
    <summary>Proof.</summary>
    <p>

Induction on $A \rightarrow_l B$ for proposition :  <p> </p>

For arbitrary $A, B$ if $A \rightarrow_l B$, and for arbitrary $C$ and if $A \rightarrow_l C$, then there exists $D$ s.t. $B \rightarrow_l D$ and $C \rightarrow_l D$. <p> </p>

Base Case: When $B \equiv A$, then we know exists the $C$ s.t. $A \rightarrow_l C$ and $C \rightarrow_l C$. <p> </p>

Inductive Step: Assume I.H. holds for some fixed $P \rightarrow_l P'$. When $\lambda x. P \rightarrow_l \lambda x.P'$ and $\lambda x.P \rightarrow_l C$. By the definition of $\rightarrow_l$, we know either $C \equiv \lambda x. P$, which would be a trivial case; or $C \equiv \lambda x. C'$ in a lambda form. (Since $\equiv$ means same equivalence class, thus the binding variable doesn't matter). And also, $P \rightarrow_l C'$ again by definition. Thus by I.H., there is $D'$ thus $C' \rightarrow_l D'$ and $P \rightarrow D'$ and thus $\lambda x. D'$ is what desired. <p> </p>


Inductive Step 2: Assume I.H. holds for some fixed $P \rightarrow_l P'$ and for some fixed $Q \rightarrow_l Q'$. When $P Q \rightarrow_l P' Q'$ and $P Q \rightarrow_l C$. There are only two cases how $C$ is formed. <br>

Case 2.a: If $C \equiv C_ 0 C_ 1$ and we also get $P \rightarrow_l C_ 0$ and also $Q \rightarrow_l C_ 1$. Now by I.H., everything is trivial. <br>

Case 2.b: If $C \equiv P''[x:=Q'']$ for some $P'', Q'', x$. Thus we know $P \equiv \lambda x. P_0$ and $P_0 \rightarrow_l P'', Q \rightarrow_l Q''$. Thus $P \rightarrow_l \lambda x. P''$. Thus By I.H., there is $C_P$ s.t. $\lambda x. P'' \rightarrow_l C_P$ and $P' \rightarrow_l C_P$. and also $C_Q$ merges $Q', Q''$. <br>

Thus $C \equiv P''[x:=Q''] \rightarrow_l C_P C_Q$ (by rule 3); and $P' Q' \rightarrow C_P C_Q$. <p> </p>


Inductive Step 3: Assume I.H. holds for some fixed $P \rightarrow_l P'$ and for some fixed $Q \rightarrow_l Q'$.  When $(\lambda x.P) Q \rightarrow_l P'[x:= Q']$ and $(\lambda x.P) Q \rightarrow_l C$ for some $C$. <br>

Case 3.a: If $C \equiv C_0 C_1$ where $\lambda x.P \rightarrow_l C_0$ and $Q \rightarrow_l C_1$. Thus $C_0 \equiv \lambda x. C_0'$. and $P \rightarrow_l C_0'$. Thus we have $C_P$ merges $P'$ and $C_0'$. and $C_Q$ merges $Q'$ and $C_1$. Thus $C_0 C_1 \equiv (\lambda x. C_0' )C_1 \rightarrow_l C_p[x:= C_Q]$ (by rule 3) and $C_P[x:=C_Q]$ by the below lemma.<br>

Case 3.b: If $C \equiv P''[x:=Q'']$.<p> </p>

    </p>
</details>

To derive a proof in this case won't be hard -- the point is how does the definition $\rightarrow_l$ come up? A superset of $\rightarrow_\beta$ but a subset of its transtive closure, which also supports diamond property. You will see that the reasoning above is totally in a wrong direction -- the researcher should first spot the fact that diamond property will be inherited by the transitive closure; and then attempt to construct the $\rightarrow_l$ from its specification. 
**Something is missing here in this context.**  

We also need to prove the below lemma
> $M \rightarrow_l M'$ and $N \rightarrow_l N'$ implies $M[x := N] \rightarrow_l M'[x := N']$

Interestingly, textbook says the above Theorem justifies the $\Lambda$ theory with $=_\beta$ is a consistent theory, by showing an unprovable statement.


## A detour on computability

### Church Numeral

We can use lambda term to define natural numbers:
$$c_n = \lambda s. \lambda z. s^n(z)$$

If you look closely, this is just a twisted, untyped version of inductive definition of $\mathbb{N}$, two constructors one as zero and the other as predecessor. The way to define the arithmetic operation is simple:

Addition is just counting when one of the $z$ is the other number, 
*  $a + b :=  (\lambda s. \lambda z. b(s, a(s, z)) )$
  
After we have addition, $n \times m$ is just $m$ plus to itself for $n$ times. It is easy to see, the argument in $s$ will be applied for $n$ times.

* $a \times b := \lambda s. \lambda z. b(\lambda z. a(s,z), z)$

Use the same idea, exponential is the same:

* $a^b := \lambda s. \lambda z. b( - \times a, 1)$
* $1 := \lambda s. \lambda z. s(z)$

### Recursion

We have the famous fix point, $\mathbf{Y}$ combinator, where $Y f  =_{\beta} f(Y(f))$ for arbitrary $f$. Let's make the construction of $Y$ acceptably smooth. 

Observe $(\lambda x. x x)$, this term applies to itself would lead to the self-application again. This inspires us that a self-application of $\lambda x. ((x x) x)$ would lead to an infinite chain of self-application with increasing length. Just like how $Y$ applies to $f$  can lead to $f$ at the front; this one is just increasing at back. That means $\lambda x. (x (x x))$ would be increasing in the correct direction. Let's try to make the first $x$ into $f$ and see what's the result of one time self-apply. $(\lambda x. f (x x)) (\lambda x. f (x x)) \rightarrow_\beta f ((\lambda x. f (x x)) (\lambda x. f (x x)))$ surprisingly what we want -- For a fixed $f$, we constructed its fixpoint w.r.t $=_\beta$, which means $\Delta =_{\beta} f \Delta$. Let's try to abtract $\Delta$ to depend on $f$, which just mean $\mathbf{Y} := \lambda f. ((\lambda x. f (x x)) (\lambda x. f (x x)))$

Without any background of Functional Programming, you would say "oh! Beautiful! Any lambda term would have a fix point now, so what?". The point is, we can use recursive equation to represent function/computation/lambda term now. Generally speaking, a recurrence equation is (defining $f$) in a form of $f = G(f)$, and thus $f$ is actually a fixpoint of $G$, thus we can equivalently say $f = \mathbf{Y}(G)$. 

For example, we know factorial $$n! :=  n > 0 ? n \times (n-1)! : 1$$
where $! : \mathbb{N} \rightarrow \mathbb{N}$, can be easily represented by $!' := \lambda f. \lambda n. n > 0 ? n \times f(n-1) : 1$ and $! := \mathbf{Y}(!')$. Under this definition, $n! =_ \beta Y(!')(n) =_ \beta ((!')(Y(!')))(n) =_ \beta n>0?n \times Y(!')(n-1) : 1 =_ \beta n>0? n \times (n-1)! : 1$

If you have read the little schemer, you would find out more behind -- about how this $\mathbf{Y}$ cannot be used in a call-by-value language. Taking the above definition as example, when evaluating, it is the $Y(!')$ will keep being (infinitely) expanded. But we have a reduction way (i.e. there is a terminating term beta-equivalent to this term), it is just the normally used call-by-value, (evaluate the argument and the function first before application) cannot lead to that.

### Recursion Theory 

To show the expressibility, the book showed that every recursion/computable function is expressable in $\lambda$ term. But of course, we are not going to introduce other primitive datat type other than $\Lambda$ term, (e.g. natural number), thus we will use church numeral (the above) as 'natural number'.

> A numeric function $f : \mathbb{N}^m \rightarrow \mathbb{N}$ is __$\lambda$-definable__ if there is a $\Lambda$ term $F^\lambda$ s.t. $$F^\lambda (c_ {n_ 1}, c_ {n_ 2}..., c_ {n_ m}) = c_{f(n_ 1, .. n_ m)}$$

Because the class of *recursive functions* are inductively defined, we can again use induction to show that all the *recursive functions* are $\lambda$-definable.

***
Recall Rice Theorem: 
> For a *nontrivial* set of  language $P$, the set $\{\langle M \rangle: L(M) \in P \}$ is undecidable
> 
> where *nontrivial* means $\exists M_1, M_2$ s.t. $L(M_1) \in P, L(M_2) \not \in P$

Here $M$ is turing machine, $\langle M \rangle$ is the encoding of $M$.


To formally prove the above problem, we just need half semster of any standard computability course. I remember that the idea of mapping reduction and at least one undecidable problem (proved by diagonal argument) is necessary.

We will have the Kleene's approach as below.

> Let $\langle - , - \rangle: \mathbb{N}^2 \rightarrow \mathbb{N}$ be a bijective, recursive function,
> 
> With which we will have $\\# : \Lambda^- \rightarrow \mathbb{N}$ by defining $\\#(v_i) = \langle 0, i \rangle$, $\\#(\lambda x. M) = \langle 2, \langle \\# (x), \\# (M) \rangle \rangle$ and $\\#(M N) = \langle 3, \langle \\# (M), \\# (N) \rangle \rangle$

And we can extend to define on $\Lambda$, thus for $M \in \Lambda$, $\\# (M)$ be the least possible $\\# (M')$ s.t. $M' \in M$. 

Right before the Rice Theorem, we need these definitions:
> For $A \subseteq \Lambda$
> 
> * $A$ is *closed under* $=_ \beta$ when [ if $x \in A, x =_ \beta y$ then $y \in A$ ]
> * $A$ is *nontrivial* if $A$ is not empty or $\Lambda$
> * $A$ is *recursive* if $\{\\#(M) : M \in A\}$ is recursive (i.e.) there is a $\Lambda$ term $F$ that will always terminate with $c_ 0, c_ 1$ s.t. $F \\#(x) =_ \beta c_ 1 \Leftrightarrow x \in A$
> 
> We claim that if $A$ is closed under $=_ \beta$ and nontrivial, then $A$ is not recursive. 

Proof, basically a copy from the book. I was having a hard time to come up one proof by myself, even the Rice Theorem phrased in Turing Machine.



Assume $A$ is recursive, then we know $\{M : M c_ {\\#(M)} \in A\}$ is also recursive (using the same 'checking' $\Lambda$ term). Thus we know there is $F \in \Lambda$ s.t. $x \in B \Leftrightarrow F \\#(x) =_ \beta c_ 1$.

We take $M_0 \in \Lambda \backslash A, M_1 \in A$ and 

Now we make a [$G := \lambda x. \text{if zero? } Fx \text{ then }M_1 \text{ else } M_0$].

If $G  c_ {\\#(G)} \in A$, then $G  c_ {\\#(G)} =_ \beta M_0 \not \in A$;

If $G  c_ {\\#(G)} \not \in A$, then $G  c_ {\\#(G)} =_ \beta M_1 \in A$

A contradiction. $\blacksquare$

There is a strong similarity between this proof and the proof of the halting problem. This technique is called diagonal argument. We can have halting problem (phrased in $\lambda$-term) easily proved by this theorem.

