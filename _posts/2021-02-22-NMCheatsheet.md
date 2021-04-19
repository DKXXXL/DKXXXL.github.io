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
## Matrix Norm 
* An Inner product $(\cdot ,\cdot) : S^2 \rightarrow \reals$
  * $(x,x) \ge 0$;
    * $(x,x) = 0 \iff x = 0$
  * $(\alpha x,y) = \alpha (x,y) \forall \alpha \in \reals$
  * $(x,y) = (y,x)$
  * $(x+y,z) = (x,z) + (y,z)$
* In Vector Space, a commonly used inner product
  * $(x,y) =x^T \cdot y = \sum_i x_iy_i$
* A norm $\|\cdot \| : S \rightarrow \reals^{\ge 0}$
  * ![](/assets/img/2021-03-22-19-09-27.png)
  * For each inner product, we have a corresponding norm $\|x\| = (x,x)^{\frac{1}{2}}$
* Cauchy-Schwarz Inequality:
  * $\|(x,y)\| \le (x,x)^\frac{1}{2} (y,y)^\frac{1}{2}$
  * $(x,y) = \|x\|_2\|y\|_2\cos \theta$
    * thus $\|(x,y)\| \le \|x\|_2 \|y\|_2$
* Holder Inequality: if $p,q > 0, \frac{1}{p} + \frac{1}{q} = 1$
  * then $\|(x,y)\| \le \|x\|_p \|y\|_q$
* For vectors $x$
  * $p$-norm, $\|x\|_p = (\sum_{i=1}^n \|x_i\|^p)^{\frac{1}{p}}$
  * max (infinity) norm $\|x\|_\infty = \max_{i=1}^n \{\|x_i\|\}$
  * one-norm $\|x\|_1 = (\sum_{i=1}^n \|x_i\|)$
* Vector Norms Inequalities; equivalence of norms
  * ![](/assets/img/2021-03-22-19-11-26.png)
* Matrix Norm:
  * $p$-norm, $\|A\|_p = \max_{x \neq 0}\{\frac{\|Ax\|_{p}}{\|x\|_p}\}=\max_{\|x\|_p = 1}\{\|Ax\|_{p}\}$
  * Row norm, infinity norm: 
    * $\|A\|_\infty = \max_{i=1}^m \{\sum_{j=1}^n \|a_{i,j}\|\}$
    * example: 
      * ![](/assets/img/2021-03-22-21-18-48.png)
  * Column norm, 1-norm:
    * $\|A\|_1 = \max_{j=1}^m \{\sum_{i=1}^n \|a_{i,j}\|\}$
  * ![](/assets/img/2021-03-22-21-19-15.png)
  * For the $p$-norm, the following properties, equivalence of norms:
    * ![](/assets/img/2021-03-22-21-07-14.png)
* Condition number of a non-singular matrix $A$
  * $\kappa_a(A) = \|A\|_a\|A^{-1}\|_a = \frac{\max_{x \neq 0}\frac{\|Ax\|_a}{\|x\|_a}}{\min_{y\neq 0} \frac{\|Ay\|_a}{\|y\|_a}}$
    * interpreted as ratio of largest relative stretching over the largest relative shrinking
  * properties: residuals,
  * ![](/assets/img/2021-03-22-21-24-11.png)
  * when $Q$ is orthogonal, $\|Q\|_2 = 1, \kappa_2(Q) = 1$
  * most decent algorithm will have small residuals all the time
    * which doesn't mean we have small relative error
  * ![](/assets/img/2021-03-22-21-26-38.png)
    * pf: if we assume $A$ is machine representable, then
    * by 
      * $Ax = b, A \hat{x} = \hat{b}$, thus $x-\hat{x} = A^{-1}(b - \hat{b})$
      * thus $\frac{\|x - \hat{x}\|}{\|x\|} \le \|A^{-1}\| \frac{\|b - \hat{b}\|}{\|x\|} = \|A\|\|A^{-1}\| \frac{\|b-\hat{b}\|}{\|A\|\|x\|} \le \kappa(A) \frac{\|r\|}{\|Ax\|} = \kappa(A) \frac{\|r\|}{\|b\|}$
  * equivalence of condition number:
    * ![](/assets/img/2021-03-22-22-12-33.png)
## Non-Linear
* Intermediate Value Theorem: IVT:
  * if $f$ continuous on $[a,b]$, then for all scalar $c\in (f(a),f(b))$ 
  * there exists $x \in [a,b]$ .s.t $f(x)=c$
* Mean Value Theorem: MVT:
  * if $f$ is differentiable on $(a,b)$ and continuous in $[a,b]$
    * then there exists $x$ s.t. $f'(x) = \frac{f(b) - f(a)}{b-a}$
* contraction, contractive map, systolic map
  * ![](/assets/img/2021-03-23-00-38-53.png)
* multiplicity means n-th derivative has roots
  * ![](/assets/img/2021-03-23-00-40-09.png)
* For the following: $g(x) = x \iff f(x) = 0$
  * Theorem 1: existence of root. (Bolzano) (By IVT)
  * Theorem 2: existence of fixpoint. (By Theorem 1)
    * ![](/assets/img/2021-03-23-00-14-01.png)
  * Theorem 3: uniqueness of root (by Mean Value Theorem) (basically monotonic)
  * Theorem 4: existence and uniqueness of fixed point (by Thm 2 and contraction properties)
    * ![](/assets/img/2021-03-23-00-25-18.png)
  * Theorem 4b: extension of Thm 4, convergence of a given iteration scheme
    * ![](/assets/img/2021-03-23-00-26-57.png)
* Theorem 5: existence of convergence interval 
  * ![](/assets/img/2021-03-23-00-28-01.png)
* Theorem 6: rate, order of convergence (proof by Taylor Expansion and definition of rate of convergence)
  * ![](/assets/img/2021-03-23-00-28-50.png)
* Stopping Criteria
  * ![](/assets/img/2021-03-23-10-31-01.png)
  * here $f(x^{(k)})$ is called residual of $f$ at $x^{(k)}$
  * none of the stopping criteria is perfect, any of them might lead to large error of the root
    * note that by Taylor Expansion at $x*$, we know $\|x^{(k)} - x*\| \approx \frac{\epsilon}{\|f'(x*)\|}$, where we cannot bound $\|f'(x*)\|$
* order of convergence, rate of convergence, asymptotic error constant
  * ![](/assets/img/2021-03-23-10-40-20.png)
  * ![](/assets/img/2021-03-23-10-41-12.png)
    * $\beta$ doesn't have to be an integer
* Bisection method: detecting the middle, using Thm 1
* Newton's method: $x^{(n+1)} = x^{(n)} - \frac{f(x^{(n)})}{f'(x^{(n)})}$ 
  * it is a fix-point algorithm, so we can use Thm 6 to detect convergence
    * since $f(x*) = 0$, we can prove $g'(x*) = \frac{ff''(x)}{f'(x)^2} = 0$
  * for several roots, no guarantee where Newton's method will converge to
  * When root has mupltiplicative > 1, $\beta = 1, \kappa = 1 - \frac{1}{m}$
  * modified newton's method:
    * ![](/assets/img/2021-03-23-11-41-46.png)
* Secant Method: using previous two steps to approxmiate derivative of Newton's Method
  * ![](/assets/img/2021-03-23-11-45-38.png)
  * starting with guess two, and we must have $f(x^{k}) \neq f(x^{k-1})$
  * doesn't always converge
  * $\beta = \frac{1+\sqrt{5}}{2}$
  * it also converges slowly close to multiplicative root
  * no guarantee which root to converge if multiple root
* Newton's Method for System of non-linear equation:
  * ![](/assets/img/2021-03-23-11-56-54.png)
  * complexity:
    * ![](/assets/img/2021-03-23-11-58-06.png)
  * doesn't always converge
  * Broyden's Method: (Secant on non-linear system)
    * ![](/assets/img/2021-03-23-11-59-33.png)
* ![](/assets/img/2021-03-23-10-51-32.png)
* divergence, monotonic convergence, alternating convergence, quadratic convergence
  * ![](/assets/img/2021-03-23-12-07-03.png)
* matrix inverse, 2x2
  * ![](/assets/img/2021-03-25-12-24-08.png)

## Polynomial Interpolation:
* Weierstrass Theorem:
  * ![](/assets/img/2021-04-18-18-02-21.png)
* Horner's Rule:
  * Standard algorithm to evaluate a polynomial
  * ![](/assets/img/2021-04-18-21-29-27.png)
    * about $O(n)$ with degree $n$
  * Horner's rule for evaluating polynomial
  * ![](/assets/img/2021-04-18-21-30-58.png)
    * NDD (Newton's Divided Difference) form also have a simple algorithm to evaluate
* Existence and uniqueness of the interpolating polynomial
  * Theorem: Given data $(xi, fi)$, $i = 0, ... , n$, with the $xi$ being distinct, there exists a unique polynomial of degree at most $n$, interpolating the data
* Polynomial using monomial basis
  * for $p_n(x) = a_0 + a_1x^1 + ... a_nx^n$
  * with $n+1$ data $(x_i, f_i)$, we decides $n+1$ coefficient
  * ![](/assets/img/2021-04-18-21-39-03.png)
    * $B$ is called Vandermonde matrix, non singular but ill-conditioned for large $n$
    * we may have $a_n = 0$ indicating degree less than $n$
  * in matlab we use
    * pn=polyfit(xi,yi,n) finding a polynomial with degree at most n, but requiring xi has n+1 elements
      * polyval(pn, x) will eval pn on x 
* Polynomial Interpolation with Lagrange basis
  * Assume we interpolate on $(x_i,f_i)$ with $i=0,..,n$
  * Define $l_j^{(n)}(x)$ basis functions
    * ![](/assets/img/2021-04-18-21-49-24.png)
      * with property that $l_j^{(n)}(x_j) = 1$ but zero at other data points
  * ![](/assets/img/2021-04-18-21-57-11.png)
  * Example:
    * ![](/assets/img/2021-04-18-21-57-45.png)
* Polynomial Interpolating with Newton's basis
  * NDD : Newton's Divided Differences: $f[x_i,..,x_j]$
    * Example
    * ![](/assets/img/2021-04-18-22-15-38.png)
    * ![](/assets/img/2021-04-18-22-16-18.png)
    * ![](/assets/img/2021-04-18-22-38-04.png)
      * ![](/assets/img/2021-04-18-22-38-57.png)
      * $a_i = f[x_0,x_1,...,x_i]$\
    * Example: incrementing:
      * ![](/assets/img/2021-04-18-22-39-35.png)
    * complexity:
      * construct NDD takes $O(n^2)$
      * takes $O(n)$ flops to evaluate one point
      * often there are much more evluation points than $n$, thus of much higher cost than $O(n^2)$
* Comparison of three basis: Monomial, Lagrange, Newton
  * ![](/assets/img/2021-04-19-07-06-58.png)
  * ![](/assets/img/2021-04-19-07-07-23.png)
    * for machine computational purpose, Newton is preferred
* Error in polynomial interpolation
  * ![](/assets/img/2021-04-19-07-09-27.png)
    * if f happens to be a polynomial of degree at most n, i.e. $f^{(n+1)} = 0$, then the interpolant is just f itself
  * The error at interpolant is zero
  * Denote $W(x) = \prod_i(x-x_i)$
  * ![](/assets/img/2021-04-19-07-22-40.png)
  * If the points xi are equidistant, W(x) tends to be larger towards the endpoints and smaller towards the midpoint (a + b)/2.
  * **Chebychev points**:
    * Certain choices for non-equidistant xi’s (denser towards the endpoints and sparser towards the midpoint) even-up W(x) along [a, b], so that max abs(W(x)) is minimized. Such choices are the so-called Chebychev points.
  * problems of polynomial interpolation
    * In order to get a fairly good approximation to a function f(x) by an interpolating polynomial of nth degree, it is often necessary to use a fairly large n. Unfortunately, polynomials of high degree often exhibit an oscillatory behaviour towards the endpoints.
      * ![](/assets/img/2021-04-19-09-11-03.png)
      * This problem is partly overcome by using the Chebyshev points, but we don't always have rights to choose data points
      * high degree polynomial 
        * had Vandermonde matrix and thus ill-conditioned, 
        * sensitive to small pertubations of the coefficient 
        * amplify error when doing evaluation of the polynomial
## Piecewise Polynomial Interpolation:
* advantage compared to poly interpolant:
  * avoids oscillatory behaviour for large n;
  * guarantees that the error decreases as n increases;
  * often leads to well-conditioned matrices;
  * requires O(n) flops for construction and O(1) flops for evaluation per data point.
* piecewise polynomial, spline, knots, nodes, breakpoints, gridpoints
  * ![](/assets/img/2021-04-19-09-24-48.png)
  * ![](/assets/img/2021-04-19-09-28-21.png)
  * A pp p(x) of degree N w.r.t. ∆ is often written as a function with n branches, with $(N+1)n$ coefficients
    * For example, if p(x) is continuous at the interior knots, (N + 1)n − (n − 1) coefficients uniquely define the pp. (Because there will be n-1 equations)
    * In general, a pp of degree N w.r.t. ∆ with continuous derivatives up to order k is uniquely defined by d = (N + 1)n − (k + 1)(n − 1) coefficients. 
    * For example, $P^1_{\Delta,-1}$ has dimension $2n$ (non continuous at all, thus -1)
    * We then say that the dimension of the space $P^N_{\Delta,k}$ of pps of degree N w.r.t. ∆ with continuous derivatives up to order k is d.
    * Thus The dimension of maximum continuity (smooth) splines of degree N w.r.t. ∆ is $d = (N + 1)n − N(n − 1) = n + N$
* Liner spline interpolation
  * ![](/assets/img/2021-04-19-09-43-18.png)
  * Error of linear spline interpolation 
    * ![](/assets/img/2021-04-19-10-42-00.png)
    * if we doubles $n$ (take twice the number of subintervals ~ almost twice number of data points), we can decrease our error bound by a factor of 4
    * No computation needed for linear spline interpolation, but evaluation requires finding subinterval and $O(1)$ calculation
* Cubic Spline Interpolant
  * ![](/assets/img/2021-04-19-10-44-35.png)
  * end conditions: 
    * clamped cubic spline interpolation, natural cubic spline interpolation, not-a-knot cubic spline interpolation
    * ![](/assets/img/2021-04-19-10-50-06.png)
    * ![](/assets/img/2021-04-19-10-55-36.png)
  * Error of the cubic spline interpolation
    * ![](/assets/img/2021-04-19-10-57-14.png)
    * Similar order error bounds hold for the not-a-knot and the natural cubic spline inter- polants.
    * If $f^{(4)} = 0$ (say $f$ is polynomial of degree up to 3), then error is zero, interpolant is exactly
    * if we double the data points, we will decrease error bound by a factor of 16
    * we say convergence rate is of fourth order
* Re-cap
  *  A cubic spline is a cubic pp (thus it can be written in the form (10)) satisfying thecontinuity conditions (11)-(13).
  * A cubic spline interpolant is a cubic spline (i.e. a cubic pp of the form (10)) satisfying, besides the continuity conditions (11)-(13), the interpolating conditions (14), and one type of end-conditions among (15), (16), (17) or (18).
* MATLAB spline:
  * ![](/assets/img/2021-04-19-11-02-44.png)
* Construction of clamped cubic spline interpolant:
  * you can see it from note5pp2
* Rate of Convergence of interpolation:
  * A method with order $p$ satisfies $e_n \approx kn^{-p}$ for some $k$
    * ![](/assets/img/2021-04-19-11-25-27.png)
    * ![](/assets/img/2021-04-19-11-25-59.png)
* Experimentally determine the order of convergence of an interpolation method
  * ![](/assets/img/2021-04-19-11-27-19.png)
* Piecewise cubic Hermite Interpolation
  * advantage over cubic spline interpolant
    * incorporate derivative data points
    *  original data may not be smooth enough to be cubic spline interpolated
    *  shape preserving (presrving local max/min and montonicity)
    *  ![](/assets/img/2021-04-19-12-08-33.png)
 * calculate 
   * ![](/assets/img/2021-04-19-12-08-59.png)
   * ![](/assets/img/2021-04-19-12-13-15.png)
   * just first deriviate continuous and interpolants.

