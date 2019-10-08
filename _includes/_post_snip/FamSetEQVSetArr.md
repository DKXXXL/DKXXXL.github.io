
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
