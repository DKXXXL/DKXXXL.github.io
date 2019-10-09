
<details>
    <summary>To Show it has finite limit and exponential:</summary>

        Recall that if a category has finite product and equalizers, then it has finite limit.


        <br/>

        <strong>How to construct finite product.</strong>

        <br/>

        We claim that $(X, E_ X) \times (Y, E_ Y) \cong (X \times_{\mathbf{Set}} Y, E_ {X \times Y})$, where $E_ {X \times Y}(x,y) = ${ $ \langle n, m \rangle: n \in E_ X(x), m \in E_ Y(y) $ } and $\langle \rangle$ is effective encoding. 

        <br/>
        
        Let P be arbitrary and $ (X, E_ X) \xleftarrow{f} (P, E_ P) \xrightarrow{g} (Y, E_ Y)$. 
        <br/>
        We would have $ [ f, g ] : P \rightarrow (X \times_{\mathbf{Set}} Y, E_ {X \times Y})$ defined in the obvious way. The only thing non-obvious is the tracking number. Note we have partial recursive functions $\varphi_ f$ and $\varphi_ g$, in which case, $\forall p \in P, \varphi_ f(E_ P (p)) \subseteq E_ X(f(p)) $ and $\varphi_ g(E_ P (p)) \subseteq E_ Y(g(p)) $ thus we have $\varphi_ {\langle f, g\rangle}$ as a partial recrusive function $\varphi_ {\langle f, g\rangle} (x) := \langle \varphi_ f(x),\varphi _g (x)  \rangle$ (here $\langle \rangle$ is effective encoding) and thus $\varphi_ {\langle f, g\rangle}(E_ P(p)) \subseteq E_ {X \times Y}(f(p),g(p)) = E_ {X \times Y}([ f,g ] (p))$.

        <br/>
        Uniqueness is ensured by the definition since any two arrows are equal when they are some **Set**-functions (don't care tracking number).

        <br/>
        <strong> How to construct equalizer. </strong>
        <br/>

        <br/>
        <strong> How to construct exponential. </strong>
        <br/>

</details>
