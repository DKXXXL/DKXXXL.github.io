---
layout: post
title:  "Intro to Graph Theory, Lec 1"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Graph Theory

### Definition: Graph
* A graph $G$ consists of : a set of vertices $V(G)$, a set of edges, $E(G)$,
* and a relation (function) that assigns to each edges from $E(G)$ two vertices (from $V(G)$) (called two end-points)

* The endpoints can be the same, 
  * this kind of edge is called a loop
* multiple edges are allowed with the same endpoints
* Note: currently there is no direction specified.
* Course Convention: $V(G) \neq \empty$ ,$V(G)$ is finite (finite graph)

### Definition: Simple Graph
* multiple edges are not allowed
* loops are not allowed
* Edges are 2 elements subsets of $V(G)$
* $E(G)$ a subset of the set of

### Definition: Complete Graph
* complete graph $K_n$ means any 2 vertices have edges connected with $n$ vertices inside
  * more than one edges between vertices can still be a complete graph
* $K_1$ is just a vertex
* Most sources, complete graphs are simple complete graphs (no multiple edges and loops allowed)
  * "graph" = simple graph
  * multi-graph = multiple edges are allowed
  * loops are allowed = pseudograph allowed

***

### Definition: Isomorphism of graphs
*  $G, H$ are isomorphic (are simple graph)
*  if there is $f:V(G) \rightarrow V(H)$ is bijective (onto, 1-1)
   *  s.t.
   *  two vertices $v_1, v_2$ of $G$ are connected by an edge in $G$ 
   *  iff $f(v_1)$ and $f(v_2)$  are connected by an edge in $H$
*  there can be many isomorphisms between two graphs even in simple graphs

### Definition
*  if two vertices are connected by an edge
   *  those are called adjacent or neightbours
*  if a vertex $v$ is an endpoint of an edge $e$ , we call $v$ an incident of $e$

***

### Definition: Cycle Graph
* $C_n$ is used to represent cycle graph with $n$ nodes
  * obviously it has $n$ edges $|V(C_n)| = n$
  * $|E(C_n)| = n$
***

* $E(K_n) = C_n^{2}$
* number of (simple) graphs $G$ with $|V(G)| = n$
  * $2^{\frac{n(n-1)}{2}}$, up to isomorphic 
  * because we have  $\frac{n(n-1)}{2}$ candidates as edges
  * (every two vertices can have an edge or not)

### Isomorphism class of graphs
*  ismorphism class of $G$ is the set of all graphs isomorphic to $G$

***
* $P_n$ denotes simple graphs as paths with $n$ vertices
* $P_2 \cong C_2 \cong K_2$ interestingly
  * most likely they are not isomorphic because they don't have even same number of edges

### Definition: subgraph
* $G$ is a graph
* $H$ is a subgraph of $G$ if
  * $V(H) \subseteq V(G)$
  * $E(H) \subseteq E(G)$

***
* $H$ is induced subgraph if
  * $H$ is a subgraph and two vertices of $H$ are conneced by an edge in $H$
    * iff they are connected by an edge in $G$
    * $H$ has all edges of $G$ remaining between its vertices
    * can be applied to multi-graph, the edge shouldn't be throwed away