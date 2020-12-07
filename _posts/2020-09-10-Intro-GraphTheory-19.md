---
layout: post
title:  "Intro to Graph Theory, Lec 1"
date:   2020-09-10 00:56:11 -0400
categories: Math
---
# Lec 19

# Planar Graph

### Definition: Planar graph
* Graph can be drawn on a plane without crossing.
* Path:
  * a continuous map from $[0,1]$ to the plane
* closed curve
* simple closed curve
* polygonal path/
  * polygonal (simple) closed curve
    * finitely many line segments
### Definition
* A (planar) drawing of a graph 
  * is $f: V \cup E \rightarrow \reals^2$
  * s.t.
    * distinct vertices maps to distinct points
    * the image of each edge is a polygonal path (???)
      * Actually, don't quite understand (???)
      * we should look at an arbtrary map and point out how is it a planar graph
* a crossing : 
  * intersection of images $f(e),f(e')$ that is not the image of common endpoint of $e, e'$
* planar graph
  * $G$ is planar if there exists a planar drawing without crossing
* Crossing number $v(G)$ is the minimal number of crossing in a drawing
* ![](../assets/img/2020-12-05-00-55-46.png) 
  * basically the intersection is all finite

### DEfinition: faces (Nov. 19. 44:22)

### Theorem: Jordan Curve Theorem (6.1.6)
* THe proof on the book is very non-rigorous

***
### Definition:
* A plane (??? is it just planar?) drawing of a planar graph is called a plane graph
* plane graph divides the plane into polygonal faces (not necessarily convex)
  * once face is unbounded (Why???)
  * **outer** face is that unbounded face

### Definition: 6.1.11 (Nov.24, 4:00, 24:25)
* the length of a face (why it is well-defined?)
  * the length of the closed walk bounding the face

### Example 6.1.12 (Nov.24, 4:00, 25:18)
* An edge appears twice iff it is a cut edge
  * = we see the same face on both sides
* it appears once if the edge seperates the face from the other faces

### Theorem: Prop 6.1.13
* sum of lengths of all faces is equal to 2$|E|$
  * use a different proof than in the book
### Definition: Dual Graph $G^*$ 6.1.7 (28:14)

![](../assets/img/2020-12-05-14-46-09.png)
very vague and abstract -- a plane graph is defined to be a function from the underlying graph to $\reals^2$.

* a dual graph $G$ has each face of $G^*$ as vertices
* and each $e \in G$ we have $e^* \in G^*$ connecting both sides of $f_1, f_2$ faces of $e$
  * (???) the $e^*$ has to cross $e \in G$
  * dual graph is defined on plane graph, plane graph is planar embedding (no crossing)
### Remark: 6.1.9:
* dual graph is still planar
* dual of dual is iso to the original if connected

### Remark: 6.1.10:
* dual of plane graph of the same graph might not be isomorphic

### lemma: trivially (32:40)
* $|E(G*)| = |E(G)|$
* length of a face in $G$ = degree of the corresponding vertex of $G^*$
* sum of lengths of faces of $G$ = sum of degrees of vertices of $G^*$

### Theorem: Euler's Formula 6.1.21

### Theorem: 6.1.23
![](../assets/img/2020-12-05-15-05-18.png)
* if $G$ is planar and bipartite, (46:06)
  * $E \le 2V -4$

### Corollary : $K_5, K_{3,3}$ are not planar (Example 6.1.24)

***
recording 20 (Nov.24, 4:01pm)

### Observation 
* average degree of planar graph $\frac{2E}{V} \le \frac{6V - 12}{V} < 6$
* thus there exists a vertex of degree at most 5
* the sum of all degrees is at most 6V-12
  * assume $G$ is connected,
    * then each vertex has degree at least 1 (connectivity)
    * there must be at least 3 vertices of degree < 6
    * ![](../assets/img/2020-12-05-15-22-05.png)

# Theorem: Kuratowski (6.2.2)
 Very LONG
### Lemma
* a graph is planar iff its subdivison is planar
* subgraph of planar graph is planar
* subgraph is not plaanar then original graph is nonplanar 
* 
### Lemma (10:41) 
  * $G$ is planar graph, $e \in G$ as an edge
    * then there exists a planar eb=mbedding of $G$ s.t.
      * $e$ is in the boundary of the outer face
    * (we can do that the bundary of any face will become bondary of the outer face ) (Lemma 6.2.4)
### Lemma (17:13) 6.2.5
* every minimal non-planar graph is 2-connected
* S-lobe is the induced subgraph of one componenet of $G-S$ and $S$
* ![](../assets/img/2020-12-06-20-41-15.png)
### Lemma (26:12) 6.2.6
* ??? what is the point adding xy-edge?
  * one of those lobe has to be nonplanar, without adding xy we still can derive this
* wrong! if you don't add xy-edge, it cannot be part of the face and locate at the outside
### Lemma (33:04) 6.2.7

### Definition: Convex Embedding (6.2.8) 38:40

### Theorem: Tutte  6.2.11
![](../assets/img/2020-12-05-15-46-01.png)

### Lemma 6.2.10 (46:42)
***
# recording-11, Nov. 26.

### Definition: Convex Embedding

### Theorem: Tutte  6.2.11
* **check the proof!!!**

### definition : plane graph
* Plane graph are actual picture of drawing on the plane

### definition: triangulation 6.1.25
* a simple plane graph s.t.
  * each face boundary is a 3-cycle (triangle)
    * doesn't have to be straightline on each edge
* ![](../assets/img/2020-12-05-16-43-55.png)

### Definition: Maximal Planar Graph 6.1.25 (27:11)
* A simple planar graph 
  * that is not a spanning graph of another planar graph
* in other words,
  * a simple planar graph
    * s.t. addition of any edge between non-ajacent vertices creates a non-planar graph

### Theorem: (6.1.26) (31:06)

### Lemma: (36:58)
* For triangluation: if there are at least 4 vertices
  * each vertex has degree at least 3
* ![](../assets/img/2020-12-05-16-54-58.png)

* if there are 4 vertices, there must be at least 4 vertices of degree < 6
### Theorem: Fary's Theorem (41:00) P247, Exercise 6.2.6
![](../assets/img/2020-12-07-00-49-32.png)

***
# recording 21, Dec 01

### Lemma: (04:00)
* For triangluation: if there are at least 4 vertices
  * each vertex has degree at least 3



### Theorem: Fary's Theorem (10:00) 

### definition: Platonic solids (application of triangulations) 
### 6.1.28 (18:00) 
* Three dimension polyhedral
  * all faces are congruent regular polygons...
  * ![](../assets/img/2020-12-05-17-11-42.png)