#import "template.typ": *

#note(
  title: "Partial Differential Equations"
)[
  = Introduction
  == Basic Concepts
  #def(name:"Partial Differential Equation")[
    Let $x = (x_1, dots.c, x_n)$ and let $u = u(x)$ be the unknown function. Write
    $ D u = (u_(x_1), dots.c, u_(x_n)), quad D^k u = (frac(partial^k u, partial x_1^(k_1) dots.c partial x_n^(k_n)))_(k_1 + dots.c + k_n = k). $
    An equation
    $ F(x, u, D u, D^2 u, dots.c, D^N u) = f(x) $
    is a partial differential equation of order $N$, denoted by $G u = f(x)$.
  ]
  #def(name:"Multi-index")[
    A multi-index is $alpha = (alpha_1, dots.c, alpha_n)$ with length $|alpha| = alpha_1 + dots.c + alpha_n$ and
    $ partial^alpha = frac(partial^(|alpha|), partial x_1^(alpha_1) dots.c partial x_n^(alpha_n)). $
  ]
  #def(name:"Homogeneous Equation")[
    The equation $G u = f(x)$ is homogeneous when $f equiv 0$, and nonhomogeneous when $f != 0$.
  ]
  #def(name:"Linear Equation")[
    The equation is linear when $G(a u + b v) = a G u + b G v$ for constants $a, b$. In multi-index form,
    $ sum_(|alpha| <= N) A_alpha (x) partial^alpha u = f(x). $
    Otherwise the equation is nonlinear.
  ]
  #def(name:"Semilinear, Quasilinear, and Fully Nonlinear Equations")[
    The principal part is the collection of terms that contain a derivative of order $N$.
    - The equation is semilinear when the principal part is linear, with coefficients depending only on $x$:
      $ sum_(|alpha| = N) A_alpha (x) partial^alpha u + A_0 (x, u, D u, dots.c, D^(N - 1) u) = f(x). $
    - The equation is quasilinear when it is linear in the derivatives of order $N$, whose coefficients may depend on derivatives of lower order:
      $ sum_(|alpha| = N) A_alpha (x, u, D u, dots.c, D^(N - 1) u) partial^alpha u + A_0 (x, u, D u, dots.c, D^(N - 1) u) = f(x). $
    - The equation is fully nonlinear when a derivative of order $N$ enters nonlinearly.
  ]
  == Typical Equations
  #def(name:"The Wave Equation")[
    Let $a > 0$ and let $Delta = partial_(x_1 x_1) + dots.c + partial_(x_n x_n)$. The wave equation is
    $ u_(t t) - a^2 Delta u = f $
    with initial conditions
    $ u(x, 0) = phi(x), quad u_t (x, 0) = psi(x). $
  ]
  #def(name:"The Heat Equation")[
    Let $a > 0$. The heat equation, also called the diffusion equation, is
    $ u_t - a^2 Delta u = f $
    with initial conditions
    $ u(x, 0) = phi(x). $
  ]
  #def(name:"Laplace's Equation")[
    Laplace's equation is $Delta u = 0$, and a solution of Laplace's equation is harmonic. The equation does not involve time, so there is no initial condition.
  ]
  #def(name:"Boundary Conditions")[
    Let $Gamma = partial Omega$, let $bold(n)$ be the outward unit normal, and let $sigma > 0$. Dirichlet, Neumann, and Robin conditions are respectively given by
    $ lr(u|)_Gamma = g, quad lr(frac(partial u, partial bold(n))|)_Gamma = g, quad lr((frac(partial u, partial bold(n)) + sigma u)|)_Gamma = g. $
  ]

  == Second-Order Linear Equations

  #def(name:"Discriminant and Type")[
    Let $a_11^2 + a_12^2 + a_22^2 != 0$, and let $u = u(x, y)$ satisfy
    $ a_11 u_(x x) + 2 a_12 u_(x y) + a_22 u_(y y) + F(x, y, u, D u) = 0. $
    The discriminant is $Delta = a_12^2 - a_11 a_22$, where
    - $Delta > 0$: the equation is hyperbolic;
    - $Delta = 0$: the equation is parabolic;
    - $Delta < 0$: the equation is elliptic.
  ]
  #re[
  From here on the equation is linear,
  $ L u = a_11 u_(x x) + 2 a_12 u_(x y) + a_22 u_(y y) + b_1 u_x + b_2 u_y + c u = f, $
  with coefficients depending on $(x, y)$. When a change of independent variables $xi = xi(x, y), eta = eta(x, y)$ is invertible near $(x_0, y_0)$, the chain rule gives
  $ u_x = u_xi xi_x + u_eta eta_x, quad u_y = u_xi xi_y + u_eta eta_y, $
  $ u_(x x) = u_(xi xi) xi_x^2 + 2 u_(xi eta) xi_x eta_x + u_(eta eta) eta_x^2 + u_xi xi_(x x) + u_eta eta_(x x), $
  $ u_(x y) = u_(xi xi) xi_x xi_y + u_(xi eta) (xi_x eta_y + xi_y eta_x) + u_(eta eta) eta_x eta_y + u_xi xi_(x y) + u_eta eta_(x y), $
  $ u_(y y) = u_(xi xi) xi_y^2 + 2 u_(xi eta) xi_y eta_y + u_(eta eta) eta_y^2 + u_xi xi_(y y) + u_eta eta_(y y). $
  Substitution produces
  $ overline(a)_(11) u_(xi xi) + 2 overline(a)_(12) u_(xi eta) + overline(a)_(22) u_(eta eta) + overline(b)_1 u_xi + overline(b)_2 u_eta + overline(c) u = overline(f), $
  with $overline(c) = c$, $overline(f) = f$, and
  $ overline(a)_(11) = a_11 xi_x^2 + 2 a_12 xi_x xi_y + a_22 xi_y^2, $
  $ overline(a)_(12) = a_11 xi_x eta_x + a_12 (xi_x eta_y + xi_y eta_x) + a_22 xi_y eta_y, $
  $ overline(a)_(22) = a_11 eta_x^2 + 2 a_12 eta_x eta_y + a_22 eta_y^2, $
  $ overline(b)_1 = a_11 xi_(x x) + 2 a_12 xi_(x y) + a_22 xi_(y y) + b_1 xi_x + b_2 xi_y, $
  $ overline(b)_2 = a_11 eta_(x x) + 2 a_12 eta_(x y) + a_22 eta_(y y) + b_1 eta_x + b_2 eta_y. $
  There is $overline(Delta) = |J|^2 Delta$ with $J = mat(xi_x, xi_y; eta_x, eta_y)$, so the type is invariant.
  ]
  #lem[
    If $phi$ solves the principal equation above and $phi_x^2 + phi_y^2 != 0$, then
    $ a_11 (dif y)^2 - 2 a_12 dif x dif y + a_22 (dif x)^2 = 0. $
  ]
  #prop(name:"Canonical Forms for Constant Coefficients")[
    Suppose $a_(i j)$, $b_j$, and $c$ are constant. A linear change of $(x, y)$ puts the equation in one of the following forms, with constant coefficients on the right-hand side.
    - Hyperbolic (first canonical form): $u_(xi eta) = A u_xi + B u_eta + C u + D$.
    - Hyperbolic (second canonical form): $u_(r r) - u_(s s) = A u_r + B u_s + C u + D$.
    - Parabolic: $u_(eta eta) = A u_xi + B u_eta + C u + D$.
    - Elliptic: $u_(r r) + u_(s s) = A u_r + B u_s + C u + D$.
  ]
  #eg[
    The equation $4 u_(x x) + 5 u_(x y) + u_(y y) + u_x + u_y = 2$ has  $Delta = (5 / 2)^2 - 4 > 0$, so it is hyperbolic. The characteristic equation $4 (dif y)^2 - 5 dif x dif y + (dif x)^2 = 0$ factors as $(4 dif y - dif x)(dif y - dif x) = 0$, with characteristic lines $4 y - x = C_1$ and $y - x = C_2$. Set $xi = 4 y - x$ and $eta = y - x$. Then $overline(a)_(11) = overline(a)_(22) = 0$, $overline(a)_(12) = -9 / 2$, $overline(b)_1 = 3$, and $overline(b)_2 = 0$, so $-9 u_(xi eta) + 3 u_xi = 2$, that is
    $ u_(xi eta) = frac(1, 3) u_xi - frac(2, 9). $
    Writing $w = u_xi$ gives $w_eta - w / 3 = -2 / 9$. Multiplication by $e^(-eta / 3)$ produces $w = 2 / 3 + F(xi) e^(eta / 3)$, and one further integration gives
    $ u(x, y) = frac(2, 3) (4 y - x) + f(4 y - x) e^((y - x) / 3) + g(y - x). $
  ]
  #eg[
    The equation $u_(x x) - 4 u_(x y) + 4 u_(y y) = e^y$ has $Delta = 2^2 - 4 = 0$, so it is parabolic. The characteristic equation $(dif y + 2 dif x)^2 = 0$ has the lines $y + 2 x = C$. Set $xi = y + 2 x$ and $eta = y$. Then $overline(a)_(11) = overline(a)_(12) = 0$, $overline(a)_(22) = 4$, and the lower-order coefficients coming from $xi$ and $eta$ vanish, so
    $ u_(eta eta) = frac(1, 4) e^eta. $
    Two integrations give $u = 1/4 e^eta + eta f(xi) + g(xi)$, hence
    $ u(x, y) = frac(1, 4) e^y + y f(y + 2 x) + g(y + 2 x). $
  ]
  #eg[
    The equation $u_(x x) + u_(x y) + u_(y y) + u_x = 0$ has $a_12 = 1 / 2$ and $Delta = (1 / 2)^2 - 1 < 0$, so it is elliptic. The characteristic equation $dif y^2 - dif x dif y + dif x^2 = 0$ has roots
    $ (dif y)/(dif x) = frac(1, 2) plus.minus frac(sqrt(3), 2)i. $
    Set $xi = y - x / 2$ and $eta = -sqrt(3) / 2 x$. Then
    $ overline(a)_(11) = overline(a)_(22) = frac(3, 4), quad overline(a)_(12) = 0, quad overline(b)_1 = -frac(1, 2), quad overline(b)_2 = -frac(sqrt(3), 2), $
    and the equation becomes
    $ u_(xi xi) + u_(eta eta) = frac(2, 3) u_xi + frac(2, sqrt(3)) u_eta. $
  ]
  #eg[
    The equation $y^2 u_(x x) - x^2 u_(y y) = 0$ has $Delta = x^2 y^2$, so it is hyperbolic off the coordinate axes. The characteristic equation $y^2 (dif y)^2 - x^2 (dif x)^2 = 0$ factors as $(y dif y + x dif x)(y dif y - x dif x) = 0$, with integrals
    $ frac(1, 2) y^2 - frac(1, 2) x^2 = C_1, quad frac(1, 2) y^2 + frac(1, 2) x^2 = C_2. $
    Set $xi = (y^2 - x^2) / 2$ and $eta = (y^2 + x^2) / 2$. Then, wherever $|xi| != |eta|$,
    $ u_(xi eta) = frac(eta, 2 (xi^2 - eta^2)) u_xi - frac(xi, 2 (xi^2 - eta^2)) u_eta. $
  ]
  #eg[
    The equation $x^2 u_(x x) + 2 x y u_(x y) + y^2 u_(y y) + x y u_x + y^2 u_y = 0$ has $Delta = 0$, so it is parabolic. The characteristic equation $(x dif y - y dif x)^2 = 0$ has the lines $y / x = C$. Set $xi = y / x$ and $eta = y$. Then $u_(eta eta) = - u_eta$. Writing $w = u_eta$ and integrating twice gives
    $ u(x, y) = - e^(-y) f(y / x) + g(y / x). $
  ]
  #eg[
    The equation $u_(x x) + x^2 u_(y y) = 0$ has $Delta = - x^2$, so it is elliptic off the axis $x = 0$. The characteristic equation $((dif y) / (dif x))^2 = - x^2$ has complex integrals $2 y plus.minus i x^2 = C$. Set $xi = 2 y$ and $eta = x^2$. Then, for $eta != 0$,
    $ u_(xi xi) + u_(eta eta) = - frac(1, 2 eta) u_eta. $
  ]
  #prop(name: "Reduced Canonical Forms")[
    For constant coefficients, first-order terms may be removed by the exponential substitution $u = v e^(a r + b s)$. Starting from the first canonical forms and choosing the right $a$ and $b$, this produces the reduced forms
    $ v_(r s) = E v + F, quad v_(r r) plus.minus v_(s s) = E v + F. $
  ]
  #def(name: "Second-Order Linear Operator")[
    For $x = (x_1, dots.c, x_n)$ and a symmetric matrix $A = (a_(i j))$,
    $ L u = sum_(i, j = 1)^n a_(i j) u_(x_i x_j) + sum_(j = 1)^n b_j u_(x_j) + c u = f. $
    The type at a point is read from the eigenvalues $lambda_1, dots.c, lambda_n$ of $A$.
  ]
  #def(name: "Types in Several Variables")[
    Let $lambda_1, dots.c, lambda_n$ be the eigenvalues of $A$.
    - Hyperbolic: every $lambda_i$ is nonzero, $n - 1$ of them have the same sign, and one has the opposite sign.
    - Parabolic: exactly one eigenvalue is zero and the others have the same sign.
    - Elliptic: every $lambda_i$ is nonzero and all have the same sign.
    - Ultrahyperbolic: for $n >= 4$, every $lambda_i$ is nonzero, at least two are positive, and at least two are negative.
    - Ultraparabolic: more than one eigenvalue is zero and the remaining eigenvalues have the same sign.
  ]

  == Characteristics

  #def(name: "Characteristic Direction")[
    At a fixed point $x$, a direction $bold(l) = (alpha_1, dots.c, alpha_n)$ is a characteristic direction if it satisfies the characteristic equation
    $ sum_(i, j = 1)^n a_(i j)(x) alpha_i alpha_j = 0. $
  ]
  #def(name: "Characteristic Surface")[
    The hypersurface $S:phi(x)=0$ is a characteristic surface if at every point of $S$ the normal $(phi_(x_1), dots.c, phi_(x_n))$ is a characteristic direction, namely
    $ sum_(i, j = 1)^n a_(i j)(x) phi_(x_i) phi_(x_j) = 0. $
  ]
  #re[
    To find characteristic surfaces, solve the first-order equation above for $phi$. When $n = 2$, along $phi = C$ one has $phi_x dif x + phi_y dif y = 0$, hence $(dif y) / (dif x) = - (phi_x) / (phi_y)$. Substituting the normal $(phi_x, phi_y)$ into the characteristic equation gives the ODE
    $ a_11 (dif y)^2 - 2 a_12 dif x dif y + a_22 (dif x)^2 = 0 $
    used to reduce the two-variable equation to canonical form. In two variables a characteristic surface is a characteristic curve.
  ]
  #def(name: "Characteristic Plane")[
    A characteristic plane is an $(n-1)$-dimensional hyperplane whose normal is a characteristic direction. Through a point $overline(x)$ with characteristic direction $(alpha_1, dots.c, alpha_n)$ it is
    $ sum_(i = 1)^n alpha_i (x_i - overline(x)_i) = 0. $
  ]
  #def(name: "Characteristic Cone")[
    The characteristic cone at a fixed point $overline(x)$ is the cone formed by the envelope of all characteristic planes through $overline(x)$.
  ]
  #re[
    If the characteristic planes through $overline(x)$ form a family $F(x, lambda) = 0$, the envelope is obtained by eliminating the parameters $lambda$ from $F = 0$ and the equations obtained by differentiating $F$ with respect to each parameter. Away from the vertex, the cone is itself a characteristic surface.
  ]
  #eg[
    For Laplace's equation $Delta u = 0$, the characteristic equation is $alpha_1^2 + dots.c + alpha_n^2 = 0$. There is no real characteristic direction, hence no real characteristic surface.
  ]
  #eg[
    For the heat equation $u_t = a^2 (u_(x x) + u_(y y) + u_(z z))$, write $bold(l) = (alpha_0, alpha_1, alpha_2, alpha_3)$ with $|bold(l)| = 1$. The principal part involves only the spatial second derivatives, so the characteristic equation is $alpha_1^2 + alpha_2^2 + alpha_3^2 = 0$. Together with $|bold(l)| = 1$ this forces $alpha_0 = plus.minus 1$ and $alpha_1 = alpha_2 = alpha_3 = 0$. The characteristic directions are $bold(l) = (plus.minus 1, 0, 0, 0)$, and the characteristic planes are $t = "const"$. Through a given point there is only one such plane, so the characteristic cone degenerates to that plane.
  ]
  #eg[
    For the wave equation $u_(t t) = a^2 (u_(x x) + u_(y y))$, the characteristic equation $alpha_0^2 = a^2 (alpha_1^2 + alpha_2^2)$ together with $|bold(l)| = 1$ gives
    $ alpha_0 = plus.minus frac(a, sqrt(1 + a^2)), quad alpha_1^2 + alpha_2^2 = frac(1, 1 + a^2). $
    Parameterizing the spatial part yields the characteristic directions
    $ bold(l) = lr((plus.minus frac(a, sqrt(1 + a^2)), frac(cos phi, sqrt(1 + a^2)), frac(sin phi, sqrt(1 + a^2)))). $
    If $theta$ is the angle between $bold(l)$ and the $t$-axis, then $tan theta = 1 \/ a$. Scaling the normal, the characteristic planes through $(t_0, x_0, y_0)$ are
    $ a (t - t_0) + cos phi dot (x - x_0) + sin phi dot (y - y_0) = 0. $
    Differentiating with respect to $phi$ yields $- sin phi dot (x - x_0) + cos phi dot (y - y_0) = 0$. Squaring and adding these two equations eliminates $phi$ and produces the characteristic cone
    $ (x - x_0)^2 + (y - y_0)^2 = a^2 (t - t_0)^2. $
  ]

  = Wave Equations
  == First-Order Wave Equations
  #thm(name: "d'Alembert's Formula")[
    If $phi in C^2 (RR)$ and $psi in C^1 (RR)$, the Cauchy problem
    $ u_(t t) - a^2 u_(x x) = 0, quad u(x, 0) = phi(x), quad u_t (x, 0) = psi(x) $
    has a unique classical solution
    $ u(x, t) = frac(phi(x - a t) + phi(x + a t), 2) + frac(1, 2 a) integral_(x - a t)^(x + a t) psi(y) dif y. $
    The solution depends continuously on the initial data: if $norm(phi_1 - phi_2)_oo < epsilon$ and $norm(psi_1 - psi_2)_oo < epsilon$, then
    $ norm(u_1 (dot, t) - u_2 (dot, t))_oo <= epsilon (1 + t). $
  ]
  #eg[
    For $u_(t t) - u_(x x) = 0$ with $phi(x) = 1 / (1 + x^2)$ and $psi = 0$,
    $ u(x, t) = frac(1, 2) lr((frac(1, 1 + (x + t)^2) + frac(1, 1 + (x - t)^2))), quad lim_(t -> +oo) u(x, t) = 0. $
  ]
  #eg[
    For $u_(t t) - u_(x x) = 0$ with $phi = 0$ and $psi(x) = 2 / (1 + x^2)$,
    $ u(x, t) = arctan(x + t) - arctan(x - t), quad lim_(t -> +oo) u(x, t) = pi. $
  ]
  #prop(name: "Invariance")[
    If $u$ solves the homogeneous equation, then so do $u(x - y, t)$ for fixed $y$, the space and time reversals of $u$, the rescaling $u(k x, k t)$, every derivative of $u$, and the convolution $integral_a^b S(x - y, t) g(y) dif y$ whenever $S$ is a solution. Linear combinations of solutions are solutions. Odd, even, or periodic initial data produce solutions with the same symmetry in $x$.
  ]
  #prop(name: "Maximum Absolute Value")[
    $ abs(u(x, t)) <= M_phi + frac(1, 2 a) I_psi, $
    where $M_phi = norm(phi)_oo$ and $I_psi = max_(alpha, beta) abs(integral_alpha^beta psi(y) dif y)$.
  ]
  #def(name: "Interval of Dependence")[
    The value $u(x_0, t_0)$ is determined by the initial data on the interval of dependence $[x_0 - a t_0, x_0 + a t_0]$, the base of the characteristic triangle with vertex $(x_0, t_0)$.
  ]
  #def(name: "Domain of Determination")[
    Initial data on $[x_1, x_2]$ determine the solution throughout the domain of determination ${x_1 + a t <= x <= x_2 - a t}$.
  ]
  #def(name: "Domain of Influence")[
    A change of the data at $x_0$ affects the solution only in the domain of influence ${x_0 - a t <= x <= x_0 + a t}$. A change of the data on $[x_1, x_2]$ affects the solution only in ${x_1 - a t <= x <= x_2 + a t}$.
  ]
  #eg[
    On the half-line, consider
    $ u_(t t) - a^2 u_(x x) = 0 quad (x > 0, t > 0), $
    with $u(x, 0) = phi(x)$, $u_t (x, 0) = psi(x)$, and $u(0, t) = 0$. Extend $phi$ and $psi$ oddly to $RR$ and solve the Cauchy problem on the line. Restricting to $x >= 0$ yields d'Alembert's formula for $x >= a t$, and
    $ u(x, t) = frac(- phi(a t - x) + phi(x + a t), 2) + frac(1, 2 a) integral_(a t - x)^(x + a t) psi(y) dif y $
    for $0 < x <= a t$. The same extension argument with even data treats the Neumann condition $u_x (0, t) = 0$.
  ]
  #re[
    Equivalently, write $u = F(x - a t) + G(x + a t)$ and determine $F$ and $G$ from the initial conditions when $x >= a t$, then from the boundary condition together with the values on $x = a t$ when $0 < x <= a t$.
  ]
  #eg[
    Let $k > 1$ and $f(0) = h(0)$. For $u_(t t) - u_(x x) = 0$ in $0 < t < k x$, with $u(x, 0) = f(x)$, $u_t (x, 0) = g(x)$, and $u = h$ on $t = k x$, d'Alembert's formula holds for $x >= t$. In the region $x <= t <= k x$ the backward characteristic $x - t = "const"$ meets $t = k x$ rather than $t = 0$. Set $lambda = (1 + k) / (1 - k)$. Then
    $ u(x, t) = h lr((frac(x - t, 1 - k))) + frac(1, 2) lr([f(x + t) - f(lambda (x - t))]) + frac(1, 2) integral_(lambda (x - t))^(x + t) g(y) dif y. $
  ]
  #thm(name: "Duhamel's Principle")[
    Let $w(x, t; tau)$ solve
    $ w_(t t) - a^2 w_(x x) = 0 quad (t > tau), quad w(x, tau) = 0, quad w_t (x, tau) = f(x, tau). $
    Then $u_2 (x, t) = integral_0^t w(x, t; tau) dif tau$ solves
    $ u_(t t) - a^2 u_(x x) = f(x, t), quad u(x, 0) = 0, quad u_t (x, 0) = 0. $
  ]
  #re[
    The integrand $w(dot, t; tau) dif tau$ is the wave produced by an impulse $f(dot, tau) dif tau$ in the velocity at time $tau$.
  ]
  #thm[
    If $phi in C^2 (RR)$, $psi in C^1 (RR)$, and $f$ is $C^1$, the Cauchy problem $u_(t t) - a^2 u_(x x) = f$ with data $phi$, $psi$ has the solution
    $ u(x, t) = frac(phi(x - a t) + phi(x + a t), 2) + frac(1, 2 a) integral_(x - a t)^(x + a t) psi(y) dif y \
      + frac(1, 2 a) integral_0^t integral_(x - a (t - tau))^(x + a (t - tau)) f(y, tau) dif y dif tau. $
    The double integral is the integral of $f$ over the characteristic triangle $G$ with vertex $(x, t)$ and base $[x - a t, x + a t]$.
  ]

  == Higher-Order Wave Equations
  #def(name: "Spherical Mean")[
    For $h$ on $RR^3$, the spherical mean on the sphere $|y - x| = r$ is
    $ overline(h)(x, r) = frac(1, 4 pi r^2) integral.double_(abs(y - x) = r) h(y) dif S_y = frac(1, 4 pi) integral.double_(abs(alpha) = 1) h(x + r alpha) dif omega. $
  ]
  #thm(name: "Kirchhoff's Formula")[
    If $phi in C^3 (RR^3)$ and $psi in C^2 (RR^3)$, the Cauchy problem $u_(t t) - a^2 Delta u = 0$ in $RR^3$ has a unique $C^2$ solution
    $ u(x, t) &= partial/(partial t) lr((t overline(phi)(x, a t))) + t overline(psi)(x, a t) \
      &= partial/(partial t) lr((frac(1, 4 pi a^2 t) integral.double_(abs(y - x) = a t) phi(y) dif S)) + frac(1, 4 pi a^2 t) integral.double_(abs(y - x) = a t) psi(y) dif S \
      &=frac(1, 4 pi a^2 t^2) integral.double_(abs(y - x) = a t) lr((phi(y) + nabla phi(y) dot (y - x) + t psi(y))) dif S. $
    In polar coordinates,
    $ u(x, t)
      &= partial/(partial t) lr((frac(t, 4 pi) integral_0^(2 pi) integral_0^pi phi(x_1 + a t sin theta cos phi, x_2 + a t sin theta sin phi, x_3 + a t cos theta) sin theta dif theta dif phi)) \
      &wide + frac(t, 4 pi) integral_0^(2 pi) integral_0^pi psi(x_1 + a t sin theta cos phi, x_2 + a t sin theta sin phi, x_3 + a t cos theta) sin theta dif theta dif phi. $
  ]
  #thm(name: "Poisson's Formula")[
    If $phi in C^3 (RR^2)$ and $psi in C^2 (RR^2)$, the Cauchy problem in $RR^2$ has a unique $C^2$ solution
    $ u(x, t) &= frac(1, 2 pi a) partial/(partial t) integral.double_(abs(y - x) <= a t) frac(phi(y), sqrt(a^2 t^2 - abs(y - x)^2)) dif y \
      &wide + frac(1, 2 pi a) integral.double_(abs(y - x) <= a t) frac(psi(y), sqrt(a^2 t^2 - abs(y - x)^2)) dif y. $
    In polar coordinates,
    $ u(x_1, x_2, t)
      &= frac(1, 2 pi a) partial/(partial t) integral_0^(a t) integral_0^(2 pi) frac(phi(x_1 + r cos theta, x_2 + r sin theta), sqrt(a^2 t^2 - r^2)) r dif theta dif r \
      &wide + frac(1, 2 pi a) integral_0^(a t) integral_0^(2 pi) frac(psi(x_1 + r cos theta, x_2 + r sin theta), sqrt(a^2 t^2 - r^2)) r dif theta dif r. $
  ]
  #re[
    On the disk $|y - x| <= R$ in $RR^2$, write $y = x + r (cos theta, sin theta)$ and $R = a t$. The angular integrals are
    $ integral_0^(2 pi) dif theta = 2 pi, quad integral_0^(2 pi) cos theta dif theta = integral_0^(2 pi) sin theta dif theta = integral_0^(2 pi) cos theta sin theta dif theta = 0, $
    $ integral_0^(2 pi) cos^2 theta dif theta = integral_0^(2 pi) sin^2 theta dif theta = pi. $
    The substitution $r = R sin beta$ gives
    $ integral_0^R frac(r^(2 k + 1), sqrt(R^2 - r^2)) dif r = R^(2 k + 1) integral_0^(pi / 2) sin^(2 k + 1) beta dif beta = ((2k)!!)/((2k+1)!!) R^(2k+1), $
    in particular
    $ integral_0^R frac(r, sqrt(R^2 - r^2)) dif r = R, quad integral_0^R frac(r^3, sqrt(R^2 - r^2)) dif r = frac(2, 3) R^3, quad integral_0^R frac(r^5, sqrt(R^2 - r^2)) dif r = frac(8, 15) R^5. $
  ]
  #re[
    If $phi$ and $psi$ are polynomials, or more generally if $Delta^m phi = Delta^m psi = 0$ for some $m$, both Kirchhoff's and Poisson's formula collapse to the finite sum
    $ u(x, t) = sum_(k = 0)^oo lr(( frac((a t)^(2 k), (2 k)!) Delta^k phi(x) + frac(a^(2 k) t^(2 k + 1), (2 k + 1)!) Delta^k psi(x) )). $
    The same series solves $u_(t t) - a^2 Delta u = 0$ in every dimension. In particular, when $deg phi, deg psi <= 3$, there is $ u = phi + t psi + frac(a^2 t^2, 2) Delta phi + frac(a^2 t^3, 6) Delta psi. $
  ]
  #thm(name: "Decay")[
    Let $n = 3$, and suppose $phi in C_0^1 (RR^3)$ and $psi in C_0 (RR^3)$ vanish outside $overline(B)(0, rho)$ and are bounded together with $nabla phi$. Then $abs(u(x, t)) <= C t^(-1)$ for $t >= 1$, uniformly in $x$. In general,
    $ abs(u(x, t)) <= C (1 + t)^(-(n - 1) / 2). $
  ]
  #thm(name: "Retarded Potentials")[
    In three dimensions,
    $ u_2 (x, t) = frac(1, 4 pi a^2) integral.triple_(abs(y - x) <= a t) frac(f(y, t - abs(y - x) / a), abs(y - x)) dif y. $
    In two dimensions,
    $ u_2 (x, t) = frac(1, 2 pi a) integral_0^t integral.double_(abs(y - x) <= a (t - tau)) frac(f(y, tau), sqrt(a^2 (t - tau)^2 - abs(y - x)^2)) dif y dif tau. $
  ]
]
