
<details>
    <summary>To Show they are both naturally isomorphism:</summary>
    $u^{\*} \circ v^{\*} \cong (v \circ u)^{\*}$
    <br/>
    For arbitrary $X$, $\bar{u} \circ \bar{v} (X) : u^{\*} \circ v^{\*}(X) \rightarrow X$ is a cartesian morphism because cartesian morphism closed under composition. Of course, so is $\bar{v \circ u}$. We can also easily see both cartesian morphism are above same map, so there is an iso between $u^{\*} \circ v^{\*}$ and $ (v \circ u)^{\*}$
    <br/>
    $id \cong id^{\*}$
    <br/>
    Because $id$, $id^{\*}$ are both cartesian morphism over $id$.

    <br/>
    Natruality: The following diagram commutes, 
    <br/>
    <!-- ![](assets/img/2019-10-13-21-48-44.png) -->
    <img src="/assets/img/2019-10-13-21-48-44.png">
    <br/>

    Thus we can conclude $f \circ (\bar{u} \circ \bar{v}(X)) = (\bar{u} \circ \bar{v}(Y)) \circ d^{-1} \circ  (v \circ u)^*(f) \circ c$, and due to the definition of $u^* \circ v^*(f)$, (the unique arrow that makes the left square commutes), we can conclude $u^* \circ v^*(f) = d^{-1} \circ  (v \circ u)^*(f) \circ c$, which is exactly the naturality.
    
</details>
