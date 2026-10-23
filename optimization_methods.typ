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
  $ cos theta_k = - frac(nabla f_k^T p_k, ||nabla f_k|| dot ||p_k||). $
  Descent directions have $cos theta_k > 0$.
  #thm(name: "Zoutendijk")[
    Suppose every $p_k$ is a descent direction and every step $alpha_k$ satisfies the Wolfe conditions. Assume $f$ is bounded from below and continuously differentiable on an open set $N$ containing ${x : f(x) <= f(x_0)}$, and assume $nabla f$ is Lipschitz continuous on $N$ with constant $L$. Then
    $ sum_(k = 0)^oo cos^2 theta_k||nabla f_k||^2 < oo. $
  ]
  #pf[
    The Armijo condition gives $f_(k + 1) - f_k <= c_1 alpha_k nabla f_k^T p_k$. The curvature condition rearranges to
    $ (nabla f_(k + 1) - nabla f_k)^T p_k >= (c_2 - 1) nabla f_k^T p_k. $
    Lipschitz continuity of the gradient bounds the same inner product by $L alpha_k||p_k||^2$, so
    $ alpha_k >= frac((c_2 - 1) nabla f_k^T p_k, L||p_k||^2) > 0. $
    Insert this lower bound into the decrease of $f$. Since $nabla f_k^T p_k < 0$,
    $ f_(k + 1) - f_k <= - frac(c_1 (1 - c_2), L) cos^2 theta_k||nabla f_k||^2. $
    Summing the inequality yields
    $ frac(c_1 (1 - c_2), L) sum_(k = 0)^oo cos^2 theta_k||nabla f_k||^2 <= f(x_0) - inf f < oo. $
  ]
  #cor[
    Under the hypotheses of Zoutendijk's theorem, $cos^2 theta_k||nabla f_k||^2 -> 0$. If $cos theta_k >= delta > 0$ for every $k$, then $||nabla f_k|| -> 0$.
  ]
  = Gradient Descent
  == Convex Functions
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
    $ frac(1, 2 M)||nabla f(x) - nabla f(y)||^2 <= f(y) - f(x) - nabla f(x)^T (y - x) <= frac(M, 2)||x - y||^2, $
    and $nabla f$ is monotone and cocoercive:
    $ frac(1, M)||nabla f(x) - nabla f(y)||^2 <= chevron.l nabla f(x) - nabla f(y), x - y chevron.r <= M||x - y||^2. $
  ]
  #re[
    If a minimizer $x^*$ exists, the first inequality at $x = x^*$ reduces to
    $ frac(1, 2 M)||nabla f(y)||^2 <= f(y) - f(x^*) <= frac(M, 2)||y - x^*||^2. $
  ]
  If $nabla^2 f prec.eq M I$, Taylor expansion along the gradient step gives
  $ f(x_k - alpha nabla f_k) <= f_k - alpha||nabla f_k||^2 + frac(1, 2) alpha^2 M||nabla f_k||^2. $
  The right-hand side is minimized at $alpha = 1 \/ M$, and that choice leaves
  $ f_(k + 1) <= f_k - frac(1, 2 M)||nabla f(x_k)||^2. $
  The objective therefore decreases at every nonstationary point.
  == Sublinear Rate
  #thm[
    Apply gradient descent with constant step $alpha_k = 1/M$ to a continuously differentiable convex function satisfying $nabla^2 f prec.eq M I$. If $f$ is bounded from below, then $nabla f(x_k) -> 0$. If at least one minimizer exists, then $x_k$ converges to some minimizer.
  ]
  #thm(name: "Sublinear Rate")[
    Apply gradient descent with constant step $alpha_k = 1/M$ to a continuously differentiable convex function satisfying $nabla^2 f prec.eq M I$. If a minimizer $x^*$ exists, then for every integer $k >= 1$,
    $ f(x_k) - f(x^*) <= frac(2 M||x_0 - x^*||^2, k). $
  ]
  #pf[
    Write $Delta_k = f(x_k) - f(x^*)$. The constant-step decrease and the tangent inequality $nabla f_k^T (x_k - x^*) >= Delta_k$ give
    $ ||nabla f_k|| >= frac(Delta_k, ||x_k - x^*||), $
    and therefore
    $ Delta_(k + 1) <= Delta_k - frac(Delta_k^2, 2 M||x_k - x^*||^2). $
    The distance to $x^*$ is at most $R = ||x_0 - x^*||$, so
    $ Delta_j - Delta_(j + 1) >= frac(Delta_j^2, 2 M R^2) $
    for every $j$. If $Delta_k = 0$, the rate is immediate. Otherwise $Delta_j > 0$ for all $j <= k$, and
    $ frac(1, Delta_(j + 1)) - frac(1, Delta_j) >= frac(1, 2 M R^2). $
    Summing from $j = 0$ to $k - 1$ produces
    $ frac(1, Delta_k) >= frac(1, Delta_0) + frac(k, 2 M||x_0 - x^*||^2), $
    and dropping the positive initial term yields the claimed rate.
  ]
  == Strong Convexity
  #def(name: "Strong Convexity")[
    A differentiable function $f$ is strongly convex with modulus $m > 0$ if $x |-> f(x) - frac(m, 2)||x||^2$ is convex. Equivalently, when the Hessian exists, $nabla^2 f succ.eq m I$.
  ]
  #prop[
    Suppose $f$ is differentiable, strongly convex with modulus $m$, and $nabla f$ is Lipschitz continuous with constant $M$. At the minimizer $x^*$,
    $ frac(1, 2 M)||nabla f(x)||^2 <= f(x) - f(x^*) <= frac(1, 2 m)||nabla f(x)||^2 $
    and
    $ frac(1, M)||nabla f(x)|| <= ||x - x^*|| <= frac(1, m)||nabla f(x)||. $
  ]
  #thm(name: "Improved Cocoercivity")[
    Suppose $f$ is differentiable, strongly convex with modulus $m$, and $nabla f$ is Lipschitz continuous with constant $M$. Then
    $ chevron.l nabla f(x) - nabla f(y), x - y chevron.r >= frac(M m, M + m)||x - y||^2 + frac(1, M + m)||nabla f(x) - nabla f(y)||^2. $
  ]
  == Linear Rate
  #thm(name: "Linear Rate")[
    Suppose $f$ is differentiable, strongly convex with modulus $m$, and $nabla f$ is Lipschitz continuous with constant $M$. If the constant gradient step satisfies $0 < alpha <= 2/(M + m)$, then
    $ ||x_k - x^*||^2 <= c^k||x_0 - x^*||^2, quad c = 1 - frac(2 M m alpha, M + m) in [0, 1). $
    Consequently
    $ f(x_k) - f(x^*) <= frac(M, 2) c^k||x_0 - x^*||^2. $
  ]
  #pf[
    The iteration $x_(k + 1) = x_k - alpha nabla f(x_k)$ expands as
    $ ||x_(k + 1) - x^*||^2 = ||x_k - x^*||^2 - 2 alpha nabla f(x_k)^T (x_k - x^*) + alpha^2||nabla f(x_k)||^2. $
    Improved cocoercivity at the pair $(x_k, x^*)$, where $nabla f(x^*) = 0$, gives
    $ nabla f(x_k)^T (x_k - x^*) >= frac(M m, M + m)||x_k - x^*||^2 + frac(1, M + m)||nabla f(x_k)||^2. $
    Therefore
    $ ||x_(k + 1) - x^*||^2 <= (1 - frac(2 M m alpha, M + m))||x_k - x^*||^2 - (frac(2 alpha, M + m) - alpha^2)||nabla f(x_k)||^2. $
    The second coefficient is nonnegative precisely when $0 <= alpha <= 2/(M + m)$, so it may be dropped. The resulting contraction iterates to the bound on $||x_k - x^*||^2$. The estimate $f(x) - f(x^*) <= M/2||x - x^*||^2$ from smoothness upgrades it to a bound on the function values.
  ]
  #re[
    The factor $c$ is decreasing in $alpha$ on the admissible interval, so the smallest contraction available from this argument occurs at
    $ alpha = frac(2, M + m), quad c = (frac(M - m, M + m))^2 = (frac(kappa - 1, kappa + 1))^2, quad kappa = frac(M, m). $
  ]
  = Newton's Method
  Gradient descent can be slow when the condition number $kappa$ is large. Newton's method uses the curvature of $f$ and can converge much faster near a nondegenerate minimizer.
  == Pure Newton Method
  #def(name: "Newton Direction")[
    If $nabla^2 f(x)$ is invertible, the Newton direction at $x$ is
    $ p = - (nabla^2 f(x))^(-1) nabla f(x), $
    equivalently the solution of $nabla^2 f(x) p = - nabla f(x)$.
  ]
  #re[
    - The local quadratic model
    $ hat(f)(x + v) = f(x) + nabla f(x)^T v + frac(1, 2) v^T nabla^2 f(x) v $
    is minimized at the Newton step, so $x + p$ is the minimizer of the model.
    - For a convex objective, solving $nabla f(x) = 0$ implies $nabla f(x) + nabla^2 f(x) v = 0$, whose solution is again the Newton direction.
    - The same $p$ is the steepest-descent direction for the local Hessian norm $||v||_(nabla^2 f(x)) = (v^T nabla^2 f(x) v)^(1 / 2)$.
  ]
  #def(name: "Pure Newton Iteration")[
    Write $g_k = nabla f(x_k)$ and $A_k = nabla^2 f(x_k)$. If $A_k$ is invertible, the pure Newton iteration takes the unit step $alpha_k = 1$ along the Newton direction,
    $ x_(k + 1) = x_k - A_k^(-1) g_k. $
  ]
  #re[
    The iteration is reliable near a strict minimizer, where $f$ is close to quadratic, and can overshoot or fail when $x_0$ is far from $x^*$ or when $A_k$ is not positive definite.
  ]
  #thm(name: "Local Quadratic Convergence")[
    Suppose $f$ is twice differentiable and $nabla^2 f$ is Lipschitz continuous in a neighborhood $N$ of a point $x^*$ in the sense that
    $ ||nabla^2 f(x) - nabla^2 f(y)|| <= L||x - y||, quad forall x, y in N. $
    If $nabla^2 f(x^*) succ 0$ and $x_0$ is sufficiently close to $x^*$, then the pure Newton iterates remain in $N$, converge to $x^*$, and both $x_k -> x^*$ and $nabla f(x_k) -> 0$ at a quadratic rate.
  ]
  #pf[
    The Newton update rearranges as
    $ x_(k + 1) - x^* = x_k - x^* - A_k^(-1) g_k = A_k^(-1) (A_k (x_k - x^*) - g_k). $
    Taylor expansion of the gradient and $nabla f(x^*) = 0$ give
    $ A_k (x_k - x^*) - g_k = integral_0^1 (A_k - nabla^2 f(x_k + t (x^* - x_k))) (x_k - x^*) dif t. $
    Lipschitz continuity of the Hessian bounds the integrand by $L t||x_k - x^*||^2$, so
    $ ||A_k (x_k - x^*) - g_k|| <= frac(L, 2)||x_k - x^*||^2. $
    Since $nabla^2 f(x^*) succ 0$, continuity keeps $A_k$ invertible with uniformly bounded inverse for $x_k$ near $x^*$. Hence $e_(k + 1) <= C e_k^2$ with $e_k = ||x_k - x^*||$. Choosing $x_0$ close enough that the neighborhood is invariant and $C e_0 < 1$ yields quadratic convergence of $x_k$ to $x^*$.
    For the gradient, $g_k + A_k p_k = 0$ with $p_k = x_(k + 1) - x_k$ implies
    $ g_(k + 1) = integral_0^1 (nabla^2 f(x_k + t p_k) - A_k) p_k dif t, $
    so $||g_(k + 1)|| <= L / 2 ||p_k||^2 <= L / 2 ||A_k^(-1)||^2 dot ||g_k||^2$. Once $x_k -> x^*$, the inverse Hessians stay bounded and the same quadratic relation holds for $||g_k||$.
  ]
  #eg[
    A strict minimizer alone does not give quadratic convergence. For $f(x) = x^4$ one has $x^* = 0$ and $f''(0) = 0$. If $x_k != 0$, then
    $ x_(k + 1) = x_k - frac(4 x_k^3, 12 x_k^2) = frac(2, 3) x_k, $
    so the iteration converges only linearly. The same loss of quadratic rate occurs at a root of higher multiplicity.
  ]
  == Damped Newton Method
  Even under strong convexity, the unit step is typically acceptable for the Wolfe conditions only when $x_k$ is already close to $x^*$. The damped Newton method keeps the Newton direction and chooses a step $alpha_k in (0, 1]$ by line search, most often Armijo backtracking, trying $alpha = 1$ first.
  #def(name: "Newton Decrement")[
    If $nabla^2 f(x) succ 0$, the Newton decrement at $x$ is
    $ lambda(x)^2 = nabla f(x)^T (nabla^2 f(x))^(-1) nabla f(x). $
    With $p$ the Newton direction, $g = nabla f(x)$, and $A = nabla^2 f(x)$, there is
    $ lambda(x)^2 = p^T A p = - g^T p, quad hat(f)(x) - hat(f)(x + p) = frac(lambda(x)^2, 2). $
    Thus $lambda(x)^2 / 2$ is the decrease predicted by the quadratic model.
  ]
  #def(name: "Damped Newton Iteration")[
    Write $g_k = nabla f(x_k)$ and $A_k = nabla^2 f(x_k)$. Given $x_0 in op("dom") f$ and a tolerance $epsilon > 0$, compute $p_k = - A_k^(-1) g_k$ and $lambda_k^2 = g_k^T A_k^(-1) g_k$. Stop if $lambda_k^2 / 2 <= epsilon$; otherwise choose $alpha_k$ by Armijo backtracking and set
    $ x_(k + 1) = x_k + alpha_k p_k. $
  ]
  #thm(name: "Two-Phase Convergence")[
    Suppose $f$ is strongly convex with modulus $m$, $m I prec.eq nabla^2 f prec.eq M I$, and $nabla^2 f$ is Lipschitz continuous with constant $L > 0$. For damped Newton with Armijo backtracking there exist $eta in (0, m^2 / L)$ and $gamma > 0$ such that
    - if $||g_k|| >= eta$, then $f(x_(k + 1)) - f(x_k) <= - gamma$;
    - if $||g_k|| < eta$, then $alpha_k = 1$ and
    $ ||g_(k + 1)|| <= frac(L, 2 m^2)||g_k||^2. $
  ]
  #pf[
    Let $c_1 in (0, 1 / 2)$ be the Armijo constant and let $beta in (0, 1)$ be the backtracking factor. Write $d = - g^T p = p^T A p$. The Hessian bounds give $d >= m||p||^2$, $d >= (||g||^2) / M$, and $||p|| <= (||g||) / m$. Smoothness yields
    $ f(x_k + alpha p) <= f(x_k) - alpha d + frac(M, 2) alpha^2||p||^2, $
    so Armijo holds for every $alpha <= 2 (1 - c_1) m / M$. Backtracking therefore returns $alpha_k >= underline(alpha)$ with $underline(alpha) = min{1, 2 beta (1 - c_1) m / M}$, and
    $ f(x_k) - f(x_(k + 1)) >= c_1 alpha_k d >= frac(c_1 underline(alpha), M)||g_k||^2. $
    The first claim follows with $gamma = ( c_1 underline(alpha) eta^2) / M$.
    Lipschitz continuity of the Hessian also gives $f(x_k + p) <= f(x_k) - d/2 + L/6||p||^3$. The cubic remainder is at most $(1 / 2 - c_1) d$ as soon as $||p|| <= 3 (1 - 2 c_1) m / L$. Choose $eta in (0, m^2 / L)$ small enough that this bound holds whenever $||g_k|| < eta$; then backtracking accepts $alpha_k = 1$. The integral representation
    $ g_(k + 1) = integral_0^1 (nabla^2 f(x_k + t p_k) - A_k) p_k dif t $
    yields $||g_(k + 1)|| <= L/2||p_k||^2 <= L/(2 m^2)||g_k||^2$. The restriction $eta < m^2 / L$ keeps this region invariant under subsequent full steps.
  ]
  #re[
    The iteration therefore has two phases. While $||g_k|| >= eta$, each accepted step decreases $f$ by at least $gamma$, so the damped phase lasts at most $(f(x_0) - inf f) / gamma$ iterations. Once $||g_k|| < eta$, every later step is the unit Newton step, both Wolfe conditions hold, and $||g_k||$ converges to zero quadratically.
  ]
  == Hessian Modification
  When $A_k$ is not positive definite, $p_k$ may fail to be a descent direction. A symmetric correction $E_k$ is chosen so that
  $ B_k = A_k + E_k succ 0, quad B_k p_k = - g_k, quad x_(k + 1) = x_k + alpha_k p_k. $
  Then $g_k^T p_k = - p_k^T B_k p_k < 0$ whenever $g_k != 0$, so $p_k$ is a descent direction and the unique minimizer of the modified quadratic model $q_k (p) = f(x_k) + g_k^T p + 1 / 2 p^T B_k p$. A useful correction is small, retains as much curvature as possible, and vanishes once $A_k$ is sufficiently positive definite.
  #def(name: "Modified Newton Iteration")[
    Given $x_0$ and a tolerance $epsilon > 0$, the modified Newton iteration repeats: stop if $||g_k|| <= epsilon$; form and factor $B_k = A_k + E_k succ 0$, taking $E_k = 0$ when $A_k$ already satisfies the chosen safeguards; solve $B_k p_k = - g_k$; try $alpha_k = 1$ first and otherwise take a Wolfe step; set
    $ x_(k + 1) = x_k + alpha_k p_k. $
  ]
  #def(name: "Bounded Modified Factorization")[
    The condition number of a modified Hessian is $kappa_2 (B_k) = (lambda_max (B_k)) / (lambda_min (B_k))$. A modification rule has the bounded modified factorization property if bounded input Hessians produce matrices $B_k$ with $kappa_2 (B_k)$ uniformly bounded.
  ]
  #thm[
    Let $f in C^2 (RR^n)$ and suppose the level set ${x : f(x) <= f(x_0)}$ is compact. Assume the modified Newton iteration uses Wolfe steps with fixed constants $0 < c_1 < c_2 < 1$ and that $B_k succ 0$ with $kappa_2 (B_k) <= K$ independently of $k$. Then the algorithm either stops at a stationary point or satisfies $||g_k|| -> 0$. In particular every accumulation point of an infinite sequence is stationary.
  ]
  #pf[
    Compactness of the level set and $f in C^2$ supply the Lipschitz hypothesis of Zoutendijk's theorem. The angle bound $cos theta_k >= 1 / K$ and the corresponding corollary yield $||g_k|| -> 0$.
  ]
  #re[
    If $x_k -> x^*$ with $nabla f(x^*) = 0$, $nabla^2 f(x^*) succ 0$, and $E_k = 0$ for all large $k$, the direction becomes the Newton direction. With $c_1 < 1 / 2$ and a line search that tries the unit step first, both Wolfe inequalities hold for small $p_k$, so $alpha_k = 1$ is eventually accepted and local quadratic convergence applies.
  ]
  Drop the iteration index and write $A = nabla^2 f(x)$. Four standard constructions of $B = A + E$ follow.
  - _Eigenvalue modification._ Write $A = Q Lambda Q^T$ and raise every eigenvalue below a floor $delta > 0$,
    $ B = Q op("diag")(max{lambda_i, delta}) Q^T. $
    Then $B succ.eq delta I$, and $B$ is the unique nearest matrix to $A$ in the Frobenius norm among symmetric matrices bounded below by $delta I$. If $||A|| <= M_A$, then $kappa_2 (B) <= max{M_A, delta} / delta$. A full eigendecomposition is costly and can destroy sparsity.
  - _Multiple of the identity._ Take $B = A + tau I$ with $tau = max{0, delta - lambda_min (A)}$. For large $tau$ the direction approaches a scaled gradient step. In practice one need not compute $lambda_min (A)$: a Cholesky retry starts from $tau = 0$ and doubles $tau$ until $A + tau I$ factors.
  - _Modified Cholesky._ In an $L D L^T$ factorization, after forming the residual column set $theta_j = max_(i > j) |c_(i j)|$ and
    $ d_j = max{|c_(j j)|, (theta_j / beta)^2, delta}. $
    This keeps $d_j >= delta$ and $|ell_(i j) sqrt(d_j)| <= beta$, and produces $B = L D L^T = A + E$ with $E$ diagonal and nonnegative. The correction must be applied during the factorization; for fixed dimension and positive parameters, bounded $A$ yields bounded $kappa_2 (B)$.
  - _Symmetric indefinite factorization._ Symmetric pivoting produces $P A P^T = L D L^T$, where $D$ is block diagonal with blocks of size $1$ or $2$. Diagonalize each block and raise its eigenvalues to at least $delta$, giving $hat(D) succ.eq delta I$ and
    $ B = P^T L hat(D) L^T P = A + E succ 0. $
    Only tiny eigenproblems are solved, but $E$ need not be diagonal, and $hat(D) succ.eq delta I$ does not imply $B succ.eq delta I$: one has $kappa_2 (B) <= kappa_2 (L)^2 kappa_2 (hat(D))$.
  == Quasi-Newton Methods
  #def(name: "Quasi-Newton Iteration")[
    Quasi-Newton methods replace $A_k$ by a symmetric positive definite approximation $B_k$ and solve
    $ B_k p_k = - g_k, quad x_(k + 1) = x_k + alpha_k p_k. $
    Then $p_k$ is a descent direction and minimizes $m_k (p) = f(x_k) + g_k^T p + 1 / 2 p^T B_k p$.
  ]
  #thm(name: "Accurate Directions and Unit Steps")[
    Let $f$ be twice continuously differentiable near $x^*$. Fix Wolfe parameters $0 < c_1 < 1 / 2$ and $c_1 < c_2 < 1$. Suppose a descent iteration $x_(k + 1) = x_k + alpha_k p_k$ satisfies the Wolfe conditions and converges to $x^*$, where $nabla f(x^*) = 0$ and $A_* := nabla^2 f(x^*) succ 0$. If $(||r_k||) / (||p_k||) -> 0$, then the unit step $alpha_k = 1$ is admissible for all large $k$. If the line search tries $alpha = 1$ first and accepts it whenever it is admissible, then eventually $alpha_k = 1$ and the convergence is superlinear, namely
    $ frac(||x_(k + 1) - x^*||, ||x_k - x^*||) -> 0. $
  ]
  #pf[
    Continuity and $A_* succ 0$ give $m I prec.eq A_k prec.eq M I$ for large $k$. Write $||r_k|| <= epsilon_k ||p_k||$ with $epsilon_k -> 0$. From $A_k p_k = - g_k + r_k$ one obtains $(m - epsilon_k) ||p_k|| <= ||g_k||$. Local boundedness of the Hessian and $nabla f(x^*) = 0$ give $||g_k|| = O(||x_k - x^*||)$, so $||p_k|| = O(||x_k - x^*||)$ and $p_k -> 0$. Taylor expansion is therefore valid along the segments from $x_k$ to $x_k + p_k$.
    Set $q_k = p_k^T A_k p_k >= m ||p_k||^2$. The residual identity yields $g_k^T p_k = - q_k + o(||p_k||^2)$, and
    $ f(x_k + p_k) - f(x_k) - c_1 g_k^T p_k = - (1/2 - c_1) q_k + o(||p_k||^2) < 0 $
    for large $k$. This is the Armijo condition; the hypothesis $c_1 < 1/2$ supplies the margin that absorbs the remainder. Another expansion gives $nabla f(x_k + p_k) = g_k + A_k p_k + o(||p_k||) = o(||p_k||)$, while $- g_k^T p_k >= m/2||p_k||^2$, so
    $ frac(|nabla f(x_k + p_k)^T p_k|, - g_k^T p_k) -> 0. $
    The strong Wolfe curvature inequality follows, and with it the ordinary curvature inequality. The stated line search therefore eventually takes the unit step.
    Local boundedness of $A_k^(-1)$ gives $p_k - p_k^N = A_k^(-1) r_k = o(||p_k||) = o(||x_k - x^*||)$. Writing $h_k = x_k - x^*$ and using the fundamental theorem of calculus,
    $ x_k + p_k^N - x^* = A_k^(-1) integral_0^1 (A_k - nabla^2 f(x^* + t h_k)) h_k dif t = o(||h_k||). $
    Once $alpha_k = 1$,
    $ x_(k + 1) - x^* = (x_k + p_k^N - x^*) + (p_k - p_k^N) = o(||x_k - x^*||). $
  ]
  #def(name: "Dennis-Moré Condition")[
    A sequence of matrices ${B_k}$ satisfies the Dennis-Moré condition along ${p_k}$ if
    $ frac(||(B_k - A_*) p_k||, ||p_k||) -> 0. $
    For a quasi-Newton direction one has $r_k = (A_k - B_k) p_k$, so once $A_k -> A_*$ the residual condition is equivalent to this estimate.
  ]
  #thm(name: "Dennis-Moré")[
    Suppose $f$ is twice continuously differentiable near a stationary point $x^*$ with $A_* succ 0$. Let $x_(k + 1) = x_k + p_k$ with $B_k p_k = - g_k$, where $B_k$ is symmetric positive definite, and assume $x_k -> x^*$. The convergence is superlinear if and only if the Dennis-Moré condition holds.
  ]
  #pf[
    Sufficiency follows from the residual condition and the comparison with the Newton step in the previous proof, applied to this full-step sequence.
    Conversely, suppose the convergence is superlinear and write $h_k = x_k - x^*$. Then $p_k = h_(k + 1) - h_k$, so $h_(k + 1) = o(||h_k||)$, $p_k = - h_k + o(||h_k||)$, and $(||p_k||)/(||h_k||) -> 1$. Differentiability of the gradient gives $g_k = A_* h_k + o(||h_k||)$, and therefore
    $ (B_k - A_*) p_k = - g_k - A_* p_k = - A_* h_(k + 1) + o(||h_k||) = o(||p_k||). $
  ]
  #eg[
    Directional accuracy need not imply matrix convergence. For
    $ f(x) = frac(1, 2) (x_1^2 + x_2^2) + frac(1, 4) x_1^4, quad x^* = (0, 0), quad A_* = I, $
    take $B_k = op("diag")(1, 2)$ at every iteration. Starting from $x_0 = (a, 0)$ with $0 < |a| < 1$, full steps produce $x_k = (a_k, 0)$ with $p_k = (- a_k - a_k^3, 0)$ and $a_(k + 1) = - a_k^3$. Thus $a_k -> 0$ cubically and $(B_k - A_*) p_k = 0$, even though $||B_k - A_*|| = 1$ for every $k$. The matrix is exact in the direction used by the iteration.
  ]
]
