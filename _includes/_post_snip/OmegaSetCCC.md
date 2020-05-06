
<details>
    <summary>To Show it has finite limit and exponential:</summary>

        Recall that if a category has finite product and equalizers, then it has finite limit.

        <br/>

        Note that in the $\omega$-**Set**, you can informally see that the arrows are just "the same as" the arrows in the underlying **Set**. Thus the construction of the finite product, equalizers and exponentials are the same as **Set**, the only question is the tracking number.

        <br/>

        <strong>How to construct finite product.</strong>

        <br/>

        We claim that $(X, E_ X) \times (Y, E_ Y) \cong (X \times_{\mathbf{Set}} Y, E_ {X \times Y})$, where $E_ {X \times Y}(x,y) = ${ $ \langle n, m \rangle: n \in E_ X(x), m \in E_ Y(y) $ } and $\langle \rangle$ is effective encoding. 

        <br/>
        
        Let P be arbitrary and $ (X, E_ X) \xleftarrow{f} (P, E_ P) \xrightarrow{g} (Y, E_ Y)$. 
        <br/>
        We would have $ [ f, g ] : P \rightarrow (X \times_{\mathbf{Set}} Y, E_ {X \times Y})$ defined in the obvious way. The only thing non-obvious is the tracking number. Note we have partial recursive functions $\varphi_ f$ and $\varphi_ g$, in which case, $\forall p \in P, \varphi_ f(E_ P (p)) \subseteq E_ X(f(p)) $ and $\varphi_ g(E_ P (p)) \subseteq E_ Y(g(p)) $ thus we have $\varphi_ {\langle f, g\rangle}$ as a partial recrusive function $\varphi_ {\langle f, g\rangle} (x) := \langle \varphi_ f(x),\varphi _g (x)  \rangle$ (here $\langle \rangle$ is effective encoding) and thus $\varphi_ {\langle f, g\rangle}(E_ P(p)) \subseteq E_ {X \times Y}(f(p),g(p)) = E_ {X \times Y}([ f,g ] (p))$.

        <br/>
        Uniqueness of the arrow is ensured by the definition since any two arrows are equal when they are some **Set**-functions (don't care tracking number); and also this is the construction introduced in **Set**, thus it is unique even in the context of **Set**. 

        <br/>
        <strong> How to construct equalizer. </strong>
        <br/>

        Let $f, g : (X, E_ X) \rightarrow (Y, E_ Y)$ be two arrows on two arbitrary objects.  We have a set $S :=$ {$ x:f(x) = g(x)$}. We can see there is an object $(S, E_ S)$ s.t. $E_ S(x) := E_ X(x)$ and we have an arrow $e : (S, E_ S) \hookrightarrow (X, E_ X)$ (actually inclusion), with partial recursive function $\varphi_ e(n) := n$. 

        <br/>

        We also have to show that its universal property, where 
        the reason for uniqueness is the same as above. What remains is the reason for existence (and its tracking number). The thing is, given arbitrary $k$ s.t. $f \circ k = g \circ k$, the arrow points to the $S$ is exactly $k$ itself. The tracking number is also given by $k$.

        <br/>


        <br/>
        <strong> How to construct exponential. </strong>
        <br/>

        The construction is not so obvious. Because we are dealing with computable(recursion theory/computablity theory) function, not arbitrary function any more.
</details>
