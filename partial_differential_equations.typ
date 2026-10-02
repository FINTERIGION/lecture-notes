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
  ]
  #lem[
    If $phi$ solves the principal equation above and $phi_x^2 + phi_y^2 != 0$, then
    $ a_11 (dif y)^2 - 2 a_12 dif x dif y + a_22 (dif x)^2 = 0. $
  ]
  #pf[
    Along $phi = C$ one has $phi_x dif x + phi_y dif y = 0$. The slope is $dif y \/ dif x = -phi_x \/ phi_y$. Then substitute $phi_x \/ phi_y = -dif y \/ dif x$ into the equation.
  ]
  #prop(name:"Canonical Forms for Constant Coefficients")[
    Suppose $a_(i j)$, $b_j$, and $c$ are constant. A linear change of $(x, y)$ puts the equation in one of the following forms, with constant coefficients on the right-hand side.
    - Hyperbolic, first canonical form: $u_(xi eta) = A u_xi + B u_eta + C u + D$.
    - Hyperbolic, second canonical form: $u_(r r) - u_(s s) = A^* u_r + B^* u_s + C^* u + D^*$.
    - Parabolic: $u_(eta eta) = A u_xi + B u_eta + C u + D$.
    - Elliptic: $u_(r r) + u_(s s) = A u_r + B u_s + C u + D$.
  ]
  #eg[
    The equation $4 u_(x x) + 5 u_(x y) + u_(y y) + u_x + u_y = 2$ has  $Delta = (5 \/ 2)^2 - 4 > 0$, so it is hyperbolic. The characteristic equation $4 (dif y)^2 - 5 dif x dif y + (dif x)^2 = 0$ factors as $(4 dif y - dif x)(dif y - dif x) = 0$, with characteristic lines $4 y - x = C_1$ and $y - x = C_2$. Set $xi = 4 y - x$ and $eta = y - x$. Then $overline(a)_(11) = overline(a)_(22) = 0$, $overline(a)_(12) = -9 \/ 2$, $overline(b)_1 = 3$, and $overline(b)_2 = 0$, so $-9 u_(xi eta) + 3 u_xi = 2$, that is
    $ u_(xi eta) = frac(1, 3) u_xi - frac(2, 9). $
    Writing $w = u_xi$ gives $w_eta - w \/ 3 = -2 \/ 9$. Multiplication by $e^(-eta \/ 3)$ produces $w = 2 \/ 3 + F(xi) e^(eta \/ 3)$, and one further integration gives
    $ u(x, y) = frac(2, 3) (4 y - x) + f(4 y - x) e^((y - x) / 3) + g(y - x). $
  ]
  #eg[
    The equation $u_(x x) - 4 u_(x y) + 4 u_(y y) = e^y$ has $Delta = 2^2 - 4 = 0$, so it is parabolic. The characteristic equation $(dif y + 2 dif x)^2 = 0$ has the lines $y + 2 x = C$. Set $xi = y + 2 x$ and $eta = y$. Then $overline(a)_(11) = overline(a)_(12) = 0$, $overline(a)_(22) = 4$, and the lower-order coefficients coming from $xi$ and $eta$ vanish, so
    $ u_(eta eta) = frac(1, 4) e^eta. $
    Two integrations give $u = (1 \/ 4) e^eta + eta f(xi) + g(xi)$, hence
    $ u(x, y) = frac(1, 4) e^y + y f(y + 2 x) + g(y + 2 x). $
  ]
  #eg[
    The equation $u_(x x) + u_(x y) + u_(y y) + u_x = 0$ has $a_12 = 1 \/ 2$ and $Delta = (1 \/ 2)^2 - 1 < 0$, so it is elliptic. The characteristic equation $dif y^2 - dif x dif y + dif x^2 = 0$ has roots
    $ lambda_(1\, 2) = frac(1, 2) plus.minus i frac(sqrt(3), 2). $
    Set $xi = y - x \/ 2$ and $eta = -(sqrt(3) \/ 2) x$. Then
    $ overline(a)_(11) = overline(a)_(22) = frac(3, 4), quad overline(a)_(12) = 0, quad overline(b)_1 = -frac(1, 2), quad overline(b)_2 = -frac(sqrt(3), 2), $
    and the equation becomes
    $ u_(xi xi) + u_(eta eta) = frac(2, 3) u_xi + frac(2, sqrt(3)) u_eta. $
  ]
]
