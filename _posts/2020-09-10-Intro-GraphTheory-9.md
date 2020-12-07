---
layout: post
title:  "Intro to Graph Theory, Lec 1"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Lec 9
* prufer code will be tested
### Definition 
### Theorem 
* minimal size of a vertex cover is never less than the meximal size of a matching
* in bipartitpe graph, they are the same
* (konig egervary theorem)
* $\alpha(G)$ max size of independent set
* $\alpha'(G)$ max size of matching
* $\beta(G)$ min size of vertex cover
* $\beta'(G)$ min size of edge cover
  * which will cover all vertex
  * only make sense without isolated vertices
    * thus $\alpha'(G) \le \beta(G)$

### Lemma: 3.1.21:
* $\alpha(G) + \beta(G) = n(G) = |V(G)|$

### Theorem: Gallai
* $\alpha'(G) + \beta'(G) = |V(G)|$
* corollary: if $G$ has no isolated vertices
  * $\beta'(G) \ge \alpha(G)$
* if $G$ is a bipartite graph without isolated vertices,
  * then $\alpha(G) = \beta'(G)$
  * the maximum size of an independent set is equal to the mimum size of an edge cover

### Definition: 
* Factor of $G$ = spanning subgrpah
* k-factor = k-regular spanning subgraph
  * example: 1-factor = perfect matching 