---
layout: post
title:  "Numerical Method Concept/Definitions"
date:   2021-02-22 00:56:11 -0400
categories: Math
---
Use text searching please

## Error + Linear System

* mantissa, significand, exponent, characteristic, significant
  * ![](/assets/img/2021-02-24-22-35-12.png)
* overflow level, OFL, underflow level, UFL
  * $N_{max}=(.aaa...)_b \times b^{(aa...a)_b}$ where $a=b-1$ while
  * $N_{min}=(.1000..)_b \times b^{-(aa...a)_b}$ if normalised, or
  * $N_{min}=(.0..001)_b \times b^{-(aa...a)_b}$ ekse
  * ![](/assets/img/2021-02-24-22-41-45.png)
* $\Reals_b(t,s)$  a notation for all numbers represented in $t$ $b$-digits mantissa including sign and $s$ $b$-digits exponent including sign
  * on real computers when $b=2$ and normalized numbers are assumed the $t$ bits mantissa including sign can represent $t+1$ bits including the sign. The notation $\Reals_2(t, s)$ is still used here in the tutorial, meaning $t+1$ bits including the sign.
  * (as one 1 is hidden in the front) 
  * Note that this can happen only when $b = 2$.
  * ![](/assets/img/2021-02-24-22-53-47.png)
* Then, there are two common ways to convert $x \in \Reals$ to a floating-point number $fl(x)\in\Reals_b(t, s)$.
  * Chopping: chop after digit $t$ of the mantissa.
  * Rounding (traditional): chop after digit t, then round $D_t$ up or down, depending on whether $D_{t+1} \ge b/2$ or $D_{t+1} < b/2$ respectively, 
    * or in other words, add b/2 to $D_{t+1}$, then chop
  * Rounding (proper or perfect): same as traditional, except when $D_{t+1} = b/2$ and $D_{t+2} = D_{t+3} = ... = 0$; then round $D_t$ up or down, to the nearest even.
  * The following is the negative as example
  * ![](/assets/img/2021-02-24-23-05-03.png)
* $\hat{x}$ as an approximation of $x$
  * absolute error is $x - \hat{x}$
  * relative error is $\frac{x - \hat{x}}{x}$
  * we usually take absolute value of above
* $fl(x)$ as floating point representation
  * round-off error :$fl(x) - x$
  * $fl(x) - x = x \delta$, 
    * $\delta$ is relative round-off error
      * we have a bound $\delta < u$,  
        * where $u$ is called unit round-off unit round off
    * which means round-off error is roughly proportional to $x$
  * $\|\delta \| \le b^{1-t}$ if normalized numbers and chopping are assumed
  * $\|\delta \| \le \frac{1}{2}b^{1-t}$ if normalized numbers and rounding are assumed
* An approximation $\hat{x}$ to $x$ is said to be correct in $r$ siginificant $b$-digits 
  * if $\|\frac{x - \hat{x}}{x}\| \le \frac{1}{2}b^{1-r}$
* for arbitrary operation $o \in \{+,-,\times, \div\}, x \hat{o} y = fl(x o y)$, 
  * makes error of easy arithmetic (including computer builtin function like $\sin$) round-off error of final result
    * i.e. $\hat{f}(x) = fl(f(x))$
* machine epsilon $\epsilon_{mach}$ is the smallest $b^{-i}, i > 0$
  * s.t. $fl(1 +\epsilon_{mach}) > 1$
  * $\epsilon_{mach} = b^{1-t}$ if chopping
  * $\epsilon_{mach} = \frac{1}{2} b^{1-t}$ if traditional rounding
  * $\frac{1}{2}b^{1-t} < \epsilon_{mach} \le b^{1-t}$ if proper rounding
    * Thus $-\epsilon_{mach} \le \delta \le \epsilon_{mach}$
    * we have $0 < UFL < \epsilon_{mach} < OFL$
* saturation:
  * a non-zero number added to the other number but the other doesn't changed, this phenomenon is called saturation
* Error propagation of simple arithmetic
  * $fl(x) \hat{\times} fl(y) \approx xy(1 + \delta_\times)$ where $\|\delta_times\| \le 3\epsilon_{mach}$
  * $fl(x) \hat{\div} fl(y) \approx xy(1 + \delta_\div)$ where $\|\delta_div\| \le 3\epsilon_{mach}$
  * $fl(x) \hat{+} fl(y) \approx xy(1 + \delta_+)$ 
    * where $\|\delta_+\| \le 2 \epsilon_{mach}$ when $xy > 0$
    * where $\|\delta_+\| \le 2 \epsilon_{mach}\|\frac{x-y}{x+y}\|$ when $xy > 0$
      * when $x\approx -y$ the relative error blows up, causing catastrophic cancellation
      * ![](/assets/img/2021-02-24-23-33-51.png)
* relative condition number $\kappa_f(x) = \|\frac{xf'(x)}{f(x)}\|$
  * assuming $f: \Reals \rightarrow \reals$ twice differentiable
    * then using Taylor Expansion 
      * $f(fl(x)) \approx f(x)(1+\delta_f)$ with $\delta_f = \frac{xf'(x)}{f(x)} \delta_x$
      * we usually can assume $\|\delta_x\| \le \epsilon_{mach}$
  * condition number is fixed between mathematically equivalent expression
* well condition: if relatively small changes in the input, produce relatively small changes in the output, otherwise it is called ill-conditioned.
  * usually we just make sure $\kappa_f(x) \le \frac{1}{\epsilon_{mach}}$
* Stability is a concept similar to conditioning, but it refers to a numerical algorithm, 
  * i.e. to the particular way a certain computation is carried out. 
  * A numerical algorithm is stable if small changes in the algorithm input parameters have a small effect on the algorithm output, otherwise it is called unstable
* Forward error, backward error
  * ![](/assets/img/2021-02-24-23-40-18.png)
  * relative forward error $\frac{y - \hat{y}}{y}$
  * relative backward error $\frac{x - \hat{x}}{x}$
  * $\|$relative forward error $\| \approx \|$ relative backward error $\| \times$ condition number
* total error, propagated data error, forward error, backward error,
* truncation error(= discretization error), rounding error
  * The truncation and the rounding errors together form the computational error
  * ![](/assets/img/2021-02-24-23-43-03.png)
* Taylor Theorem, taylor expansion
* ![](/assets/img/2021-02-24-23-46-00.png)
* ![](/assets/img/2021-02-24-23-46-48.png)
* ![](/assets/img/2021-02-24-23-47-14.png)
***
## Linear System/ Matrix
* Orthogonal matrix:
  * $A^T A = I$
  * Orthogonal matrix doesn't have to be a square matrix
* Conjugate Transpose:
  * for $A \in Complex^{m \times n}$ where $(A^H)_{ij} = \bar{A_{ji}}$
* Hermitian:
  * $A^H = A$
* Note that for real matrices, we have $A^H = A^T$
* Unitary Matrix:
  * $A^HA = I$
  * If a matrix is square unitary, then its conjugate transpose is exactly its inverse
* Normal Matrix:
  * $A^H A = AA^H$
* Permutation Matrix:
  * A square matrix where there is exactly one 1 in each row and column and remaining are zeros
  * just permute rows when apply to left of the others; permute columns when apply to the right 
  * closed under product
* Elementary Permutation Matrix:
  * just change two rows
* Permutation Matrices are orthogonal
* Inner Product of vectors $x,y$:
  * $\langle x,y \rangle = x^T \cdot y$
* Orthogonal vectors $v_1,..,v_n$:
  * if $i\neq j$ then $v_i^T \cdot v_j = 0$
* Orthonormal vectors $v_1,..,v_n$:
  * orthogonal and $v_i^T \cdot v_i = 1$
* orthogonal vectors are linearly independent 
* Unit Upper/Lower Triangle Matrices:
  * Lower/Upper triangle with $1$'s on diagonal
* Strictly Lower Triangle Matrices:
  * $A_{ij} = 0$ for $i \le j$
* Strictly Upper Triangle Matrices:
  * $A_{ij} = 0$ for $i \ge j$
* Dense/Sparse Matrix: most of its elements are non-zero/zero
  * density: the ratio of the number of non-zero/zero elements over the total
* Banded matrix: a sparse matrix $A$ that has all its non-zero elements near the diagonal.
  * Its lower bandwidth is $l$ and its upper bandwidth $u$
    * if all elements below the $l$-th sub-diagonal and above the $u$-th super-diagonal are zero. 
    * In other words, $a_{ij}$ = 0, if $i − j > l$
or $j − i > u$.
  * (Full or total) Bandwidth: $l + u + 1$.
* Symmetrically banded matrix: a banded matrix with $l = u$.
* Semi-bandwidth of a symmetrically banded matrix: $l$ or $u$.
* Tridiagonal matrix: a symmetrically banded matrix with semi-bandwidth 1.
* Pentadiagonal matrix: a symmetrically banded matrix with semi-bandwidth 2.
* (Row) Diagonally dominant Diagonal dominant matrix: a square matrix $A$ for which $\|a_{ii}\| \ge \sum_{j=1 j\neq i}^n \|a_{ij}\|$ for all $i = 1,...,n$
* Strictly (Row) Diagonally dominant Diagonal dominant matrix: a square matrix $\|a_ii\| > \sum_{j=1 j\neq i}^n \|a_{ij}\|$ for all $i = 1,...,n$
  *  Strictly diagonally dominant matrices are nonsingular
* Positive definite matrix: a square matrix $A$ for which, for any vector $x \neq  0$, $x^T Ax > 0$.
* A symmetric matrix is positive definite (SPD), iff the diagonal elements of the U factor in the LU factorization are positive.
*  Non-negative (positive, non-positive, negative) matrix: $a_{ij} \ge 0$ $(a_{ij} > 0, a_{ij} \le 0, a_{ij} < 0$ respectively), for all $i, j$. 
   *  Notation: $A \ge 0 (A > 0, A \le 0, A < 0)$
*  Monotone matrix: a real square non-singular matrix $A$ for which $A^{-1} \ge 0$
*  M-matrix:
   * a real square non-singular matrix $A$ for which $a_{ij} \le 0$, for $i \neq j$, and $A^{-1} \ge 0$.
* when $M$ is singular/$\det(m) =0$/columns(rows) are linearly dependnet
  * then $Mx = b$ either have no solution or infinitely many solutions
***
* Gauss Elimination Linear System Solving:
  * (LU Factorization) (Gauss Elimination) $\frac{n^3}{3}$ pairs of additions and multiplication (flops)
    * and $\frac{n^2}{2}$ divisions
  * Forward Substitution: $\frac{n^2}{2}$ pairs of additions and multiplications (flops)
  * Back substitution:$\frac{n^2}{2}$ pairs of additions and multiplications (flops), and $n$ divisions.
  * Total : $\frac{n^3}{3} + 2 * \frac{n^2}{2}$ pairs of add + mult (flops) and $\frac{n^2}{2} + n$ divisions
  * Cost for solving $m$ linear systems of size $n \times n$ with the same matrix:
    * $\frac{n^3}{3}$  $+ m (\frac{n^2}{2} + \frac{n^2}{2})$ flops ((LU) and m(FS+BS)) 
      * and $\frac{n^2}{2} + mn$ divisions
* Elementary Gauss transformation:
  * During GE, the elements of matrices L and U, where L is unit lower triangular and U is upper triangular are generated, and the relation $A = LU$ holds. 
  * Moreover, $L$ is the product of the inverses of the $M^{(k)}$ matrices. The matrices $M^{(k)}$ are called elementary Gauss transformations.
  * Page II-88
  * Elementary Gauss transformation is close under inversion!
  * ![](/assets/img/2021-02-23-00-28-03.png)
* Elementary Gauss transformation:
  * ![](/assets/img/2021-02-23-01-03-32.png)
  * ![](/assets/img/2021-02-23-01-04-14.png)
* LU factorization is unique:
  * $A = LU = L'U'$ if $L, L'$ are both unit lower triangle, then $L= L', U = U'$
  * $A = LU = LD\hat{U}$ where $\hat{U}$ is unit upper triangle and $D$ is diagonal
* LU factorization on Symmetric matrix:
  * each step $k$ of GE produces a symmetric $(n-k) \times (n-k)$ submatrix
  * computation lowers to $\frac{n^3}{6}$ flops
* For symmetric matrix $A$, LU factorization can lead to $A = LDL^T$
* For symmetric matrix $A$
  * $A$ is positive definite iff $A = LDL^T$ with diagonal $D$ that each entry is positive
  * Choleski factorization : For symmetric positive matrix $A$
    * $A =  LDL^T = (LD^{\frac{1}{2}})(LD^{\frac{1}{2}})^T = CC^T$
    * $C$ here as Choleski factor
* Pivot Pivoting: At the $k$-th GE step, before the multipliers at column $k$, rows $k + 1, ... , n,$ are computed, a search along the $k$th column from row $k$ to row $n$ is performed, to identify the largest in absolute value element.
  * that element becomes pivot and we apply permutation matrix to reorder the the matrix
* Row pivoting: reorder rows of the matrix. $(P_r A = LU, P_r$ permutation matrix)
* Column pivoting: reorder columns of the matrix. $(AP_c = LU, P_c$ permutation matrix)
* Partial pivoting: row or column pivoting (one of the two).
* Complete pivoting: reorder both rows and columns of the matrix. $(P_r AP_c = LU)$
  * Actually after LU is done, we have
    * $P_nP_{n-1}...P_2P_1AQ_1Q_2...Q_n = LU$
  *  At the $k$-th GE step, before the multipliers at column $k$, rows $k + 1, ... , n$, are computed, a search in the submatrix of size $(n − k + 1) \times (n − k + 1)$ is performed,
* Symmetric pivoting: reorder both rows and columns of the matrix, but when rows $k$
  * special case of above
and $s$ are interchanged, then columns k and s are also interchanged. $(PAP^T = LU)$
* Gauss Elimination LU factorization with pivoting:
  * ![](/assets/img/2021-02-23-14-45-47.png)
***
* Compute Matrix multiplication:
  * For $A \in \Reals^{m\times n}, B \in \Reals^{n\times k}$
  * cost $mnk$ flops (1 flop = 1 add + 1 mult)
* Compute the inverse of matrix:
  * cost $n^3$ flops
    * Basically solving $AX = I$
    * Thus after LU factorization, we have $L_AU_AX=I$, ($\frac{n^3}{3}$)
    * thus solving $n$ linear system with RHS as $e_i = (0,0,...0,1,0,..0)$
      * $L_Ay_i = e_i; U_Ax=y_i$
      * During forward substitution on $y_i$, we know there will be a lot of zeros in $y_i$
        * as we know we ultimately are solving
        * $L_A[(y_i)_i] = I$, which means $[(y_i)_i]$ is a unit lower triangle
      * $\frac{n^3}{3}$ (LU) $+\frac{n^3}{6}$ (F/S) $+ \frac{n^2}{2}*n = n^3$
    * ![](/assets/img/2021-02-23-00-51-45.png)
      * Thus compute inverse of unit lower triangle, we only need $\frac{n^3}{6}$ flops
    * 
* Compute $A^{-1}B$ with $A \in \Reals^{n\times n}, B \in \Reals^{n\times k}$
  * cost $\frac{n^3}{3} + n^2k$
  * first LU factorization, and solve $k$ linear system (from each column vector from $B$)
  * Don't compute inverse directly unless it is explicitly asked
* Inverse of symmetric matrix is still symmetric
* Inverse of banded matrix is **not necessarily banded** 
* solving for $(l,u)$ banded matrices
  *  (LU factorization) requires $nlu$ flops (pairs of add and mult)
  *  if A is $(l, u)$-banded, the L and U matrices arising from GE are $(l, 0)$- and $(0, u)$-banded, 
  *  The forward substitution requires $n(l+1) \approx nl$ flops
  *  The backward substitution requires $n(u+1) \approx nu$ flops
  *  the solution of an $(l, u)$-banded linear system by GE/LU and f/b/s requires $nlu + n(l + u)$ flops
  *  ![](/assets/img/2021-02-23-14-21-06.png)
  *  ![](/assets/img/2021-02-23-14-21-36.png)
* LU factorization on Symmetric matrix:
  * each step $k$ of GE produces a symmetric $(n-k) \times (n-k)$ submatrix
  * computation lowers to $\frac{n^3}{6}$ flops
* Compute inverse of unit lower/upper triangle, we only need $\frac{n^3}{6}$ flops
  * ![](/assets/img/2021-02-23-00-51-45.png)
* Gauss Elimination with row pivoting (partial pivoting)
  * cost requires $\frac{n^2}{2}$ comparisons in addition to the algorithm without pivoting
  * Asymptotically, it has the same cost as the no pivoting algorithm $\frac{n^3}{3}$
  * Cost for solving $m$ linear systems of size $n \times n$ with the same matrix:
    * $\frac{n^3}{3} + m(\frac{n^2}{2} + \frac{n^2}{2})$ flops,
      * $\frac{n^2}{2} + mn$ divisions
      * and $\frac{n^2}{2}$ comparisons
* Gauss Elimination LU factorization with scaled scaling row (partial) pivoting:
  * Cost The algorithm requires $n(n − 1) \approx n^2$ comparisons and equal number of divisions in addition to the flops and comparisons required by the partial pivoting (no scaling)
  * it requires approximately the same amount of work as the no pivoting algorithm $\frac{n^3}{3}$
* Gauss Elimination LU factorization with  complete pivoting:
  * cost $\frac{n^3}{3}$ comparisons in addition to the flops required by no-pivoting algorithm
  * Asymptotically, it requires approximately twice the amount of work of the no-pivoting algorithm $\frac{2n^3}{3}$
***
***
***
## Matrix Norm / Non-linear