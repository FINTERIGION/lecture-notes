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
  == Other Poisson Processes
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
  #def(name: "Compound Poisson Process")[
    Let ${xi_i : i = 1, 2, ...}$ be i.i.d. random variables, independent of a homogeneous Poisson process ${N_t : t >= 0}$ of intensity $lambda$. The process
    $ X_t = sum_(i=1)^(N_t) xi_i, $
    with the empty sum equal to zero, is a compound Poisson process.
  ]
  #prop[
    If ${X_t}$ is compound Poisson as above, with $mu = E(xi_1)$ and $E(xi_1^2) < oo$, then
    $ E(X_t) = lambda t mu, quad "Var"(X_t) = lambda t E(xi_1^2), $
    $ R(s, t) = E(X_s X_t) = lambda min(s, t) E(xi_1^2) + lambda^2 s t mu^2, $
    $ "Cov"(X_s, X_t) = lambda min(s, t) E(xi_1^2). $
  ]
  #pf[
    Conditioning on the count gives $E(X_t | N_t) = N_t mu$, hence $E(X_t) = E(N_t) mu = lambda t mu$.\
    For the correlation, take $s <= t$. Given $N_s = m$ and $N_t = n$, necessarily $m <= n$, and
    $ E(X_s X_t | N_s = m, N_t = n) = sum_(i=1)^m sum_(j=1)^n E(xi_i xi_j) = m E(xi_1^2) + (m n - m) mu^2 $
    $ = m "Var"(xi_1) + m n mu^2. $
    Therefore
    $ E(X_s X_t) = E(N_s) "Var"(xi_1) + E(N_s N_t) mu^2. $
    Independent increments of $N$ yield $E(N_s N_t) = lambda s + lambda^2 s t$, so
    $ R(s, t) = lambda s "Var"(xi_1) + (lambda s + lambda^2 s t) mu^2 = lambda s E(xi_1^2) + lambda^2 s t mu^2. $
    The identities for general $s, t$ follow by symmetry. Subtracting $E(X_s) E(X_t)$ leaves the covariance, and the variance is the case $s = t$.
  ]
  #def(name: "Conditional Poisson Process")[
    Let $Lambda$ be a nonnegative random variable with distribution function $F_Lambda$. A counting process ${N_t : t >= 0}$ is a conditional Poisson process with prior $F_Lambda$ if, given $Lambda = lambda$, the process $N$ is a homogeneous Poisson process of intensity $lambda$. Equivalently, for every $s < t$ and every $k = 0, 1, 2, ...$,
    $ P(N_t - N_s = k | Lambda = lambda) = e^(-lambda (t-s)) (lambda (t-s))^k / k!. $
  ]
  #thm(name: "Gamma Prior")[
    Suppose the prior of $Lambda$ is $Gamma(m_0, lambda_0)$, with density
    $ f_Lambda (lambda) = (lambda_0^(m_0) / Gamma(m_0)) lambda^(m_0 - 1) e^(-lambda_0 lambda), quad lambda > 0. $
    Conditionally on $N_1 = x_1$, $N_2 - N_1 = x_2$, $...$, $N_n - N_(n-1) = x_n$, the posterior of $Lambda$ is $Gamma(m_0 + x_1 + ... + x_n, n + lambda_0)$.
  ]
  #pf[
    Independent increments given $Lambda$ yield
    $ P(N_1 = x_1, ..., N_n - N_(n-1) = x_n | Lambda = lambda) = product_(i=1)^n (e^(-lambda) lambda^(x_i) / x_i!) $
    which is proportional to $lambda^(x_1 + ... + x_n) e^(-n lambda)$.
    The posterior density is therefore proportional to
    $ lambda^(x_1 + ... + x_n) e^(-n lambda) dot lambda^(m_0 - 1) e^(-lambda_0 lambda) = lambda^(m_0 + x_1 + ... + x_n - 1) e^(-(n + lambda_0) lambda), $
    which is the kernel of $Gamma(m_0 + x_1 + ... + x_n, n + lambda_0)$.
  ]
  = Markov Chains
  == Discrete-Time Markov Chains
  #def(name: "Discrete-Time Markov Chain")[
    The process is a discrete-time Markov chain if, whenever $P(X_0 = i_0, ..., X_n = i_n) > 0$,
    $ P(X_(n+1) = i_(n+1) | X_0 = i_0, ..., X_n = i_n) = P(X_(n+1) = i_(n+1) | X_n = i_n). $
  ]
  #prop[
    The one-step Markov property is equivalent to the same identity at arbitrary times: for every $t_1 < ... < t_n < t_(n+1)$ with $P(X_(t_1) = i_1, ..., X_(t_n) = i_n) > 0$,
    $ P(X_(t_(n+1)) = i_(n+1) | X_(t_1) = i_1, ..., X_(t_n) = i_n) = P(X_(t_(n+1)) = i_(n+1) | X_(t_n) = i_n). $
  ]
  #thm[
    The following are equivalent to the Markov property.
    - For every bounded measurable $f$,
    $ E(f(X_(n+1)) | X_0 = i_0, ..., X_n = i_n) = E(f(X_(n+1)) | X_n = i_n). $
    - For every $m >= 1$,
    $ P(X_(n+m) = i_(n+m) | X_0 = i_0, ..., X_n = i_n) = P(X_(n+m) = i_(n+m) | X_n = i_n). $
    - Write $A$ for a past event ${X_0 in A_0, ..., X_(n-1) in A_(n-1)}$ and $B$ for a future event ${X_(n+1) in A_(n+1), X_(n+2) in A_(n+2), ...}$. Then
    $ P(B | A, X_n = i_n) = P(B | X_n = i_n). $
    Equivalently, past and future are conditionally independent given the present:
    $ P(A inter B | X_n = i_n) = P(A | X_n = i_n) P(B | X_n = i_n). $
  ]
  #def(name: "Transition Probability")[
    The one-step transition probability at time $n$ is
    $ p_(i j)(n) = P(X_(n+1) = j | X_n = i). $
    The chain is homogeneous if $p_(i j)(n) = p_(i j)$ is independent of $n$. The matrix $bb(P) = (p_(i j))$ is then the transition matrix.
  ]
  #thm[
    Suppose $X_(n+1) = f(X_n, ξ_(n+1))$ for $n >= 0$, where $ {ξ_n}$ is i.i.d. and independent of $X_0$. Then ${X_n}$ is a homogeneous Markov chain with
    $ p_(i j) = P(f(i, ξ_1) = j). $
  ]
  #pf[
    The vector $(X_0, ..., X_n)$ is a function of $(X_0, ξ_1, ..., ξ_n)$, hence independent of $ξ_(n+1)$. Therefore
    $ P(X_(n+1) = j | X_0 = i_0, ..., X_n = i) = P(f(i, ξ_(n+1)) = j) = P(f(i, ξ_1) = j). $
  ]
  #eg[
    _Random walk._ A particle on $ZZ$ starts at $0$ and at each step moves right with probability $p$ and left with probability $q = 1 - p$. If $ξ_k = plus.minus 1$ records the $k$-th step and $X_n = sum_(k=1)^n ξ_k$, then $X_(n+1) = X_n + ξ_(n+1)$, so ${X_n}$ is a homogeneous Markov chain with $p_(i, i+1) = p$ and $p_(i, i-1) = q$.
  ]
  #eg[
    _Gambler's ruin._ The same walk on ${0, 1, ..., b}$, absorbed at the endpoints, is given by $p_(0 0) = p_(b b) = 1$ and $p_(i, i+1) = p$, $p_(i, i-1) = q$ for $0 < i < b$. Equivalently $X_(n+1) = f(X_n, ξ_(n+1))$ with $f(x, y) = x + y$ for $0 < x < b$ and $f(0, y) = 0$, $f(b, y) = b$.
  ]
  == Transition Matrix
  #def(name: "State Distribution")[
    The distribution of $X_n$ is $π_i (n) = P(X_n = i)$, assembled into the row vector $π(n) = (π_i (n))_(i in S)$. In particular $π(0)$ is the initial distribution.
  ]
  #prop[
    The finite-dimensional distributions are determined by $π(0)$ and $bb(P)$:
    $ P(X_0 = i_0, ..., X_n = i_n) = π_(i_0)(0) p_(i_0 i_1) dots.c p_(i_(n-1) i_n). $
  ]
  #prop[
    The marginals satisfy $π(n) = π(n-1) bb(P) = π(0) bb(P)^n$.
  ]
  #pf[
    Conditioning on $X_(n-1)$ gives $π_j (n) = sum_i π_i (n-1) p_(i j)$.
  ]
  #def(name: "m-Step Transition")[
    The $m$-step transition probabilities are $p_(i j)^((m)) = P(X_(n+m) = j | X_n = i)$, assembled into the matrix $bb(P)^((m))$. In particular $p_(i j)^((1)) = p_(i j)$ and $p_(i i)^((0)) = 1$, $p_(i j)^((0)) = 0$ for $i != j$.
  ]
  #thm(name: "Chapman-Kolmogorov")[
    For all $i, j in S$ and all $m, n >= 0$,
    $ p_(i j)^((m+n)) = sum_k p_(i k)^((m)) p_(k j)^((n)). $
    In matrix form $bb(P)^((m+n)) = bb(P)^((m)) bb(P)^((n))$, hence $bb(P)^((m)) = bb(P)^m$.
  ]
  #pf[
    The Markov property at time $m$ yields
    $ P(X_(m+n) = j | X_0 = i) = sum_k P(X_m = k | X_0 = i) P(X_(m+n) = j | X_m = k). $
  ]
  == Classification of States
  #def(name: "Communication")[
    State $i$ leads to $j$, written $i -> j$, if $p_(i j)^((n)) > 0$ for some $n >= 0$. In particular $i -> i$, since $p_(i i)^((0)) = 1$. The states communicate, denoted by $i <-> j$, if $i -> j$ and $j -> i$.
  ]
  #prop[
    Communication satisfies the following properties:
    - Reflexivity: $i <-> i$
    - Symmetry: $i <-> j$ if and only if $j <-> i$
    - Transitivity: $i <-> j$ and $j <-> k$ imply $i <-> k$
    Therefore communication is an equivalence relation.
  ]
  #def(name: "First Passage")[
    Starting from $X_0 = i$, the first passage time to $j$ is $τ_(i j) = inf{n >= 1: X_n = j}$, with the convention $inf emptyset = +oo$. The first-passage probabilities are
    $ f_(i j)^((n)) = P(τ_(i j) = n | X_0 = i) = P(X_n = j, X_1 != j, ..., X_(n-1) != j | X_0 = i), $
    and $f_(i j) = sum_(n=1)^oo f_(i j)^((n)) = P(τ_(i j) < oo | X_0 = i)$. Thus $1 - f_(i j)$ is the probability of never hitting $j$.
  ]
  #def(name: "Recurrence and Transience")[
    State $i$ is recurrent if $f_(i i) = 1$ and transient if $f_(i i) < 1$. If $i$ is recurrent, the mean return time is
    $ μ_i = E(τ_(i i) | X_0 = i) = sum_(n=1)^oo n f_(i i)^((n)), $
    and $i$ is positive recurrent if $μ_i < oo$ and null recurrent if $μ_i = oo$.
  ]
  #def(name: "Period")[
    The period of $i$ is $d(i) = gcd{n >= 1: p_(i i)^((n)) > 0}$. The state is aperiodic if $d(i) = 1$ and periodic if $d(i) > 1$. Return to $i$ is possible only at multiples of $d(i)$. An aperiodic positive recurrent state is ergodic.
  ]
  #prop[
    For every $i, j in S$ and $n >= 1$,
    $ p_(i j)^((n)) = sum_(ell=1)^n f_(i j)^((ell)) p_(j j)^((n-ell)), $
    while $f_(i j)^((1)) = p_(i j)$ and, for $n >= 2$,
    $ f_(i j)^((n)) = sum_(k != j) p_(i k) f_(k j)^((n-1)). $
  ]
  #thm(name: "Recurrence Criterion")[
    State $i$ is recurrent if and only if $sum_(n=1)^oo p_(i i)^((n)) = oo$, and transient if and only if $sum_(n=1)^oo p_(i i)^((n)) < oo$.
  ]
  #pf[
    Write $P(z) = sum_(n=0)^oo p_(i i)^((n)) z^n$ and $F(z) = sum_(n=1)^oo f_(i i)^((n)) z^n$ for $0 <= z < 1$, so that $p_(i i)^((0)) = 1$ and $f_(i i)^((0)) = 0$. The first-passage convolution gives, for $n >= 1$,
    $ p_(i i)^((n)) = sum_(ell=1)^n f_(i i)^((ell)) p_(i i)^((n-ell)). $
    Multiplying by $z^n$ and summing therefore yields $P(z) - 1 = P(z) F(z)$, hence
    $ P(z) = 1 / (1 - F(z)). $
    As $z arrow.t 1$, monotone convergence gives $F(z) arrow.t f_(i i)$ and $P(z) arrow.t sum_(n=0)^oo p_(i i)^((n))$. Thus $f_(i i) = 1$ if and only if $P(1) = oo$.
  ]
  #re[
    The same sum is the expected number of visits:
    $ sum_(n=1)^oo p_(i i)^((n)) = E(sum_(n=1)^oo I_({X_n = i}) | X_0 = i)=sum_(n=1)^oo E(I_({X_n = i})|X_0 = i). $
  ]
  #thm(name: "Weak Ergodic Theorem")[
    The Cesàro matrices
    $ bb(L)^((n)) = 1/(n+1) sum_(k=0)^n bb(P)^k $
    converge to a limit $bb(L)$ satisfying
    $ bb(P) bb(L) = bb(L) bb(P) = bb(L) = bb(L)^2. $
  ]
  #lem(name: "Hardy-Littlewood")[
    Let $a_n >= 0$ and let $A(z) = sum_(n=0)^oo a_n z^n$ converge for $0 <= z < 1$. Then
    $ lim_(n -> oo) 1/(n+1) sum_(k=0)^n a_k = lim_(z -> 1^-) (1-z) A(z), $
    whenever either side exists in $[0, +oo]$.
  ]
  #thm[
    If $j$ is recurrent, then for every $i in S$,
    $ lim_(n -> oo) 1/(n+1) sum_(k=0)^n p_(i j)^((k)) = f_(i j) / μ_j, $
    with the convention $1/μ_j = 0$ when $μ_j = oo$.
  ]
  #pf[
    Let $P_(i j)(z) = sum_(n=0)^oo p_(i j)^((n)) z^n$ and $F_(i j)(z) = sum_(n=1)^oo f_(i j)^((n)) z^n$. The first-passage convolution yields $P_(i j)(z) = F_(i j)(z) P_(j j)(z)$, and $P_(j j)(z) = 1 / (1 - F_(j j)(z))$, so
    $ P_(i j)(z) = frac(F_(i j)(z), 1 - F_(j j)(z)). $
    Since $j$ is recurrent, $F_(j j)(1) = 1$ and
    $ 1 - F_(j j)(z) = sum_(n=1)^oo f_(j j)^((n)) (1 - z^n) = (1-z) sum_(n=1)^oo f_(j j)^((n)) sum_(k=0)^(n-1) z^k. $
    Therefore $(1-z) / (1 - F_(j j)(z)) -> 1/μ_j$ as $z -> 1^-$, while $F_(i j)(z) -> f_(i j)$. The Hardy-Littlewood lemma converts the Abel limit $(1-z) P_(i j)(z) -> f_(i j) / μ_j$ into the asserted Cesàro limit.
  ]
  #thm[
    If $i$ is recurrent of period $d = d(i)$, then $lim_(n -> oo) p_(i i)^((n d))$ exists and equals $d / μ_i$.
  ]
  #pf[
    The Cesàro theorem gives $1/(N+1) sum_(k=0)^N p_(i i)^((k)) -> 1/μ_i$. The terms $p_(i i)^((k))$ vanish unless $d$ divides $k$. Taking $N = n d$ and using that $lim_n p_(i i)^((n d))$ exists for a recurrent state,
    $ 1/(n d + 1) sum_(m=0)^n p_(i i)^((m d)) = (n+1)/(n d + 1) dot 1/(n+1) sum_(m=0)^n p_(i i)^((m d)). $
    The left side tends to $1/μ_i$ and $(n+1)/(n d + 1) -> 1/d$, so the Cesàro means of $p_(i i)^((m d))$ tend to $d / μ_i$. A convergent sequence has the same limit as its Cesàro means.
  ]
  #cor[
    - $i$ is transient if and only if $sum_n p_(i i)^((n)) < oo$;
    - $i$ is null recurrent if and only if $sum_n p_(i i)^((n)) = oo$ and $p_(i i)^((n)) -> 0$;
    - $i$ is positive recurrent if and only if $limsup_n p_(i i)^((n)) > 0$.
  ]
]
