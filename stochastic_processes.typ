#import "template.typ": *

#note(
  title: "Stochastic Processes"
)[
  = Introduction
  == Probability
  #def(name: "Probability Space")[
    A probability space is a triple $(Omega, cal(F), P)$. The sample space $Omega$ is the set of outcomes. The event field $cal(F)$ is a $sigma$-field of subsets of $Omega$:
    - $Omega in cal(F)$;
    - $A in cal(F)$ implies $A^c in cal(F)$;
    - $A_k in cal(F)$ implies $union.big_(k=1)^oo A_k in cal(F)$.
  ]
  #def(name: "Probability")[
    Given a probability space $(Omega, cal(F), P)$, a set function $P: cal(F) -> RR$ is a probability if
    - $P(A) >= 0$ for every $A in cal(F)$;
    - $P(Omega) = 1$;
    - whenever $A_i in cal(F)$ are pairwise disjoint, $P(union.big_i A_i) = sum_i P(A_i)$.
  ]
  #def(name: "Random Variable")[
    Given a probability space $(Omega, cal(F), P)$, a map $X: Omega -> RR$ is a random variable if ${omega: X(omega) <= x} in cal(F)$ for every $x in RR$.
  ]
  #def(name: "Distribution Function")[
    Given a random variable $X$, the distribution function is $F_X (x) = P(X <= x)$.
  ]
  #def(name: "Expectation")[
    If the integral exists,
    $ E(X) = integral_(-oo)^(+oo) x dif F_X (x). $
    This Riemann-Stieltjes integral is $sum_i x_i (F_X (x_i) - F_X (x_i-))$ in the discrete case and $integral x f_X (x) dif x$ in the continuous case. For a measurable $g$,
    $ E(g(X)) = integral g(x) dif F_X (x). $
  ]
  #prop[
    Expectation is linear whether or not the summands are independent.
  ]
  #def(name: "Variance, Covariance, and Correlation")[
    The variance, covariance, and correlation are
    $ "Var"(X) = E(X - E X)^2 = E(X^2) - (E X)^2, $
    $ "Cov"(X, Y) = E((X - E X)(Y - E Y)) = E(X Y) - E(X) E(Y), $
    $ rho(X, Y) = "Cov"(X, Y) / sqrt("Var"(X) "Var"(Y)). $
  ]
  #prop[
    $abs(E(X Y)) <= sqrt(E(X^2) E(Y^2))$, and therefore $abs("Cov"(X, Y)) <= sqrt("Var"(X) "Var"(Y))$.
  ]
  == Conditional Expectation
  #def(name: "Conditional Expectation")[
    Let $E abs(X) < oo$. A random variable $E(X|Y)$ is a conditional expectation of $X$ given $Y$ if $E(X|Y) = g(Y)$ for some measurable $g$ with $E abs(g(Y)) < oo$, and
    $ E(g(Y) I_D (Y)) = E(X I_D (Y)) $
    for every Borel set $D$.
  ]
  #prop[
    - $E(E(X|Y)) = E(X)$.
    - If $h(Y)$ is bounded, then $E(g(X) h(Y) | Y) = h(Y) E(g(X)|Y)$. In particular $E(E(X|Y) h(Y)) = E(X h(Y))$.
    - If $X$ and $Y$ are independent, then $E(X|Y) = E(X)$.
  ]
  #re[
    The proposition says that $X - E(X|Y)$ is orthogonal to every bounded function of $Y$: $"Cov"(X - E(X|Y), h(Y)) = 0$ whenever the covariance exists.
  ]
  #thm(name: "Least Squares")[
    If $E(X^2) < oo$ and $g(Y)$ is square-integrable, then
    $ E(X - g(Y))^2 >= E(X - E(X|Y))^2. $
  ]
  #pf[
    Write $X - g(Y) = (X - E(X|Y)) + (E(X|Y) - g(Y))$. In the expanded square, the cross term vanishes because $E(X|Y) - g(Y)$ is a function of $Y$ and is orthogonal to $X - E(X|Y)$. What remains is
    $ E(X - E(X|Y))^2 + E(E(X|Y) - g(Y))^2, $
    and the second summand is nonnegative.
  ]
  #thm(name: "Independence")[
    If $X$ and $Y$ are independent and $E abs(h(X, Y)) < oo$, then $E(h(X, Y)|Y) = g(Y)$, where $g(y) = E(h(X, y))$.
  ]
  #pf[
    Independence gives $dif F_(X,Y) = dif F_X dif F_Y$. For every Borel set $D$,
    $ E(h(X, Y) I_D (Y)) = integral integral h(x, y) I_D (y) dif F_X (x) dif F_Y (y) = E(g(Y) I_D (Y)). $
  ]
  #thm(name: "Tower Property")[
    If $1 <= m <= n$ and $E abs(X) < oo$, then
    $ E(X | Y_1, ..., Y_m) = E( E(X | Y_1, ..., Y_n) | Y_1, ..., Y_m ). $
  ]
  #pf[
    It is enough to show that $X - E(X|Y_1, ..., Y_n)$ has conditional expectation zero given $(Y_1, ..., Y_m)$. For every bounded measurable $h(y_1, ..., y_m)$, the product $h(Y_1, ..., Y_m)$ is a bounded function of $(Y_1, ..., Y_n)$, so
    $ E(X h(Y_1, ..., Y_m)) = E( E(X|Y_1, ..., Y_n) h(Y_1, ..., Y_m) ). $
    The two sides therefore agree, and the difference $X - E(X|Y_1, ..., Y_n)$ is orthogonal to every bounded function of $(Y_1, ..., Y_m)$.
  ]
  #def(name: "Conditional Variance")[
    $ "Var"(Y|X) = E( (Y - E(Y|X))^2 | X ). $
  ]
  #thm(name: "Law of Total Variance")[
    If $E(Y^2) < oo$, then $ "Var"(Y) = E("Var"(Y|X)) + "Var"(E(Y|X)). $
    In particular $"Var"(Y) >= E("Var"(Y|X)), E("Var"(Y|X_1)) >= E("Var"(Y|X_1, X_2))$.
  ]
  #pf[
    $ "Var"(Y) = E(Y^2) - (E Y)^2 = E(E(Y^2|X)) - (E(E(Y|X)))^2. $
    Substitute $E(Y^2|X) = "Var"(Y|X) + (E(Y|X))^2$. The same decomposition given $X_1$, applied to the conditioning $sigma$-field of $(X_1, X_2)$, yields
    $ "Var"(Y|X_1) = E("Var"(Y|X_1, X_2)|X_1) + "Var"(E(Y|X_1, X_2)|X_1). $
    The second summand is nonnegative. Taking expectations gives the comparison.
  ]
  #thm(name: "Dominated Convergence")[
    Let $E Y < oo$ with $Y >= 0$, and suppose $abs(X_n) <= Y$ almost surely. If $X_n ->^(a.s.) X$, then $X$ is integrable and
    $ E(X_n) ->^(a.s.) E(X). $
    If instead $X_n ->^(P) X$, the same convergence holds in probability.
  ]
  == Stochastic Process
  #def(name: "Stochastic Process")[
    Let $(Omega, cal(F), P)$ be a probability space and let $TT$ be a time set. A stochastic process is a family $X = {X_t : t in TT}$ such that $X_t$ is a random variable for every $t in TT$.
  ]
  #def(name: "Finite-Dimensional Distributions")[
    For $t_1 < ... < t_n$ in $TT$, the distribution function
    $ F_(t_1, ..., t_n)(x_1, ..., x_n) = P(X_(t_1) <= x_1, ..., X_(t_n) <= x_n) $
    is a finite-dimensional distribution of $X$. Every process has one, and it is unique.
  ]
  #prop(name: "Symmetry and Consistency")[
    The finite-dimensional distribution of a process satisfy
    - symmetry: for every permutation $(j_1, ..., j_n)$ of $(1, ..., n)$,
    $ F_(t_(j_1), ..., t_(j_n))(x_(j_1), ..., x_(j_n)) = F_(t_1, ..., t_n)(x_1, ..., x_n); $
    - consistency: if $m < n$, then
    $ F_(t_1, ..., t_n)(x_1, ..., x_m, +oo, ..., +oo) = F_(t_1, ..., t_m)(x_1, ..., x_m). $
  ]
  #def(name: "Mean, Covariance, and Correlation Functions")[
    For a real process ${X_t : t in TT}$,
    $ m(t) = E(X_t), quad "Var"(X_t) = E(X_t - m(t))^2, $
    $ R(s, t) = E(X_s X_t), quad C_X (s, t) = "Cov"(X_s, X_t) = R(s, t) - m(s) m(t). $
    The correlation function of the process is $R$, and the correlation coefficient is
    $ rho(s, t) = (C_X (s, t)) / (sqrt("Var"(X_s) "Var"(X_t))). $
  ]
  = Poisson Process
  == Homogeneous Poisson Process
  #def(name: "Counting Process")[
    A counting process ${N_t : t >= 0}$ satisfies $N_0 = 0$, takes values in ${0, 1, 2, ...}$, and has nondecreasing paths. Then $N_t$ counts events in $[0, t]$, and $N_t - N_s$ counts events in $(s, t]$.
  ]
  #def(name: "Independent and Stationary Increments")[
    A process $X$ has independent increments if, for every $t_0 < t_1 < ... < t_n$, the increments $X_(t_1) - X_(t_0), ..., X_(t_n) - X_(t_(n-1))$ are independent. It has stationary increments if, for $0 <= s < t$, the increment $X_t - X_s$ has the same distribution as $X_(t-s) - X_0$.
  ]
  #def(name: "Homogeneous Poisson Process")[
    A counting process ${N_t : t >= 0}$ is a homogeneous Poisson process of intensity $lambda > 0$ if
    - it has independent increments and stationary increments;
    - for every $t > 0$ and every sufficiently small $h > 0$,
    $ P(N_(t+h) - N_t = 1) = lambda h + o(h), $
    $ P(N_(t+h) - N_t = 0) = 1 - lambda h + o(h). $
  ]
  #thm[
    If ${N_t : t >= 0}$ is a homogeneous Poisson process of intensity $lambda$, then for every $s >= 0$ and $t > 0$,
    $ N_(s+t) - N_s ~ "Poisson"(lambda t). $
    In particular, $P(N_t = k) = e^(-lambda t) (lambda t)^k / k!$ for $k = 0, 1, 2, ...$.
  ]
  #pf[
    Write $p_k (t) = P(N_t = k)$. Independent and stationary increments give, for $h > 0$,
    $ p_0(t+h) = p_0(t) (1 - lambda h + o(h)). $
    Dividing by $h$ and letting $h -> 0$ yields $p_0^' (t) = -lambda p_0(t)$. Since $N_0 = 0$, one has $p_0(0) = 1$, so $p_0(t) = e^(-lambda t)$.\
    For $k >= 1$ the same splitting, and the estimate $P("increment" >= 2) = o(h)$, gives
    $ p_k (t+h) = p_k (t)(1 - lambda h + o(h)) + p_(k-1)(t)(lambda h + o(h)) + o(h), $
    hence $p_k^' (t) = -lambda p_k (t) + lambda p_(k-1)(t)$.\
    The probability generating function $Phi(t, z) = sum_(k=0)^oo p_k (t) z^k$ satisfies $Phi(0, z) = 1$ and
    $ partial_t Phi(t, z) = -lambda (1 - z) Phi(t, z). $
    Therefore $Phi(t, z) = exp(-lambda t (1-z)) = e^(-lambda t) sum_(k=0)^oo (lambda t)^k z^k / k!$, and the coefficient of $z^k$ is the Poisson probability.
  ]
  #def(name: "Second Definition")[
    A counting process ${N_t : t >= 0}$ is a homogeneous Poisson process of intensity $lambda$ if $N_0 = 0$, the process has independent increments, and $N_(s+t) - N_s ~ "Poisson"(lambda t)$ for all $s, t >= 0$.
  ]
  #prop[
    If ${N_t}$ is a homogeneous Poisson process of intensity $lambda$, then $E(N_t) = "Var"(N_t) = lambda t$ and
    $ "Cov"(N_s, N_t) = lambda min(s, t). $
  ]
  #pf[
    The mean and variance are those of $"Poisson"(lambda t)$. If $s <= t$, independent increments give
    $ "Cov"(N_s, N_t) = "Cov"(N_s, N_s + (N_t - N_s)) = "Var"(N_s) = lambda s. $
  ]
  #thm[
    If $N^((1)), ..., N^((m))$ are independent homogeneous Poisson processes of intensities $lambda_1, ..., lambda_m$, then $N_t = N_t^((1)) + ... + N_t^((m))$ is a homogeneous Poisson process of intensity $lambda_1 + ... + lambda_m$.
  ]
  #thm[
    Let ${N_t}$ be a homogeneous Poisson process of intensity $lambda$. Mark each event independently as type $1$ with probability $p$ and type $2$ with probability $1-p$, and let $N_t^((1))$ and $N_t^((2))$ be the counts of the two types in $[0, t]$. Then for each fixed $t$,
    $ N_t^((1)) ~ "Poisson"(lambda p t), quad N_t^((2)) ~ "Poisson"(lambda (1-p) t), $
    and $N_t^((1))$ is independent of $N_t^((2))$.
  ]
  #pf[
    Condition on the total count and use the binomial thinning:
    $ P(N_t^((1)) = i, N_t^((2)) = j) = e^(-lambda t) (lambda t)^(i+j) / (i+j)! dot binom(i+j, i) p^i (1-p)^j, $
    which factors as the product of the two Poisson probabilities.
  ]
  == Arrival Time
  #def(name: "Arrival and Interarrival Time")[
    Let $tau_0 = 0$ and let $tau_n$ be the time of the $n$-th event. The interarrival time is $X_n = tau_n - tau_(n-1)$ for $n >= 1$.
  ]
  #thm[
    If ${N_t}$ is a homogeneous Poisson process of intensity $lambda$, then $tau_n ~ Gamma(n, lambda)$:
    $ f_(tau_n)(t) = lambda^n / (n-1)! t^(n-1) e^(-lambda t), quad t >= 0. $
  ]
  #pf[
    $ P(tau_n <= t) = P(N_t >= n) = sum_(k=n)^oo e^(-lambda t) (lambda t)^k / k!. $
    Differentiating term by term,
    $ d/(d t) (e^(-lambda t) (lambda t)^k / k!) = -lambda e^(-lambda t) (lambda t)^k / k! + lambda e^(-lambda t) (lambda t)^(k-1) / (k-1)!. $
    Summing from $k = n$ to $oo$ and reindexing the second sum yields the density.
  ]
  #thm[
    On $0 < t_1 < ... < t_n < oo$, the joint density of $(tau_1, ..., tau_n)$ is $lambda^n e^(-lambda t_n)$.
  ]
  #pf[
    If $h > 0$ is small enough that the windows $(t_i - h/2, t_i + h/2)$ are disjoint, the probability of one event in each window and none elsewhere on $[0, t_n + h/2]$ equals $(lambda h)^n e^(-lambda (t_n + h/2))$. Dividing by $h^n$ and letting $h -> 0^+$ yields the density $lambda^n e^(-lambda t_n)$.
  ]
  #thm[
    A counting process is a homogeneous Poisson process of intensity $lambda$ if and only if its interarrival times $X_i ~ "Exp"(lambda)$ i.i.d..
  ]
  #pf[
    Suppose $N$ is Poisson of intensity $lambda$. The map $(x_1, ..., x_n) |-> (x_1, x_1+x_2, ..., x_1+...+x_n)$ has Jacobian determinant $1$. Substituting $t_n = x_1 + ... + x_n$ into the joint density of the arrival times gives, for $x_i > 0$,
    $ f_(X_1, ..., X_n)(x_1, ..., x_n) = lambda^n e^(-lambda (x_1 + ... + x_n)) = product_(i=1)^n lambda e^(-lambda x_i). $
    Thus the interarrival times are i.i.d. exponential of rate $lambda$.\
    Conversely, start from i.i.d. exponential interarrival times, set $tau_n = X_1 + ... + X_n$ and $N_t = sup{n: tau_n <= t}$. Then $tau_n ~ Gamma(n, lambda)$, so
    $ P(N_t = n) = P(tau_n <= t) - P(tau_(n+1) <= t) = e^(-lambda t) (lambda t)^n / n!. $
    The memoryless property of the exponential law makes the time until the next event, after any fixed time, exponential of rate $lambda$ and independent of the history.
  ]
  #thm[
    If ${N_t}$ is a homogeneous Poisson process of intensity $lambda$ and $n >= 1$, then conditionally on $N_t = n$ the arrival times $(tau_1, ..., tau_n)$ have density
    $ f(t_1, ..., t_n | N_t = n) = n! / t^n, quad 0 < t_1 < ... < t_n < t. $
    Namely, they are distributed as the order statistics of $n$ i.i.d. uniform random variables on $[0, t]$.
  ]
  #pf[
    For the joint density, take disjoint windows of width $h$ about $t_1 < ... < t_n$. The probability of one event in each window and none elsewhere in $[0, t]$ is $e^(-lambda t) (lambda h)^n$, and $P(N_t = n) = e^(-lambda t) (lambda t)^n / n!$. The ratio is $n! (h/t)^n$. Dividing by $h^n$ produces $n! / t^n$.
  ]
  #eg[
    Passengers arrive at a stop as a homogeneous Poisson process of intensity $lambda$ per minute. A bus clears the queue every $10$ minutes. Let $tau_k$ be the arrival time of the $k$-th passenger during a ten-minute cycle, and let $X = sum_(k=1)^(N_10) (10 - tau_k)$ be the total waiting time in that cycle. Then 
    $ E(X) = E(E(X | N_10)) = E(5 N_10) = 50 lambda. $
  ]
  == Nonhomogeneous Poisson Process
  #def(name: "Nonhomogeneous Poisson Process")[
    Let $lambda(t) > 0$ be locally integrable. A counting process ${N_t : t >= 0}$ is a nonhomogeneous Poisson process of intensity $lambda(t)$ if it has independent increments and for every $t >= 0$ and every sufficiently small $h > 0$,
    $ P(N_(t+h) - N_t = 1) = lambda(t) h + o(h), $
    $ P(N_(t+h) - N_t = 0) = 1 - lambda(t) h + o(h). $
  ]
  #thm[
    A counting process is a nonhomogeneous Poisson process of intensity $lambda(t)$ if and only if it has independent increments and
    $ N_t - N_s ~ "Poisson"(m(t) - m(s)), quad 0 <= s < t, $
    where $m(t) = integral_0^t lambda(u) dif u$.
  ]
]
