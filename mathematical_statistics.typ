#import "template.typ": *

#note(
  title: "Mathematical Statistics"
)[
  = Introduction
  == Samples and Statistics
  #def(name: "Simple Random Sample")[
    A simple random sample is an i.i.d. sample.
  ]
  #eg[
    Let $X_1, ..., X_n$ be i.i.d. $N(mu, sigma^2)$, and set
    $ A = 1/n sum_(i=1)^n (X_i - mu)^2, quad B = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2. $
    Then $E(A) = E(B) = sigma^2$, $"Var"(A) = 2/n sigma^4$, $"Var"(B) = 2/(n-1) sigma^4$, and
    $ "Cor"(A, B) = sqrt((n-1)/n). $
  ]
  #re[
    For an i.i.d. pair,
    $ sigma^2 = E(X - E X)^2 = 1/2 E(X_1 - X_2)^2 = integral.double 1/2 (x-y)^2 dif F(x) dif F(y), $
    and $mu = integral x dif F(x)$.
  ]
  #def(name: "Parametric Family")[
    Let $X_1, ..., X_n$ be i.i.d. with density or mass function $f$ belonging to
    $ cal(F) = {f(x, theta) : theta in Theta}. $
    The unknown $theta$ is the parameter, and $Theta$ is the parameter space.
  ]
  #def(name: "Statistic")[
    A statistic is a quantity determined entirely by the sample, that is, a function of the sample.
  ]
  #def(name: "Empirical Distribution Function")[
    $ F_n (x) = 1/n sum_(i=1)^n I_({X_i <= x}). $
    For each fixed $x$, $E(F_n (x)) = F(x)$ and $"Var"(F_n (x)) = 1/n F(x) (1 - F(x))$.
  ]
  #thm(name: "Glivenko-Cantelli")[
    $ sup_x abs(F_n (x) - F(x)) -> 0 $ almost surely.
  ]
  #thm(name: "Dvoretzky-Kiefer-Wolfowitz")[
    For every $epsilon > 0$,
    $ P(sup_x abs(F_n (x) - F(x)) > epsilon) <= 2 e^(-2 n epsilon^2). $
  ]
  #def(name: "Sample Mean and Sample Variance")[
    $ overline(X) = 1/n sum_(i=1)^n X_i, quad S_n^2 = 1/n sum_(i=1)^n (X_i - overline(X))^2. $
    The unbiased sample variance, used below for $t$ and $F$ laws and for confidence intervals, is
    $ S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2. $
  ]
  #thm[
    If $Z = (Z_1, ..., Z_n)^T$ is standard normal in $RR^n$ and $U$ is an orthogonal matrix, then $U Z$ has the same distribution as $Z$. Consequently, for a normal sample, $overline(X)$ and $S_n^2$ are independent.
  ]
  == Sampling Distributions
  #def(name: "Chi-Square")[
    If $X_1, ..., X_n$ are i.i.d. $N(0, 1)$, then $T = X_1^2 + ... + X_n^2$ has the chi-square law $chi_n^2$ with density
    $ f(x) = 1/(2^(n/2) Gamma(n/2)) x^(n/2 - 1) e^(-x/2), quad x > 0. $
    $E(T) = n$, $"Var"(T) = 2 n$, and $E(T^k) = 2^k Gamma(n/2 + k) / Gamma(n/2)$ whenever $n/2 + k > 0$.
  ]
  #re[
    $Gamma(t) = integral_0^oo x^(t-1) e^(-x) dif x$, with $Gamma(1) = 1$, $Gamma(x+1) = x Gamma(x)$, $Gamma(1/2) = sqrt(pi)$, and $Gamma(n) = (n-1)!$.\
    If an exponential random variable of rate $lambda$ has density $lambda e^(-lambda x)$ for $x >= 0$, then $chi_2^2$ has the same distribution as the exponential law of rate $1/2$, and also the same distribution as $2 lambda$ times an exponential random variable of rate $lambda$.
  ]
  #def(name: [Student's $t$])[
    If $X_1, ..., X_n, Y$ are i.i.d. $N(0, 1)$ and
    $ T = Y / sqrt( (X_1^2 + ... + X_n^2) / n ), $
    then $T$ has Student's $t$ law on $n$ degrees of freedom, with density
    $ f(t) = (Gamma((n+1)/2)) / (sqrt(n pi) Gamma(n/2)) (1 + t^2/n)^(-(n+1)/2). $
    $E(T) = 0$ for $n > 1$, and $"Var"(T) = n/(n-2)$ for $n > 2$. The case $n = 1$ is standard Cauchy, and as $n -> oo$ the law tends to $N(0, 1)$. The square of a $t_n$ random variable is $F_(1, n)$.
  ]
  #def(name: [Fisher's $F$])[
    If $X_1, ..., X_m, Y_1, ..., Y_n$ are i.i.d. $N(0, 1)$ and
    $ T = ((X_1^2 + ... + X_m^2) / m) / ((Y_1^2 + ... + Y_n^2) / n), $
    then $T$ has the Fisher law $F_(m, n)$, with density
    $ f(t) = (Gamma((m+n)/2)) / (Gamma(m/2) Gamma(n/2)) (m/n)^(m/2) t^(m/2 - 1) (1 + (m/n) t)^(-(m+n)/2) $
    for $t > 0$. If $n > 2$, then $E(T) = n/(n-2)$.
  ]
  #re[
    For normal samples of sizes $m$ and $n$, with unbiased sample standard deviations $S_X$ and $S_Y$,
    $ sqrt(m) (overline(X) - mu_1) / S_X ~ t_(m-1), quad sqrt(n) (overline(Y) - mu_2) / S_Y ~ t_(n-1), $
    and $(sigma_2^2 / sigma_1^2) (S_X^2 / S_Y^2) ~ F_(m-1, n-1)$.
  ]
  == Order Statistics
  #re[
    If $X_1, ..., X_n$ are i.i.d. with density $f$, the joint density of the order statistics on $x_1 < ... < x_n$ is $n! f(x_1) ... f(x_n)$. If the distribution function $F$ of $X$ is continuous, then $F(X) ~ U(0, 1)$.
  ]
  #prop[
    Let $U_((k))$ be the $k$-th order statistic of an i.i.d. uniform sample of size $n$ on $(0, 1)$. Its density is
    $ f(x) = (n!) / ((k-1)! (n-k)!) x^(k-1) (1-x)^(n-k), quad 0 < x < 1. $
    Hence $E(U_((k))) = k/(n+1)$ and $"Var"(U_((k))) = k(n+1-k) / ((n+1)^2 (n+2))$. For $1 <= i <= j <= n$,
    $ "Cov"(U_((i)), U_((j))) = (i (n+1-j)) / ((n+1)^2 (n+2)), quad rho(U_((i)), U_((j))) = sqrt( (i(n+1-j)) / (j(n+1-i)) ). $
  ]
  #pf[
    $ E(U_((k))) = integral_0^1 (n!) / ((k-1)! (n-k)!) x^k (1-x)^(n-k) dif x. $
    The integrand is $k/(n+1)$ times the density of the $(k+1)$-st order statistic in a uniform sample of size $n+1$, so the integral equals $k/(n+1)$. The same comparison gives $E(U_((k))^2) = k(k+1) / ((n+1)(n+2))$, and the variance follows by subtraction. The covariance is the corresponding mixed moment minus the product of the means.
  ]
  #thm[
    Fix $p in (0, 1)$ and set $k = floor(n p)$. If $U_((k))$ is a uniform order statistic, then
    $ sqrt(n) (U_((k)) - p) ->^d N(0, p(1-p)). $
    If $X_1, ..., X_n$ are i.i.d. with continuous distribution function $F$ and density $f$, and if $f(F^(-1)(p)) > 0$, then
    $ sqrt(n) (X_((k)) - F^(-1)(p)) ->^d N(0, (p(1-p)) / (f(F^(-1)(p)))^2 ). $
  ]
  #lem(name: "Scheffé")[
    Pointwise convergence of densities implies weak convergence of the corresponding distribution functions.
  ]
  = Point Estimation
  == Estimators
  #def(name: "Unbiased Estimator")[
    An estimator $hat(g)(X)$ of $g(theta)$ is unbiased if $E_theta hat(g)(X) = g(theta)$ for every $theta$.
  ]
  #eg[
    The unbiased sample variance $S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2$ is unbiased for
    $ sigma^2 = 1/2 integral.double (x-y)^2 dif F(x) dif F(y). $
  ]
  #def(name: "Mean Squared Error")[
    $ "MSE"(hat(theta)) = E(hat(theta) - theta)^2 = "Var"(hat(theta)) + (E hat(theta) - theta)^2. $
    The second term is the square of the bias.
  ]
  #def(name: "Efficiency")[
    Let $hat(g)_1$ and $hat(g)_2$ be unbiased estimators of $g(theta)$. If $"Var"(hat(g)_1(X)) <= "Var"(hat(g)_2(X))$ for every $theta$, and the inequality is strict for some $theta_0$, then $hat(g)_1$ is more efficient than $hat(g)_2$.
  ]
  #def(name: "Consistency")[
    An estimator $hat(g)_n$ is weakly consistent for $g(theta)$ if $hat(g)_n ->^P g(theta)$, strongly consistent if the convergence is almost sure, and completely convergent if
    $ sum_n P(abs(hat(g)_n - g(theta)) > epsilon) < oo $
    for every $epsilon > 0$.
  ]
  #re[
    The weak law, Markov's inequality, and Chebyshev's inequality are the usual tools for weak consistency. The strong law and the Borel--Cantelli lemma are the usual tools for strong consistency.
  ]
  #thm(name: "Continuous Mapping")[
    If $g$ is continuous and $X_n$ converges to $X$ almost surely or in probability, then $g(X_n)$ converges to $g(X)$ in the same mode. If $X_n ->^d X$ and $P(X in C) = 1$ for the continuity set $C$ of $g$, then $g(X_n) ->^d g(X)$.
  ]
  #def(name: "Maximum Likelihood")[
    The likelihood of an i.i.d. sample is $L(theta, x) = product_(i=1)^n f(x_i, theta)$. A maximum likelihood estimator is a value of $theta$ that maximizes $L$.
  ]
  #re[
    Two parallel procedures, starting from a model:
    - Method of moments. Write $E(X) = f(p)$, invert to $p = g(E(X))$, and substitute the sample mean to get $hat(p) = g(overline(X))$.
    - Maximum likelihood. Write $L(p)$, solve $L'(p) = 0$, and check that the critical point is a maximum through the Hessian.
  ]
  #def(name: "UMVUE")[
    An unbiased estimator $hat(g)^*$ of $g(theta)$ is a uniformly minimum variance unbiased estimator if $"Var"(hat(g)^*(X)) <= "Var"(hat(g)(X))$ for every unbiased competitor $hat(g)$ and every $theta$.
  ]
  #eg[
    If $X ~ "Bin"(n, p)$ and $g(p) = 1/p$, then $g$ has no unbiased estimator. Indeed, an identity
    $ sum_(k=0)^n hat(g)(k) binom(n, k) p^(k+1) (1-p)^(n-k) = 1 $
    for every $p in (0, 1)$ is impossible: as $p -> 0$ the left side tends to $0$.
  ]
  == Sufficiency and Completeness
  #thm(name: "Rao-Blackwell")[
    Let $hat(g)(X)$ be unbiased for $g(theta)$, let $T = T(X)$, and set $h(T) = E(hat(g)(X) | T)$. Then $E h(T) = g(theta)$ and $"Var"(h(T)) <= "Var"(hat(g)(X))$ for every $theta$, with equality if and only if $hat(g)(X) = h(T)$ almost surely. If the conditional law of the sample given $T$ does not depend on $theta$, then $T$ is sufficient for $theta$.
  ]
  #re[
    If $f(X) = E(Y|X)$, then $"Var"(Y) = "Var"(f(X)) + E(Y - f(X))^2$.
  ]
  #thm(name: "Factorization")[
    A statistic $T$ is sufficient for $theta$ if and only if the joint density or mass function factors as $f(x, theta) = g(T(x), theta) h(x)$.
  ]
  #def(name: "Complete Statistic")[
    A statistic $T$ is complete if $E_theta phi(T) = 0$ for every $theta$ implies $P_theta (phi(T) = 0) = 1$ for every $theta$.
  ]
  #re[
    A standard problem is: given the distribution, and possibly a sufficient statistic $T$, find the UMVUE of $g(theta)$.
  ]
  #thm[
    An unbiased estimator $hat(g)$ is a UMVUE of $g(theta)$ if and only if $"Cov"(hat(g)(X), Z(X)) = E(hat(g)(X) Z(X)) = 0$ whenever $E_theta Z(X) = 0$ for every $theta$.
  ]
  #thm(name: "Lehmann--Scheffé")[
    Suppose $g(theta)$ admits an unbiased estimator and $T$ is a complete sufficient statistic. If $hat(g)(T)$ is unbiased for $g(theta)$, then $hat(g)(T)$ is the unique UMVUE of $g(theta)$.
  ]
  #re[
    Two ways to produce a UMVUE: apply the Lehmann--Scheffé theorem to an unbiased function of a complete sufficient statistic, often computed from $E(T)$ and $E(T^2)$; or start from any unbiased estimator and replace it by its conditional expectation given a sufficient statistic.
  ]
  == The Cramér-Rao Bound
  #def(name: "Fisher Information")[
    For a density or mass function $f(x, theta)$,
    $ integral ((partial f(x, theta)) / (partial theta))^2 / f(x, theta) dif x = E ((partial log f(X, theta)) / (partial theta))^2 =: I(theta). $
    This is the Fisher information in one observation.
  ]
  #thm(name: "Cramér-Rao")[
    Let the model be Cramér-Rao regular, and let $hat(g)(X)$ be unbiased for $g(theta)$. If $integral hat(g)(x) f(x, theta) dif x$ may be differentiated in $theta$ under the integral, then
    $ "Var"(hat(g)(X)) >= (g'(theta))^2 / (n I(theta)). $
  ]
  #re[
    The usual route to a UMVUE through this bound is: compute $I(theta)$, apply the inequality, and check whether an unbiased function of a sufficient statistic attains the bound.
  ]
  #def(name: "Entropy and Kullback-Leibler Divergence")[
    The entropy of a density $f(x, theta)$ is $E(-log f(X, theta))$. The divergence of $p$ from $q$ is
    $ D_"KL" (p parallel q) = integral log(p(x)/q(x)) p(x) dif x. $
  ]
  #re[
    Under the usual regularity, a maximum likelihood estimator $hat(theta)_n$ converges to the population maximizer $theta^* = "argmax"_theta E log f(X, theta)$.
  ]
  = Interval Estimation
  #def(name: "Confidence Interval")[
    Random endpoints $hat(theta)_1 < hat(theta)_2$ form a confidence interval for $theta$ of level $1-alpha$ if $P(theta in (hat(theta)_1, hat(theta)_2)) >= 1-alpha$. One often takes $alpha = 5%$.
  ]
  #re[
    Let $X_1, ..., X_n$ be i.i.d. $N(mu, sigma^2)$. Write $u(alpha) = Phi^(-1)(1-alpha)$ for the upper $alpha$ quantile of $N(0, 1)$, and write $t_(n-1)(alpha)$ and $chi_nu^2 (alpha)$ for the corresponding upper quantiles of $t_(n-1)$ and $chi_nu^2$. Let $S$ be the unbiased sample standard deviation.
    - If $sigma$ is known, a level $1-alpha$ interval for $mu$ is
    $ [overline(X) - (sigma/sqrt(n)) u(alpha/2), overline(X) + (sigma/sqrt(n)) u(alpha/2)]. $
    - If $sigma$ is unknown, replace $sigma$ by $S$ and $u(alpha/2)$ by $t_(n-1)(alpha/2)$.
    - If $mu$ is known, a level $1-alpha$ interval for $sigma^2$ is
    $ [ (sum_(i=1)^n (X_i-mu)^2) / chi_n^2 (alpha/2), (sum_(i=1)^n (X_i-mu)^2) / chi_n^2 (1-alpha/2) ]. $
    - If $mu$ is unknown, replace each $(X_i - mu)$ by $(X_i - overline(X))$ and each $chi_n^2$ by $chi_(n-1)^2$.
  ]
  #def(name: "Pivotal Quantity")[
    Starting from a point estimator $T = hat(theta)$, form a function $psi(T, theta)$ whose distribution does not depend on the unknown parameter. Choose constants $a < b$ with $P(a <= psi(T, theta) <= b) = 1-alpha$, and invert the inequality for $theta$.
  ]
  = Hypothesis Testing
  == Tests and Likelihood Ratios
  #def(name: "Test, Power, and Errors")[
    Let $X_1, ..., X_n$ have joint law $f(x, theta)$. A test of $H_0: theta in Theta_0$ against $H_1: theta in Theta_1$ rejects $H_0$ when the sample falls in a rejection region $A$. The power function is $beta(theta) = P_theta (X in A)$. Rejecting a true null hypothesis is a type I error. Accepting a false null hypothesis is a type II error. The test has level $alpha$ if $sup_(theta in Theta_0) beta(theta) <= alpha$.
  ]
  #def(name: "Test Function")[
    The test function is $phi(X) = I_({X in A})$. For a test statistic $T$ and a critical value $c$, one takes $A = {T(X) > c}$.
  ]
  #def(name: "Likelihood-Ratio Statistic")[
    $ T_n = (sup_(theta in Theta) L(theta)) / (sup_(theta in Theta_0) L(theta)). $
    One has $T_n >= 1$, and values closer to $1$ favor the null. The test rejects for large values. A possibly randomized test function is
    $ phi(x) = cases(1 & "if" T_n > c, r & "if" T_n = c, 0 & "if" T_n < c), $
    where $0 < r < 1$ and $c$ is chosen to meet the level.
  ]
  #re[
    As $n -> oo$, $2 log T_n$ converges in distribution to a chi-square law.
  ]
  #def(name: [$p$-Value])[
    Under the null hypothesis, if $G$ is the distribution function of the test statistic, then $G(T) ~ U(0, 1)$. The $p$-value is $1 - G(T)$. In the notes, $G$ may be the asymptotic null distribution.
  ]
  == Rank Tests
  #def(name: "Rank Statistic")[
    If $X_1, ..., X_n$ are distinct, the rank $R_k$ of $X_k$ is its position in the increasing rearrangement, and $R = (R_1, ..., R_n)$ is the rank statistic. Then $R_i = sum_(k=1)^n I_({X_k <= X_i}) = n F_n (X_i)$.
  ]
  #thm[
    If $X_1, ..., X_n$ are i.i.d. with a continuous distribution, then $R$ is uniformly distributed on the permutations of $(1, ..., n)$: each permutation has probability $1/n!$. Marginally, $P(R_1 = k) = 1/n$,
    $ E(R_i) = (n+1)/2, \
      "Var"(R_i) = ((n+1)(n-1))/12, \
      "Cov"(R_i, R_j) = -(n+1)/12 $
    for $i != j$.
  ]
  #def(name: "Signed Rank Statistic")[
    Let $phi_i = "sgn"(X_i)$, and let $R_i$ be the rank of $abs(X_i)$ among $abs(X_1), ..., abs(X_n)$. The signed rank statistic is $R^+ = (phi_1 R_1, ..., phi_n R_n)$.
  ]
  #thm(name: "Chi-Square Goodness of Fit")[
    For a fully specified discrete distribution with cell probabilities $p_i > 0$, if $hat(p)_i$ is the observed frequency of cell $i$ in a sample of size $n$, then as $n -> oo$,
    $ sum_(i=1)^k (n (hat(p)_i - p_i)^2) / p_i ->^d chi_(k-1)^2. $
  ]
  #thm(name: "Kolmogorov-Smirnov")[
    If $F$ is a continuous distribution function and $F_n$ is the empirical distribution function of an i.i.d. sample from $F$, then
    $ sqrt(n) sup_x abs(F_n (x) - F(x)) ->^d sup_t abs(B(t)), $
    where $B$ is a Brownian bridge.
  ]
]
