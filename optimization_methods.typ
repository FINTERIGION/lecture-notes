#import "template.typ": *

#note(
  title: "Optimization Methods"
)[
  = Optimization Problems
  == Minimizers
  #def(name: "Optimization Problem")[
    Let $f_0$ be a real-valued objective and let $x$ be the optimization variable. A problem with inequality and equality constraints is
    $ min_x f_0(x) quad "s.t." quad cases(
      f_i (x) <= 0,
      h_j (x) = 0.
    ) $
    The functions $f_i$ and $h_j$ are the constraints, and $D = {x | f_i (x) <= 0, h_j (x) = 0}$ is the feasible set.
  ]
  #def(name: "Global and Local Minimizers")[
    A point $x^* in D$ is a global minimizer of $f: D -> RR$ if $ forall x in D, f(x^*) <= f(x)$. It is a local minimizer if some neighborhood $N$ of $x^*$ satisfies $ forall x in N inter D, f(x^*) <= f(x)$. The minimizer is strict if the inequality is strict for every $x != x^*$.
  ]
  #def(name: "Semicontinuity")[
    A function $f$ is lower semicontinuous at $x^*$ if
    $ f(x^*) <= liminf_(x -> x^*) f(x), $
    and upper semicontinuous at $x^*$ if $f(x^*) >= limsup_(x -> x^*) f(x)$.
  ]
  #def(name: "Minimizing Sequence")[
    Let $f^* = inf f(x)$. A sequence ${x_k}$ is minimizing if $f(x_k) -> f^*$.
  ]
  #prop[
    Suppose $f$ is lower semicontinuous on $D$. If a minimizing sequence ${x_k}$ has a cluster point $x^* in D$, then $f(x^*) = f^*$. In particular, $x^*$ is a global minimizer.
  ]
  #pf[
    Along a subsequence converging to $x^*$ one still has $f(x_(k_j)) -> f^*$. Lower semicontinuity gives $f(x^*) <= liminf_j f(x_(k_j)) = f^*$. The reverse inequality holds because $f^*$ is the infimum and $x^* in D$.
  ]
  #re[
    A minimizing sequence need not converge to a minimizer.
  ]
  == Optimality Conditions
  Let $D subset RR^d$ be open and let $f: D -> RR$.
  #def(name: "Gradient")[
    The function $f$ is differentiable at $x in D$ if there is a linear form $ell$ such that
    $ f(x + h) = f(x) + ell(h) + o(||h||) quad (h -> 0). $
    Then $ell(h) = chevron.l nabla f(x), h chevron.r$, where
    $ nabla f(x) = ((partial f) / (partial x_1), dots.c, (partial f) / (partial x_d))^T $
    is the gradient of $f$ at $x$.
  ]
  #def(name: "Hessian")[
    If the second partial derivatives exist, the Hessian $H(x) = nabla^2 f(x)$ is the matrix
    $ (nabla^2 f(x))_(i j) = frac(partial^2 f(x), partial x_i partial x_j). $
    If $f in C^2$, then $partial_(i j) f = partial_(j i) f$, namely $nabla^2 f$ is symmetric.
  ]
  #thm(name: "Taylor Expansion")[
    Suppose $f in C^2$. Then there exists $t in (0, 1)$ respectively such that
    $ f(x + p) = f(x) + p^T nabla f(x + t p), $
    $ f(x + p) = f(x) + nabla f(x)^T p + frac(1, 2) p^T nabla^2 f(x + t p) p, $
    $ nabla f(x + p) = nabla f(x) + integral_0^1 nabla^2 f(x + t p) p dif t. $
  ]
  #thm(name: "Necessary Conditions")[
    Suppose $x^*$ is a local minimizer of $f$ and $nabla^2 f$ exists and is continuous on an open neighborhood of $x^*$. Then $nabla f(x^*) = 0$ and $nabla^2 f(x^*)$ is positive semidefinite.
  ]
  #thm(name: "Sufficient Conditions")[
    Suppose $f in C^2$ on a neighborhood of $x^*$. If $nabla f(x^*) = 0$ and $nabla^2 f(x^*)$ is positive definite, then $x^*$ is a strict local minimizer of $f$.
  ]
  = Line Search
  == Wolfe Conditions
  #def(name: "Descent Direction")[
    A vector $p$ is a descent direction for $f$ at $x$ if $p^T nabla f(x) < 0$. For every sufficiently small $epsilon > 0$ one then has $f(x + epsilon p) < f(x)$.
  ]
  #prop[
    Let $f(x) = frac(1, 2) x^T A x - b^T x$ with $A$ symmetric and positive semidefinite, and let $p^T A p > 0$. The exact line-search step from $x$ along $p$ is
    $ alpha = - frac(nabla f(x)^T p, p^T A p), quad nabla f(x) = A x - b. $
  ]
  At a point $x_k$, fix a descent direction $p_k$ and write $f_k = f(x_k)$, $nabla f_k = nabla f(x_k)$, and $phi(alpha) = f(x_k + alpha p_k)$ for $alpha > 0$.
  #def(name: "Wolfe Conditions")[
    Fix constants $0 < c_1 < c_2 < 1$. A step $alpha > 0$ satisfies the _Armijo_ condition, or sufficient-decrease condition, if
    $ f(x_k + alpha p_k) <= f_k + c_1 alpha nabla f_k^T p_k. $
    It satisfies the curvature condition if
    $ nabla f(x_k + alpha p_k)^T p_k >= c_2 nabla f_k^T p_k, $
    namely $phi'(alpha) >= c_2 phi'(0)$. The two inequalities together are the _Wolfe_ conditions.
  ]
  #re[
    Since $phi'(0) < 0$, the Armijo inequality holds for every sufficiently small $alpha > 0$. If $phi'(alpha)$ is still largely negative, a longer step can decrease $f$ further. The curvature condition excludes those short steps.
  ]
  #prop(name: "Existence")[
    Suppose $f: RR^n -> RR$ is continuously differentiable and $p$ is a descent direction at $x$. If $f$ is bounded from below on the ray ${x + alpha p | alpha > 0}$ and $0 < c_1 < c_2 < 1$, then the steps $alpha$ that satisfy the _Wolfe_ conditions form a nonempty union of open intervals.
  ]
  #def(name: "Strong Wolfe Conditions")[
    The strong _Wolfe_ conditions keep the Armijo inequality and replace the curvature inequality by a two-sided bound: for some $c_2 in (c_1, 1)$,
    $ abs(nabla f(x_k + alpha p_k)^T p_k) <= - c_2 nabla f_k^T p_k. $
  ]
  #def(name: "Goldstein Condition")[
    For a constant $c in (0, 1\/2)$, a step $alpha > 0$ satisfies the _Goldstein_ condition if
    $ f_k + (1 - c) alpha nabla f_k^T p_k <= f(x_k + alpha p_k) <= f_k + c alpha nabla f_k^T p_k. $
  ]
  == Convergence of Line Search
  Let $theta_k$ be the angle between $p_k$ and $-nabla f_k$, so
  $ cos theta_k = - frac(nabla f_k^T p_k, ||nabla f_k|| ||p_k||). $
  Descent directions have $cos theta_k > 0$.
  #thm(name: "Zoutendijk")[
    Suppose every $p_k$ is a descent direction and every step $alpha_k$ satisfies the Wolfe conditions. Assume $f$ is bounded from below and continuously differentiable on an open set $N$ containing ${x : f(x) <= f(x_0)}$, and assume $nabla f$ is Lipschitz continuous on $N$ with constant $L$. Then
    $ sum_(k = 0)^oo cos^2 theta_k ||nabla f_k||^2 < oo. $
  ]
  #pf[
    The Armijo condition gives $f_(k + 1) - f_k <= c_1 alpha_k nabla f_k^T p_k$. The curvature condition rearranges to
    $ (nabla f_(k + 1) - nabla f_k)^T p_k >= (c_2 - 1) nabla f_k^T p_k. $
    Lipschitz continuity of the gradient bounds the same inner product by $L alpha_k ||p_k||^2$, so
    $ alpha_k >= frac((c_2 - 1) nabla f_k^T p_k, L ||p_k||^2) > 0. $
    Insert this lower bound into the decrease of $f$. Since $nabla f_k^T p_k < 0$,
    $ f_(k + 1) - f_k <= - frac(c_1 (1 - c_2), L) cos^2 theta_k ||nabla f_k||^2. $
    Summing the inequality yields
    $ frac(c_1 (1 - c_2), L) sum_(k = 0)^oo cos^2 theta_k ||nabla f_k||^2 <= f(x_0) - inf f < oo. $
  ]
  #cor[
    Under the hypotheses of Zoutendijk's theorem, $cos^2 theta_k ||nabla f_k||^2 -> 0$. If $cos theta_k >= delta > 0$ for every $k$, then $||nabla f_k|| -> 0$.
  ]
  = Gradient Descent for Convex Functions
  == Convex Functions and Sublinear Convergence
  #def(name: "Convex Set and Convex Function")[
    A set $D$ is convex if $forall x, y in D, forall t in [0, 1], t x + (1 - t) y in D$. A function $f: D -> RR$ is convex if $D$ is convex and
    $ f(alpha x + (1 - alpha) y) <= alpha f(x) + (1 - alpha) f(y), quad alpha in [0, 1]. $
  ]
  #re[
    On the interior of its domain, a convex function is differentiable almost everywhere and Lipschitz on compact subsets. If $f$ is differentiable, then $nabla f$ is monotone: $chevron.l nabla f(x) - nabla f(y), x - y chevron.r >= 0$, and Jensen's inequality holds.
  ]
  #prop[
    Let $f: D -> RR$ be differentiable and convex. A point $x_0 in D$ is a global minimizer if and only if $nabla f(x_0) = 0$.
  ]
  #prop(name: "Smoothness Inequalities")[
    Suppose $f$ is convex and differentiable and $nabla f$ is Lipschitz continuous with constant $M$, namely $nabla^2 f prec.eq M I$ when the Hessian exists. Then
    $ frac(1, 2 M) ||nabla f(x) - nabla f(y)||^2 <= f(y) - f(x) - nabla f(x)^T (y - x) <= frac(M, 2) ||x - y||^2, $
    and $nabla f$ is monotone and cocoercive:
    $ frac(1, M) ||nabla f(x) - nabla f(y)||^2 <= chevron.l nabla f(x) - nabla f(y), x - y chevron.r <= M ||x - y||^2. $
  ]
  #re[
    If a minimizer $x^*$ exists, the first inequality at $x = x^*$ reduces to
    $ frac(1, 2 M) ||nabla f(y)||^2 <= f(y) - f(x^*) <= frac(M, 2) ||y - x^*||^2. $
  ]
  If $nabla^2 f prec.eq M I$, Taylor expansion along the gradient step gives
  $ f(x_k - alpha nabla f_k) <= f_k - alpha ||nabla f_k||^2 + frac(1, 2) alpha^2 M ||nabla f_k||^2. $
  The right-hand side is minimized at $alpha = 1 \/ M$, and that choice leaves
  $ f_(k + 1) <= f_k - frac(1, 2 M) ||nabla f(x_k)||^2. $
  The objective therefore decreases at every nonstationary point.
  #thm[
    Apply gradient descent with constant step $alpha_k = 1 \/ M$ to a continuously differentiable convex function satisfying $nabla^2 f prec.eq M I$. If $f$ is bounded from below, then $nabla f(x_k) -> 0$. If at least one minimizer exists, then $x_k$ converges to some minimizer.
  ]
  #thm(name: "Sublinear Rate")[
    Apply gradient descent with constant step $alpha_k = 1 \/ M$ to a continuously differentiable convex function satisfying $nabla^2 f prec.eq M I$. If a minimizer $x^*$ exists, then for every integer $k >= 1$,
    $ f(x_k) - f(x^*) <= frac(2 M ||x_0 - x^*||^2, k). $
  ]
  #pf[
    Write $Delta_k = f(x_k) - f(x^*)$. The constant-step decrease and the tangent inequality $nabla f_k^T (x_k - x^*) >= Delta_k$ give
    $ ||nabla f_k|| >= frac(Delta_k, ||x_k - x^*||), $
    and therefore
    $ Delta_(k + 1) <= Delta_k - frac(Delta_k^2, 2 M ||x_k - x^*||^2). $
    The distance to $x^*$ is at most $R = ||x_0 - x^*||$, so
    $ Delta_j - Delta_(j + 1) >= frac(Delta_j^2, 2 M R^2) $
    for every $j$. If $Delta_k = 0$, the rate is immediate. Otherwise $Delta_j > 0$ for all $j <= k$, and
    $ frac(1, Delta_(j + 1)) - frac(1, Delta_j) >= frac(1, 2 M R^2). $
    Summing from $j = 0$ to $k - 1$ produces
    $ frac(1, Delta_k) >= frac(1, Delta_0) + frac(k, 2 M ||x_0 - x^*||^2), $
    and dropping the positive initial term yields the claimed rate.
  ]
  == Strong Convexity and Linear Convergence
  #def(name: "Strong Convexity")[
    A differentiable function $f$ is strongly convex with modulus $m > 0$ if $x |-> f(x) - frac(m, 2) ||x||^2$ is convex. Equivalently, when the Hessian exists, $nabla^2 f succ.eq m I$.
  ]
  #prop[
    Suppose $f$ is differentiable, strongly convex with modulus $m$, and $nabla f$ is Lipschitz continuous with constant $M$. At the minimizer $x^*$,
    $ frac(1, 2 M) ||nabla f(x)||^2 <= f(x) - f(x^*) <= frac(1, 2 m) ||nabla f(x)||^2 $
    and
    $ frac(1, M) ||nabla f(x)|| <= ||x - x^*|| <= frac(1, m) ||nabla f(x)||. $
  ]
  #thm(name: "Improved Cocoercivity")[
    Suppose $f$ is differentiable, strongly convex with modulus $m$, and $nabla f$ is Lipschitz continuous with constant $M$. Then
    $ chevron.l nabla f(x) - nabla f(y), x - y chevron.r >= frac(M m, M + m) ||x - y||^2 + frac(1, M + m) ||nabla f(x) - nabla f(y)||^2. $
  ]
  #thm(name: "Linear Rate")[
    Suppose $f$ is differentiable, strongly convex with modulus $m$, and $nabla f$ is Lipschitz continuous with constant $M$. If the constant gradient step satisfies $0 < alpha <= 2 \/ (M + m)$, then
    $ ||x_k - x^*||^2 <= c^k ||x_0 - x^*||^2, quad c = 1 - frac(2 M m alpha, M + m) in [0, 1). $
    Consequently
    $ f(x_k) - f(x^*) <= frac(M, 2) c^k ||x_0 - x^*||^2. $
  ]
  #pf[
    The iteration $x_(k + 1) = x_k - alpha nabla f(x_k)$ expands as
    $ ||x_(k + 1) - x^*||^2 = ||x_k - x^*||^2 - 2 alpha nabla f(x_k)^T (x_k - x^*) + alpha^2 ||nabla f(x_k)||^2. $
    Improved cocoercivity at the pair $(x_k, x^*)$, where $nabla f(x^*) = 0$, gives
    $ nabla f(x_k)^T (x_k - x^*) >= frac(M m, M + m) ||x_k - x^*||^2 + frac(1, M + m) ||nabla f(x_k)||^2. $
    Therefore
    $ ||x_(k + 1) - x^*||^2 <= (1 - frac(2 M m alpha, M + m)) ||x_k - x^*||^2 - (frac(2 alpha, M + m) - alpha^2) ||nabla f(x_k)||^2. $
    The second coefficient is nonnegative precisely when $0 <= alpha <= 2 \/ (M + m)$, so it may be dropped. The resulting contraction iterates to the bound on $||x_k - x^*||^2$. The estimate $f(x) - f(x^*) <= (M \/ 2) ||x - x^*||^2$ from smoothness upgrades it to a bound on the function values.
  ]
  #re[
    The factor $c$ is decreasing in $alpha$ on the admissible interval, so the smallest contraction available from this argument occurs at
    $ alpha = frac(2, M + m), quad c = (frac(M - m, M + m))^2 = (frac(kappa - 1, kappa + 1))^2, quad kappa = frac(M, m). $
  ]
]
