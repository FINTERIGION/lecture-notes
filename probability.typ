#import "template.typ": *

#note(
  title: "Probability"
)[
  = Introduction
  #def(name: "Probability")[
    A probability $P$ on a sample space $Omega$ satisfies
    - $P(A) >= 0$;
    - $P(Omega) = 1$;
    - if $A inter B = emptyset$, then $P(A union B) = P(A) + P(B)$.
  ]
  #eg[
    _Buffon's needle._ A needle of length $l$ is dropped on a floor ruled with parallel lines a distance $a$ apart, where $a > l$. Let $theta in [0, pi]$ be the angle between the needle and the direction of the lines, and let $y in [0, a\/2]$ be the distance from the center of the needle to the nearest line. The sample space and the event that the needle crosses a line are
    $ Omega = {(theta, y) : 0 <= theta <= pi, 0 <= y <= a\/2}, $
    $ A = {(theta, y) : 0 <= theta <= pi, 0 <= y <= (l\/2) sin theta}. $
    Comparing areas,
    $ P(A) = (integral_0^pi (l\/2) sin theta dif theta) / (pi a \/ 2) = (2 l) / (pi a). $
  ]
  #def(name: "Conditional Probability")[
    If $P(B) > 0$, then $P(A|B) = P(A inter B) / P(B)$.
  ]
  #def(name: "Independence")[
    Events $A$ and $B$ are independent if $P(A inter B) = P(A) P(B)$.
  ]
  #re[
    Mutual independence of $k$ events does not imply mutual independence of $k+1$ events.
  ]
  #thm(name: "Total Probability")[
    If the events $B_k$ are pairwise disjoint and $A subset union.big_k B_k$, then
    $ P(A) = sum_k P(B_k) P(A|B_k). $
  ]
  #thm(name: "Bayes")[
    Under the same hypotheses, and if $P(A) > 0$,
    $ P(B_k|A) = (P(B_k) P(A|B_k)) / (sum_j P(B_j) P(A|B_j)). $
  ]
  #thm(name: "Borel-Cantelli")[
    Let $A_n$ be events and write $A_n "i.o."$ for the event that infinitely many of them occur, so that $P(A_n "i.o.") = P(limsup A_n)$.
    - If $sum_(n=1)^oo P(A_n) < oo$, then $P(A_n "i.o.") = 0$.
    - If $sum_(n=1)^oo P(A_n) = oo$ and the events $A_n$ are mutually independent, then $P(A_n "i.o.") = 1$.
  ]
  = Random Variables
  == Distribution Functions
  #def(name: "Distribution Function")[
    The distribution function of a random variable $X$ is $F(x) = P(X <= x)$. It is nondecreasing and right-continuous, its left limits exist, and $F(-oo) = 0$, $F(+oo) = 1$.
  ]
  #def(name: "Density")[
    If $F(x) = integral_(-oo)^x f(u) dif u$ with $f$ a nonnegative finite function, then $f$ is a density of $X$ and $X$ is a continuous random variable. In that case
    - $integral_(-oo)^(+oo) f(u) dif u = 1$;
    - if $f$ is continuous at $x_0$, then $F'(x_0) = f(x_0)$;
    - if $B in cal(B)(RR)$, then $P(X in B) = integral_B f(x) dif x$.
  ]
  #prop[
    If $Y = g(X)$, then $P(Y = y) = P(X in g^(-1)({y}))$ and $F_Y (y) = P(g(X) <= y)$. If $g$ is strictly monotone and continuously invertible, then
    $ f_Y (y) = f_X (g^(-1)(y)) abs((g^(-1))'(y)). $
  ]
  == Expectation and Variance
  #def(name: "Expectation")[
    If $X$ is discrete with values $x_k$, then $E(X) = sum_k x_k P(X = x_k)$. If $X$ is continuous with density $f$, then $E(X) = integral_(-oo)^(+oo) x f(x) dif x$. For a general random variable, $E(g(X)) = integral_(-oo)^(+oo) g(x) dif F_X (x)$.
  ]
  #re[
    - If $X$ is nonnegative and integer-valued, then $E(X) = sum_(k=0)^oo P(X > k)$.
    - If $X$ is nonnegative, then $E(X) = integral_0^oo P(X > t) dif t$.
    - The expectation need not exist.
  ]
  #def(name: "Variance")[
    $ "Var"(X) = E(X - E(X))^2 = E(X^2) - (E(X))^2. $
    The handwritten notes denote this by $D(X)$.
  ]
  #prop[
    - For every constant $x_0$, $"Var"(X) <= E(X - x_0)^2$.
    - $"Var"(X) = 0$ if and only if $X$ is almost surely constant.
  ]
  #thm(name: "Chebyshev")[
    If $"Var"(X) < oo$, then for every $epsilon > 0$,
    $ P(abs(X - E(X)) >= epsilon) <= "Var"(X) / epsilon^2. $
  ]
  == Common Distributions
  #def(name: "Bernoulli and Binomial")[
    A Bernoulli random variable with success probability $p$ satisfies $P(X = k) = p^k (1-p)^(1-k)$ for $k = 0, 1$. Its mean is $p$ and its variance is $p(1-p)$.\
    A binomial random variable, the number of successes in $n$ independent trials, satisfies
    $ P(X = k) = binom(n, k) p^k (1-p)^(n-k). $
    Its mean is $n p$ and its variance is $n p (1-p)$.
  ]
  #def(name: "Hypergeometric")[
    From $N$ balls of which $K$ are white, draw $n$ balls without replacement, and let $X$ be the number of white balls drawn. Then
    $ P(X = k) = (binom(K, k) binom(N-K, n-k)) / binom(N, n), $
    $ E(X) = n K\/N, quad "Var"(X) = n (K\/N) (1 - K\/N) (N-n)/(N-1). $
  ]
  #def(name: "Geometric and Negative Binomial")[
    The number of trials until the first success, with success probability $p$, satisfies $P(X = k) = (1-p)^(k-1) p$ for $k = 1, 2, ...$. Its mean is $1\/p$ and its variance is $(1-p)\/p^2$.\
    The number of trials until the $r$-th success satisfies
    $ P(X = k) = binom(k-1, r-1) (1-p)^(k-r) p^r, quad k = r, r+1, ... . $
    Its mean is $r\/p$ and its variance is $r(1-p)\/p^2$.
  ]
  #def(name: "Poisson")[
    $ P(X = k) = e^(-lambda) lambda^k / k! $ for $k = 0, 1, 2, ...$. The mean and the variance are both $lambda$. This is the law of the number of events in a fixed interval.
  ]
  #def(name: "Discrete Power Law")[
    $ P(X = k) = c \/ k^(alpha+1), $
    where $c$ normalizes the probabilities. The mean and the variance need not be finite, since the mass is highly uneven.
  ]
  #def(name: "Uniform, Pareto, and Cauchy")[
    The uniform law on $(a, b)$ has density $1\/(b-a)$, mean $(a+b)\/2$, and variance $(b-a)^2\/12$.\
    The Pareto density $alpha \/ x^(alpha+1)$ on $x >= 1$, with $alpha > 0$, has mean $alpha\/(alpha-1)$ for $alpha > 1$ and variance $alpha \/ ((alpha-1)^2 (alpha-2))$ for $alpha > 2$.\
    The Cauchy density $1\/(pi (1+x^2))$ has neither a mean nor a variance.
  ]
  #def(name: "Exponential and Gamma")[
    The exponential density $lambda e^(-lambda x)$ for $x >= 0$ and $lambda > 0$ has mean $1\/lambda$ and variance $1\/lambda^2$.\
    The gamma density, with shape $alpha > 0$ and rate $lambda > 0$, is
    $ f(x) = (lambda^alpha \/ Gamma(alpha)) e^(-lambda x) x^(alpha-1), quad x >= 0. $
    Its mean is $alpha\/lambda$ and its variance is $alpha\/lambda^2$. Here $Gamma(alpha) = integral_0^oo t^(alpha-1) e^(-t) dif t$, so $Gamma(n+1) = n Gamma(n)$ and $Gamma(n) = (n-1)!$ for positive integers $n$.
  ]
  #def(name: "Normal and Lognormal")[
    The normal density with mean $mu$ and variance $sigma^2 > 0$ is
    $ f(x) = 1/(sigma sqrt(2 pi)) exp(-((x-mu)^2) / (2 sigma^2)). $
    The standard density is $phi(x) = 1\/sqrt(2 pi) e^(-x^2\/2)$, with mean $0$ and variance $1$. If $X ~ N(mu, sigma^2)$, then $(X-mu)\/sigma ~ N(0, 1)$. The distribution function $Phi$ of $N(0, 1)$ satisfies $Phi(-x) = 1 - Phi(x)$.\
    If $log Y ~ N(mu, sigma^2)$ with $Y > 0$, then
    $ f_Y (y) = 1/(y sigma sqrt(2 pi)) exp(-((log y - mu)^2) / (2 sigma^2)). $
    The mean is $e^(mu + sigma^2\/2)$ and the variance is $(e^(sigma^2) - 1) e^(2 mu + sigma^2)$.
  ]
  = Random Vectors
  == Joint Distributions
  #def(name: "Joint Distribution")[
    $ F(x_1, ..., x_n) = P(X_1 <= x_1, ..., X_n <= x_n). $
    The joint distribution function is $0$ when any coordinate tends to $-oo$, and it is $1$ when every coordinate tends to $+oo$. Every marginal distribution is obtained by sending the remaining coordinates to $+oo$.
  ]
  #prop[
    $X_1, ..., X_n$ are independent if and only if $F(x_1, ..., x_n) = F_(X_1)(x_1) ... F_(X_n)(x_n)$. The same factorization holds for densities.
  ]
  #def(name: "Joint Density")[
    When the mixed partial exists,
    $ f(x_1, ..., x_n) = (partial^n F) / (partial x_1 ... partial x_n), $
    and the marginal density of $(X_1, ..., X_k)$ is obtained by integrating out $x_(k+1), ..., x_n$.
  ]
  #def(name: "Conditional Distribution")[
    $ F(y|x) = (integral_(-oo)^y f(x, t) dif t) / f(x), quad f(y|x) = f(x, y) / f(x). $
  ]
  #re[
    The binomial family with a fixed success probability, the Poisson family, and the normal family are closed under addition of independent random variables.
  ]
  #prop[
    If $y = y(x)$ is a smooth invertible change of variables with Jacobian $J = (partial (x_1, ..., x_n)) / (partial (y_1, ..., y_n))$, then
    $ f_Y (y_1, ..., y_n) = f_X (x_1, ..., x_n) abs(J). $
  ]
  #def(name: "Order Statistics")[
    The order statistics $X_((1)) <= ... <= X_((n))$ are the sample arranged in increasing order.
  ]
  #prop[
    If $X_1, ..., X_n$ are i.i.d. with distribution function $F$ and density $f$, then
    $ F_(X_((n)))(x) = F(x)^n, quad F_(X_((1)))(x) = 1 - (1 - F(x))^n, $
    and the density of the $k$-th order statistic is
    $ f_(X_((k)))(x) = (n!)/((k-1)! (n-k)!) F(x)^(k-1) (1-F(x))^(n-k) f(x). $
    On the region $x_1 < x_2 < ... < x_n$, the joint density of the order statistics is $n! f(x_1) ... f(x_n)$.
  ]
  == Covariance and Conditional Expectation
  #prop[
    Expectation is linear: $E(sum_k c_k X_k) = sum_k c_k E(X_k)$. If the summands are uncorrelated, then $"Var"(sum_k c_k X_k) = sum_k c_k^2 "Var"(X_k)$.
  ]
  #def(name: "Covariance and Correlation")[
    $ "Cov"(X, Y) = E((X - E X)(Y - E Y)) = E(X Y) - E(X) E(Y). $
    The sign of the covariance is the sign of the correlation: positive, zero, or negative, in which case one says positively correlated, uncorrelated, or negatively correlated. The correlation is the normalized covariance,
    $ rho(X, Y) = "Cov"(X, Y) / sqrt("Var"(X) "Var"(Y)). $
  ]
  #prop[
    - Independence implies that the covariance is zero. The converse is false.
    - If $a b > 0$, then $rho(a X, b Y) = rho(X, Y)$.
    - $"Var"(sum_k c_k X_k) = sum_i sum_j c_i c_j "Cov"(X_i, X_j)$.
    - $abs(rho(X, Y)) <= 1$. Equality to $1$ holds if and only if $Y = (sigma_Y \/ sigma_X) (X - E X) + E Y$, and equality to $-1$ holds if and only if the same identity holds with the opposite sign in front of the slope.
  ]
  #def(name: "Covariance Matrix")[
    The matrix $Sigma$ with entries $Sigma_(i j) = "Cov"(X_i, X_j)$ is symmetric and positive semidefinite.
  ]
  #def(name: "Conditional Expectation and Variance")[
    $ "Var"(Y|X = x) = E(Y^2|X = x) - (E(Y|X = x))^2. $
  ]
  #prop[
    - $E(Y) = E(E(Y|X))$.
    - $E(g(X) Y | X) = g(X) E(Y|X)$.
    - $E(Y - E(Y|X))^2 <= E(Y - g(X))^2$ for every function $g$.
  ]
  #thm(name: "Law of Total Variance")[
    $ "Var"(Y) = E("Var"(Y|X)) + "Var"(E(Y|X)). $
  ]
  #pf[
    $ "Var"(Y) = E(Y^2) - (E Y)^2 = E(E(Y^2|X)) - (E(E(Y|X)))^2. $
    Substitute $E(Y^2|X) = "Var"(Y|X) + (E(Y|X))^2$. The cross term that remains is $"Var"(E(Y|X))$.
  ]
  == Multivariate Distributions
  #def(name: "Multinomial")[
    In $n$ independent trials with $r$ outcomes of probabilities $p_1, ..., p_r$, let $X_j$ be the number of times outcome $j$ occurs. If $k_1 + ... + k_r = n$, then
    $ P(X_1 = k_1, ..., X_r = k_r) = (n!)/(k_1! ... k_r!) p_1^(k_1) ... p_r^(k_r). $
    The same probability is the product of successive binomial coefficients $binom(n, k_1) binom(n-k_1, k_2) ...$.
  ]
  #eg[
    For $n$ independent shots at a target whose rings are labeled $0, ..., 10$, the vector of ring counts is multinomial.
  ]
  #def(name: "Multivariate Hypergeometric")[
    A population of $N$ balls contains $N_j$ balls of color $j$, with $sum_j N_j = N$. Draw $n$ balls without replacement, and let $n_j$ be the number drawn of color $j$. Then
    $ P(n_1, ..., n_r) = (product_j binom(N_j, n_j)) / binom(N, n). $
  ]
  #def(name: "Uniform Distribution on a Region")[
    On a region $D$ of content $S(D)$, the uniform density is $1\/S(D)$.
  ]
  #def(name: "Bivariate Normal")[
    The law $N(mu_1, mu_2, sigma_1^2, sigma_2^2, rho)$ has density
    $ f(x_1, x_2) = 1/(2 pi sigma_1 sigma_2 sqrt(1-rho^2)) exp(-Q / (2(1-rho^2))), $
    where
    $ Q = (x_1 - mu_1)^2 / sigma_1^2 + (x_2 - mu_2)^2 / sigma_2^2 - 2 rho (x_1 - mu_1)(x_2 - mu_2) / (sigma_1 sigma_2). $
  ]
  = Generating Functions
  == Probability Generating Functions
  #def(name: "Probability Generating Function")[
    If $X$ is nonnegative and integer-valued, then $G_X (s) = E(s^X) = sum_k s^k P(X = k)$.
  ]
  #prop[
    $G_X (1) = 1$ and $G_X'(1) = E(X)$. The generating function determines the distribution, through $P(X = k) = G_X^((k))(0) / k!$.\
    If $X_1, ..., X_n$ are independent, then $G_(X_1 + ... + X_n)(s) = product_(k=1)^n G_(X_k)(s)$. If in addition the $X_i$ are i.i.d. and independent of a nonnegative integer-valued random index $N$, then the sum of the first $N$ of them has generating function $G_N (G_X (s))$.
  ]
  == Characteristic Functions
  #def(name: "Characteristic Function")[
    $ psi_X (t) = E(e^(i t X)) = E(cos t X) + i E(sin t X). $
  ]
  #prop[
    - $abs(psi_X (t)) <= psi_X (0) = 1$, and $psi_X (t) = overline(psi_X (-t))$.
    - $psi_X^((k))(0) / i^k = E(X^k)$ when the moment exists.
    - If $X_1, ..., X_n$ are independent, then $psi_(X_1 + ... + X_n)(t) = product_(k=1)^n psi_(X_k)(t)$.
    - The characteristic function determines the distribution. If it is integrable and $X$ has a density, then
    $ f(x) = 1/(2 pi) integral_(-oo)^(+oo) e^(-i t x) psi_X (t) dif t. $
  ]
  #re[
    Common characteristic functions:
    - two-point law, with $q = 1-p$: $p e^(i t) + q$;
    - binomial: $(p e^(i t) + q)^n$;
    - Poisson: $e^(lambda (e^(i t) - 1))$;
    - geometric, as the number of trials until the first success: $p e^(i t) / (1 - q e^(i t))$;
    - uniform on $[a, b]$: $(e^(i t b) - e^(i t a)) / (i t (b-a))$;
    - exponential of rate $lambda$: $lambda / (lambda - i t)$;
    - standard Cauchy: $e^(-abs(t))$;
    - $N(mu, sigma^2)$: $e^(i mu t - sigma^2 t^2 \/ 2)$, and in particular $e^(-t^2\/2)$ for $N(0, 1)$.
  ]
  = Limit Theorems
  == Laws of Large Numbers
  #def(name: "Convergence in Probability")[
    One writes $X_n ->^P X$ if for every $epsilon > 0$,
    $ lim_(n->oo) P(abs(X_n - X) < epsilon) = 1, $
    or equivalently $P(abs(X_n - X) >= epsilon) -> 0$.
  ]
  #def(name: "Weak and Strong Laws")[
    The sequence ${X_n}$ obeys the weak law of large numbers if $(1\/n) sum_(k=1)^n X_k ->^P alpha$ for some constant $alpha$. It obeys the strong law if the same average converges almost surely.
  ]
  #thm[
    If $"Cov"(X_i, X_j) <= 0$ for $i != j$ and $(1\/n^2) sum_(k=1)^n "Var"(X_k) -> 0$, then the centered averages of ${X_n}$ converge to $0$ in probability.
  ]
  #thm(name: "Kolmogorov")[
    Let $X_k$ be independent with finite variances, and let $S_k = sum_(j=1)^k (X_j - E X_j)$. Then for every $epsilon > 0$,
    $ P(max_(1<=k<=n) abs(S_k) >= epsilon) <= (1\/epsilon^2) sum_(k=1)^n "Var"(X_k). $
    If in addition $sum_(k=1)^oo "Var"(X_k)\/k^2 < oo$, then $(1\/n) sum_(k=1)^n (X_k - E X_k) -> 0$ almost surely.
  ]
  #prop[
    Let $X_i$ be i.i.d. If $f$ is continuous, then $f((1\/n) sum_(k=1)^n X_k) -> f(E(X_1))$ almost surely whenever the strong law applies to ${X_k}$. If $E abs(h(X_1)) < oo$, then $(1\/n) sum_(k=1)^n h(X_k) -> E(h(X_1))$ almost surely.
  ]
  #re[
    An i.i.d. sequence with finite expectation obeys both the weak and the strong law of large numbers.
  ]
  == The Central Limit Theorem
  #re[
    Let $X_i$ be i.i.d. with mean $mu$ and variance $sigma^2 < oo$, and set $Y_n = (sum_(k=1)^n (X_k - mu)) / n^alpha$. Then $E(Y_n) -> 0$ and
    $ lim_(n->oo) "Var"(Y_n) = cases(0 & "if" alpha > 1\/2, sigma^2 & "if" alpha = 1\/2, oo & "if" alpha < 1\/2). $
    The critical scaling is therefore $n^(1\/2)$.
  ]
  #thm(name: "Central Limit Theorem")[
    If $X_i$ are i.i.d. with mean $mu$ and variance $sigma^2 in (0, oo)$, then
    $ lim_(n->oo) P( (sum_(k=1)^n (X_k - mu)) / (sigma sqrt(n)) <= x ) = Phi(x). $
    The standardized partial sums converge in distribution to $N(0, 1)$.
  ]
  #thm(name: "Delta Method")[
    Let $X_i$ be i.i.d. with mean $mu$ and variance $sigma^2$, and let $g$ be continuously differentiable with $g'(mu) != 0$. Then $g(overline(X)_n)$ is approximately normal with mean $g(mu)$ and variance $sigma^2 (g'(mu))^2 \/ n$.
  ]
  #thm(name: "Lindeberg--Feller")[
    Let $X_k$ be independent, with mean $mu_k$ and variance $sigma_k^2$, and set $B_n^2 = sum_(k=1)^n sigma_k^2$. Then $max_(k<=n) sigma_k^2 \/ B_n^2 -> 0$ and
    $ (sum_(k=1)^n (X_k - mu_k)) / B_n ->^d N(0, 1) $
    if and only if the Lindeberg condition holds: for every $epsilon > 0$,
    $ lim_(n->oo) (1\/B_n^2) sum_(k=1)^n E( (X_k - mu_k)^2 I_({abs(X_k - mu_k) >= epsilon B_n}) ) = 0. $
  ]
  #thm(name: "Lyapunov")[
    Let $X_k$ be independent with means $mu_k$ and with $B_n^2 = sum_(k=1)^n "Var"(X_k)$. If for some $delta > 0$,
    $ (sum_(k=1)^n E abs(X_k - mu_k)^(2+delta)) / B_n^(2+delta) -> 0, $
    then $(sum_(k=1)^n (X_k - mu_k)) / B_n ->^d N(0, 1)$.
  ]
  #thm[
    Let $X_k = (X_(k 1), ..., X_(k p))$ be i.i.d. random vectors in $RR^p$ with mean $mu$ and covariance matrix $Sigma$. Then
    $ (1\/sqrt(n)) sum_(k=1)^n (X_k - mu) ->^d N(0, Sigma). $
  ]
  #re[
    The limit theorems in this section require a finite variance.
  ]
  == Modes of Convergence
  #def(name: "Four Modes")[
    Write $X_n ->^"a.s." X$ for almost sure convergence, $X_n ->^P X$ for convergence in probability, and $X_n ->^d X$ for convergence in distribution. Write $X_n ->^(L^r) X$ if $E abs(X_n - X)^r -> 0$. The last mode requires $E abs(X_n)^r < oo$ and $E abs(X)^r < oo$.
  ]
  #prop[
    - If $X_n ->^"a.s." X$ and $Y_n ->^"a.s." Y$, then $X_n plus.minus Y_n ->^"a.s." X plus.minus Y$ and $X_n Y_n ->^"a.s." X Y$. If also $Y_n != 0$ and $Y != 0$ almost surely, then $X_n \/ Y_n ->^"a.s." X\/Y$.
    - The same three rules hold for convergence in probability.
    - If $X_n ->^d X$, $Y_n ->^d a$, and $b_n -> b != 0$, then $b_n X_n plus.minus Y_n ->^d b X plus.minus a$. If $a = 0$, then $X_n Y_n ->^P 0$. If $a != 0$, then $X_n Y_n ->^d a X$ and $X_n \/ Y_n ->^d X\/a$.
    - Sums preserve $L^r$ convergence. If $r = 2$, the product converges in $L^1$. If $abs(X_n)$ and $abs(Y_n)$ are essentially bounded by the same constant, the product converges in $L^r$. If $abs(X_n) <= M$ and $abs(Y_n) >= A > 0$ almost surely, the quotient converges in $L^r$.
  ]
  #re[
    Almost sure convergence and $L^r$ convergence both imply convergence in probability, which implies convergence in distribution.
  ]
]
