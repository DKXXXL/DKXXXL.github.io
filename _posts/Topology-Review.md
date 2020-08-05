# Trivial Things about Topology 
* Topology Constructions (arrows in topological space):
    *  Subspace topology
    *  Product 
    *  Quotient
    *  Open map
    *  Close map
    *  Continuous mapping

 *  Topology Definitions:
    *  (Properties on spaces themselves)
    *  Compactness
       *  (Normal) Compactness
       *  Limit point Compactness
       *  Sequential Compactness
       *  Local Compactness
       *  Paracompactness
    *  First countability (local base countable)
    *  Second countability (global countability)
    *  Harsdorff
       *  Harsdorff (points seperatable)
       *  Regular   (point-set sepertable)
       *  Normal    (set-set seperatable)
    *  locally euclidean
    *  (Not about space)
       *  Limit point
       *  limit of a sequence
       *  locally finite
       *  saturated
       *  fibre
       *  Continuity
       *  precompact

## Mix them
### constructions:
#### subspace
*  product of subspace is subspace of product
*  quotient map restricted to subset is **not** a quotient map
   *  $f: [0,1] \rightarrow S^1 := \theta \mapsto (\cos \theta, \sin \theta)$ is a closed map (by closed map lemma) and thus quotient since surjective and continuous; however, $f|_{[0,1)}$ is not quoteint map otherwise it becomes homeomprhism (since it is bijective then), thus
   *  quotient map restricted on satured open (and closed) set is still a quotient map 
*  open map restricted to subspace is **not** open
   *  just restrict to a closed set, while the closed set itself is open in the subspace topology, but it's mapping is not 
   *  open subspace of open map  is still open
*  similar for closed

*  subspace of subspace is still a subspace (composition of inclusion map retains continuity)

#### product

*  product of quotient is **not** quotient of product
   *  the easier counter example (https://math.stackexchange.com/questions/1933967/cartensian-product-of-quotient-maps)
   *  product of open quotient map is an open quotient map
*  product of open map is open
*  product of closed map is **not** closed
   *  $x \mapsto x \times x \mapsto 0$ is mapping $\{xy = 1\}$ to $\reals \backslash \{0\} \times \{0\}$ which is not closed since $(0,0)$ is in the closure

### quotient
* quotient compose with quotient map gives you quotient map
* is there any significance to compose open/closed map with qutient map?
### open & closed
* open and open composes to open
* close and close composes to close
* significance to compose two kinds?
### constructions with topology
#### Subspace:
*  subspace of compact space is **not** compact
   *  closed subspace of compact space is compact
*  subspace of sequential compact is **not** sequential compact
   *  consider a harsdorff space (thus only one limit for a convergence sequene), and make the subspace doesn't have the limit,
   *  closed subspace of sequential compact is sequential compact
*  subspace of limit point compact is **not** limit point compact
   *  arbitrary construct a converging sequence (in harsdorff) and make it a set, then we know the only limit point is the convergent point otherwise we can construct another converging point, exclude that in the subspace then we are done
   *  closed subspace of limit point compact is limit point compact 
*  similar for sequential compactness
*  subspace for local compact is 
   *  closed subspace of local compact is local compact (trivial, since closed subset of compact are compact)
   *  open subspace of local compact **Harsdorff** is locally compact
      *  A subspace X of a **locally compact Hausdorff** space Y is locally compact if and only if X can be written as the set-theoretic difference of two closed subsets of Y.
*  subspace of paracompact is ?
   *  closed subspace of paracompact is paracompact
   *  unknown about open
*  subspace of first/second countable is first/second countable
*  subspace of Harsdorff is Harsdorff
*  subspace of regular is regular
*  subspace of normal space is **not** normal
   *  Let, X={a,b,c,d} And T={∅,X,{d},{b,d},{c,d},{b,c,d} Then (X,T) is a topological space. Since (X,T) has no pair of disjoint non-empty closed sets, (X,T) is a normal space.  
      *  Consider ,Y={b,c,d} of X. Then T(Y)={∅,Y,{d},{b,d},{c,d}} Then {b} and {c} are disjoint closed sets in (Y,T(Y)) and they cannot be separated in (Y,T(Y)). Hence ,(Y,T(Y)) is not a normal space.
   *  closed subspace of normal space is normal
*  subspace of locally euclidean is not euclidean
   *  I don't think any closed set could be locally euclidean
   *  open subspace of locally euclidean is euclidean

#### product
* product of compact is compact
* product of limit point compact is **not** limit point compact
* product of sequential compact is sequential compact
* product of local compact is local compact
* product of paracompact is **not** paracompact
* product of first countable is first countable


#### quotient
*  quotient of compact is compact
*  a quotient space of a locally compact space **need not** be locally compact
*  quotient of harsdorff/first countable/second countable/locally euclidean is **not** hausdorff/first countable/second countable/locally euclidean
*  quotient of 