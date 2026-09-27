#import "template.typ": *

#note(
  title: "Mathematical Analysis III",
  author: "Yuchao Feng"
)[
  = Metric Space and its Properties
  == Metric Space
  #def(name:"Metric Space")[
    If $X$ is a set, and for any $x,y in X$, there is $d(x,y)$ that satisfies
    - $d(x,y)>=0$ and $d(x,y)=0 <=> x=y$;
    - $d(x,y)=d(y,x)$;
    - $forall z in X, d(x,y)<=d(x,z)+d(y,z)$;
    then $d(x,y)$ is called a metric on $X$, and $(X,d)$ is called a metric space.
  ]
  #def(name:"Normed Linear Space")[
    If $X$ is a linear space on $KK$ ($RR$ or $CC$), and for any $x in X$, there is a real number $||x||$ that satisfies
    - $||x||>=0$ and $||x||=0 <=> x=0$;
    - $forall k in KK, ||k x||=|k|dot||x||$;
    - $forall y in X, ||x+y||<=||x||+||y||$;
    then $||dot||$ is called a norm on $X$, and $(X,||dot||)$ is called a normed linear space.
  ]
  #re[
    A norm can induce a metric but the otherwise cannot.\
    For example, $d(x,y)=(|x-y|)/(1+|x-y|)$ is a metric but not a norm on $RR$.
  ]
  #def(name:"Open Set and Closed Set")[
    Let $(X,d)$ be a metric space and $E subset X$, then
    - $N(x,r)={y in X|d(x,y)<r}$ is called the $r-$neighborhood of $x$;
    - $x in E$ is called an interior point of $E$, if $exists r>0, N(x,r) subset E$;
    - $E$ is called an open set, if every $x in E$ is an interior point;
    - $x in E$ is called a limit point of $E$, if $forall r>0, N(x,r) inter E\\{x}!= emptyset$;
    - $E^'$ is called the derived set of $E$, which is the set of all limit points of $E$;
    - $E$ is called a closed set if $E^' subset E$.
  ]
  #thm[
    If $x$ is a limit point of $E$, then $forall r>0, N(x,r) inter E$ has infinite points.
  ]
  #thm[
    $E$ is an open set if and only if $E^c$ is a closed set.
  ]
  #thm(name:"De Morgan")[
    Let $E_alpha (alpha in Lambda)$ be a family of sets, then
    $ (union.big_(alpha in Lambda)E_alpha)^c = inter.big_(alpha in Lambda)E_alpha^c; (inter.big_(alpha in Lambda)E_alpha)^c = union.big_(alpha in Lambda)E_alpha^c. $
  ]
  #thm[
    Let $G_alpha,F_alpha$ be a family of open sets and closed sets separately, then
    - $union.big G_alpha$ is an open set;
    - $inter.big_(k=1)^n G_k$ is an open set;
    - $inter.big F_alpha$ is a closed set;
    - $union.big_(k=1)^n F_k$ is a closed set.
  ]
  #def(name:"Closure")[
    Let $(X,d)$ be a metric space and $E subset X$, then $overline(E)=E^' union E$ is called the closure of $E$.
  ]
  #thm[
    - $overline(E)$ is a closed set;
    - $E=overline(E)$ if and only if $E$ is a closed set;
    - If $F$ is a closed set and $E subset F subset X$, then $overline(E) subset F$.
  ]
  #thm[
    Let $Y subset X$, then $E$ is an open set in $Y$ if and only if there is an open set $G in X$, such that $E=Y inter G$.
  ]
  == Real Number Field
  #def(name:"Ordered Set")[
    Let $S$ be a set, if a relation "$<$" on $S$ satisfies
    - if $x,y in S$, then only one statement in $x<y,y<x,x=y$ holds;
    - for any $x,y,z in S$, if $x<y,y<z$, then $x<z$;
    then the relation is called an order on $S$, and $S$ is called an ordered set.
  ]
  #def(name:"Upper Bound")[
    Let $S$ be an ordered set and $E subset S$. If there is $beta in S$, such that $forall x in E, x<=beta$, then $beta$ is called the upper bound of $E$.
  ]
  #def(name:"Supremum")[
    Let $S$ be an ordered set and $E subset S$. If there is $alpha in S$, such that
    - $alpha$ is an upper bound of $E$;
    - if $gamma<alpha$, then $gamma$ is not an upper bound of $E$;
    then $alpha$ is called the supremum of $E$, denoted by $alpha=sup E$.
  ]
  #thm[
    Let $S$ be an ordered set and $forall E subset S, exists sup E => sup E in S$, then $forall E in S, exists inf E => inf E in S$.
  ]
  #re[
    There is order structure, field structure, and topology structure on the real number field, where field structure is skipped in class.
  ]
  == Topological Space
  #def(name:"Topological Space")[
    Let $X$ be a set, and $tau$ is a family of subsets of $X$ that satisfies
    - $emptyset in tau, X in tau$;
    - if $U_alpha in tau$, then $union.big U_alpha in tau$;
    - if $U_i in tau$, then $inter.big_(i=1)^n U_i in tau$;
    then $tau$ is called a topology on $X$, and $(X,tau)$ is called a topological space.
  ]
  #def(name:"Open Set and Closed Set in Topological Space")[
    Let $(X,tau)$ be a topological space, then
    - $E in tau$ is called an open set;
    - $X\\E$ is called a closed set;
    - the open set $E$ that contains $x in X$ is called the neighborhood of $x$.
  ]
  #def(name:"Topological Basis")[
    Let $(X,tau)$ be a topological space, if a family of open sets $sigma.alt$ satisfies that any set $G in tau$ can be represented by the union of some open sets in $sigma.alt$, then $sigma.alt$ is called the topological basis of $tau$.
  ]
  #def(name:"Hausdorff Topological Space")[
    Let $(X,tau)$ be a topological space, where any two different points have disjoint neighborhoods, then $(X,tau)$ is called a _Hausdorff_ topological space.
  ]
  #re[
    Topological spaces induced by metric spaces are all _Hausdorff_ topological spaces.
  ]
  == Space Properties
  #def(name:"Compact Set")[
    Let $(X,tau)$ be a topological space and $K subset X$, if any open cover of $K$ has a finite sub-cover of $K$, then $K$ is called a compact set.\
    Specially, if $K=X$, then $(X,tau)$ is called a compact topological space.
  ]
  #re[
    A set $K$ is a compact set whatever the topological space $(X,tau)$ exactly is.
  ]
  #thm[
    - Compact sets in a _Hausdorff_ topological space are all closed sets.
    - Closed subsets of a compact topological space are all compact sets.
  ]
  #re[
    Closed sets are not necessarily compact sets.\
    For example, we define $d(f_1,f_2)=(integral_(-pi)^pi |f_1(x)-f_2(x)|^2)^(1/2)$ on $C[-pi,pi]$, then $E={sin k x}_(k=1)^(+oo)$ is a bounded closed set but not a compact set.
  ]
  #thm(name:"Nested Compact Set")[
    Let $K_1 supset K_2 supset dots.c$ be compact sets in a _Hausdorff_ topological space, then $inter.big_(n=1)^(+oo) K_n != emptyset$.
  ]
  #thm[
    Let $K$ be a compact set in $(X,d)$, and $E$ is an infinite subset of $K$, then $E$ has a limit point in $K$.
  ]
  #thm(name:"Heine-Borel")[
    Let $E subset RR^n$, then the statements below are equivalent:
    - $E$ is a bounded closed set;
    - $E$ is a compact set;
    - $E$ is a sequentially compact set, namely any subset of $E$ with infinite points has a limit point in $E$.
  ]
  #def(name:"Connected Topological Space")[
    Let $(X,tau)$ be a topological space and $A,B subset X$, if $overline(A) inter B=emptyset, A inter overline(B)=emptyset$, then $A$ and $B$ are called separated. If $X$ cannot be divided into two separated subsets, then $(X,tau)$ is called a topological space.
  ]
  #thm[
    Let $E$ be a subset of $RR$, then $E$ is connected if and only if $forall x,y in E, z in (x,y) => z in E$.
  ]
  #def(name:"Cauchy Sequence")[
    Let ${x_n}$ be a sequence in a metric space $(X,d)$, if $forall epsilon>0, exists N in NN$, such that when $n,m>N$, there is $d(x_n,x_m)<epsilon$, then ${x_n}$ is called a _Cauchy_ sequence in $(X,d)$.
  ]
  #def(name:"Limit")[
    Let ${x_n}$ be a sequence in a metric space $(X,d)$ and $a in X$, if $forall epsilon>0, exists N in NN$, such that when $n>N$, there is $d(x_n,a)<epsilon$, then $a$ is called the limit of ${x_n}$.
  ]
  #def(name:"Complete Metric Space")[
    If every _Cauchy_ sequence in a metric space $(X,d)$ has a limit, then $(X,d)$ is called a complete metric space.
  ]
  #re[
    $(cal(R)[a,b], d(f,g)=integral_a^b |f(x)-g(x)|dif x)$ is not a complete metric space.
    
    $(C[a,b], d(f,g)=integral_a^b |f(x)-g(x)|dif x)$ is not a complete metric space, but
    $(C[a,b], d(f,g)=max|f(x)-g(x)|)$ is a complete metric space.
    
    $(RR^oo, d_p (x,y)=(sum|x_k-y_k|^p)^(1/p))$ is a complete metric space for $p>=1$.
  ]
  #thm[
    Every compact metric space is a complete metric space.
  ]
  #def(name:"Completion Space")[
    Let $(X,d)$ be a metric subspace of a complete metric space $(Y,d)$, if $X subset Y$ is dense everywhere in $Y$, namely $forall y in Y, forall epsilon>0, exists x in X$, such that $d(x,y)<epsilon$, then $(Y,d)$ is called the completion space of $(X,d)$.
  ]
  #thm[
    Every metric space has a completion space, which is unique up to isometry.
  ]
  #thm[
    Let $K_1 supset K_2 supset dots.c$ be a sequence of non-empty closed sets in a metric space $(X,d)$, and $sup{d(x,y)|x,y in K_n}->0$, then $(X,d)$ is a complete metric space if and only if there is a unique point ${x}=inter.big K_n$.
  ]
  #def(name:"Complete Set")[
    A set $E$ is called a complete set when $E=E^'$.
  ]
  #thm[
    Let $P$ be a non-empty complete set on $RR^k$, then $P$ is an uncountable set.
  ]
  #def(name:"Cantor Set")[
    Let $E_0=[0,1], E_1=[0,1]\\(1/3,2/3)$, then divide the two closed intervals of $E_1$ into three equal parts and remove the open interval in the middle to obtain $E_2$ ... Finally, we let $P=inter.big E_n$, which is called the _Cantor_ set.
  ]
  #re[
    The _Cantor_ set $P$ has many properties:
    - $P$ is a compact set;
    - $P$ is a complete set;
    - $P$ is an uncountable set;
    - $P$ contains no open intervals;
    - the measure of $P$ is $0$.
  ]
  = Map on Metric Space
  == Sequence on Metric Space
  #def(name:"Partial Limit")[
    Let ${x_n}$ be a sequence on $(X,d)$, if $n_1<n_2<dots.c$and ${x_(n_k)}$ converges to $a$, then $a$ is called the partial limit of ${x_n}$.
  ]
  #def(name:"Net and Finite Net")[
    Let $W subset X, epsilon>0$, if $forall x in X,exists w in W$, such that $d(x,w)<epsilon$, then $W$ is called the $epsilon$-net of $(X,d)$. Specially, when $W$ has finite elements, then $W$ is called the finite $epsilon$-net of $(X,d)$.
  ]
  #thm[
    If any sequence ${x_n} subset X$ has a partial limit $a in X$ ($X$ is sequentially compact), then $forall epsilon>0$, there is a finite $epsilon$-net of $X$.
  ]
  #thm[
    Let $X$ be a sequentially compact set, then the intersection of non-empty nested closed sets is not empty.
  ]
  #thm[
    $(X,d)$ is a compact metric space if and only if $(X,d)$ is sequentially compact.
  ]
  #thm[
    The set of all partial limits of ${x_n}$ in a complete metric space $(X,d)$ is a closed set.
  ]
  #def(name:"Upper Limit and Lower Limit")[
    Let $(X,d)$ be an ordered metric space, and $E$ is the set of all partial limits of ${x_n} subset X$, then $s^*=sup E, s_*=inf E$ are called the upper limit and the lower limit of ${x_n}$ separately.
  ]
  #thm[
    Let $s^*$ be the upper limit of ${x_n}$, then
    - $forall epsilon>0, exists N in NN$, such that when $n>N$, there is $x_n<s^*+epsilon$;
    - $forall epsilon>0, forall N in NN, exists n_0>N$, such that $x_(n_0)>s^*-epsilon$.
  ]
  #re[
    $ s^*=lim_(n->+oo) sup{x_n}, s_*=lim_(n->+oo) inf{x_n}. $
  ]
  == Limit and Continuity of Map
  #def(name:"Limit of Map")[
    Let $f:E subset X -> Y$, and $x_0$ is a limit point of $E$, if $exists a in Y, forall epsilon>0, exists delta>0$, such that when $d(x,x_0)<delta$, there is $d(f(x),a)<epsilon$, then $lim_(x->x_0)f(x)=a$.
  ]
  #thm[
    $lim_(x->x_0) f(x)=a <=> forall {x_n} subset E \\{x_0}$, if $x_n->x_0$, then $f(x_n)->x_0$.
  ]
  #thm(name:"Cauchy Convergence")[
    When $x->x_0, f(x)$ converges if and only if $forall epsilon>0, exists delta>0$, such that $forall x,y in N(x_0)$ that satisfies $d(x,y)<delta$, there is $d(f(x),f(y))<epsilon$.
  ]
  #def(name:"Continuity of Map")[
    Let $f:E subset X -> Y, x_0 in E$, if $forall epsilon>0, exists delta>0$, such that when $d(x,x_0)<delta$, there is $d(f(x),f(x_0))<epsilon$, then $f(x)$ is continuous at $x_0$.
  ]
  #thm[
    Let $f:X->Y$, then $f$ is continuous on $X$ if and only if for any open/closed set $E subset Y$, $f^(-1)(E)$ is an open/closed set in $X$.
  ]
  #thm[
    Let $f:X->Y$ be a continuous map,
    - if $X$ is compact, then $f(X)$ is compact;
    - if $X$ is connected, then $f(X)$ is connected.
  ]
  #thm[
    Let $f:X->Y$ be a continuous bijection and $X$ is compact, if there is $f^(-1) (f(x))=x in X$, then $f^(-1)$ is continuous on $Y$.
  ]
  #def(name:"Uniform Continuity")[
    Let $f:X->Y$, if $forall epsilon>0, exists delta>0, forall x,y in X$, when $d(x,y)<delta$, there is $d(f(x),f(y))<delta$, then $f$ is uniformly continuous on $X$.
  ]
  #thm[
    Let $f:X->Y$ be a continuous map, if $X$ is compact, then $f$ is uniformly continuous on $X$.
  ]
  #def(name:"Discontinuity Point")[
    - If $f(x_0)!=lim_(x->x_0)f(x)$, then $x_0$ is called the discontinuity point of first kind;
    - If $lim_(x->x_0)f(x)$ does not exist, then $x_0$ is called the discontinuity point of second kind.
  ]
  #thm[
    Monotone function $f:RR->RR$ has at most countable discontinuity points.
  ]
  #thm[
    $f:[a,b]->[c,d]$ has at most countable discontinuity points of first kind.
  ]
  #def(name:"Fixed Point")[
    Let $f:X->X$, if $f(x_0)=x_0$, then $x_0$ is called the fixed point of $f$ on $X$.
  ]
  #thm(name:"Banach Fixed Point")[
    Let $f:X->X$ and $forall x!=y in X,d (f(x),f(y))<k d (x,y)$, where $0<k<1$, if $X$ is complete, then $f$ has a unique fixed point on $X$.
  ]
  #thm(name:"Picard")[
    If $f(x,y)$ satisfies Lipschitz condition $|f(x,y_1)-f(x,y_2)|<L|y_1-y_2|$, then $cases(y^' (x)=f(x,y(x)),y(x_0)=y_0)$ has a unique solution $y=y(x)$ on certain $N(x_0)$.
  ]
  #thm(name:"Brouwer Fixed Point")[
    Let $f(x):B_n (r)={x in RR^n| ||x||<=r}->B_n (r)$ and $f$ is continuous, then $exists x_0 in B_n (r)$ such that $f(x_0)=x_0$.
  ]
  = Uniform Convergence
  == Uniform Convergence
  #def(name:"Convergence")[
    Let $E subset RR$, if $forall x in E$, there is $lim_(n->+oo)f_n (x)=f(x)$, then $f_n (x)$ converges to $f(x)$. 
  ]
  #re[
    Convergence does not necessarily ensure the properties of $f_n->f$.
  ]
  #def(name:"Uniform Convergence")[
    Let $E subset RR$, if $forall epsilon>0, exists delta(epsilon)>0, forall x in E$, when $0<|y-y_0|<delta(epsilon)$, there is $|f(x,y)-f(x)|<epsilon$, then $f(x,y)$ uniformly converges to $f(x)$ when $y->y_0$.
  ]
  #re[
    - If $sup_(x in E)|f(x,y)-f(x)| ->0$, then $f(x,y)$ uniformly converges.
    - If $|f(x,y)-f(x)|<g(y)$ and $g(y)->0$, then $f(x,y)$ uniformly converges.
  ]
  #thm(name:"Cauchy Convergence")[
    $f(x,y)$ uniformly converges if and only if $forall epsilon>0,exists delta(epsilon)>0, forall y_1,y_2$, when $0<|y_1-y_2|<delta(epsilon)$, there is $|f(x,y_1)-f(x,y_2)|<epsilon$.
  ]
  #thm[
    Let $E in RR$ and $f_n (x)$ uniformly converges to $f(x)$ on $E$, if $x_0 in E^'$ and $lim_(x->x_0) f_n (x)=A_n$, then $lim_(x->x_0) f(x)=lim_(n->+oo) A_n$.
  ]
  #thm[
    Let $x in E, y in I, x_0 in E^', y_0 in I^'$, if $f(x,y)$ uniformly converges to $f(x)$ and $f(x,y)$ is continuous on $E$, then $f(x)$ is continuous on $E$ and $lim_(x->x_0)lim_(y->y_0)f(x,y)=lim_(y->y_0)lim_(x->x_0)f(x,y)$.
  ]
  #thm[
    Let $f_n (x)in cal(R)[a,b]$ and $f_n (x)$ uniformly converges to $f(x)$, then $f(x) in cal(R)[a,b]$ and $integral_a^b f(x) dif x=integral_a^b (lim f_n (x))dif x$.
  ]
  #re[
    Define $d_oo (f(x),g(x))=sup|f(x)-g(x)|$, if $f_n (x)$ converges to $f(x)$, then $f_n (x)$ uniformly converges to $f(x)$. In this case, $({f_n (x)} in B(x),d_oo)$ and $(cal(R)[a,b],d_oo)$ are complete metric spaces.
  ]
  == Uniform Convergence in Metric Space
  #thm[
    Let ${f_n (x)}$ be defined on $(X,d)$ and $E subset X$, if $f_n (x)$ uniformly converges to $f(x)$ and $f_n (x)$ is continuous on $(E,d)$, then $f(x)$ is continuous on $(E,d)$.
  ]
  #thm[
    Let $(K,d)$ be a compact metric space, if
    - $forall x in K,f_n (x)->f(x)$;
    - $f_n (x)$ and $f(x)$ are continuous on $(K,d)$;
    - $forall x in K$, ${f_n (x)}$ is monotone;
    then $f_n (x)$ uniformly converges to $f(x)$.
  ]
  == Equicontinuity
  #def(name:"Pointwise Bounded")[
    If there is a finite function $phi(x)$ such that $|f_n (x)|<phi(x)$, then $f_n (x)$ is pointwise bounded.
  ]
  #def(name:"Uniformly Bounded")[
    If there is $M>0$ such that $forall x,|f_n (x)|<M$, then $f_n (x)$ is uniformly bounded.
  ]
  #def(name:"Equicontinuity")[
    ${f_alpha}_(alpha in Lambda)$ is defined on $E$, if $forall epsilon>0, exists delta>0$, such that $forall x,y in E$, when $d(x,y)<delta$, $forall alpha in Lambda$, there is $|f_alpha (x)-f_alpha (y)|<epsilon$, then ${f_alpha}$ is called equicontinuous on $E$.
  ]
  #thm[
    Let $K$ be a compact metric space and ${f_n (x)}subset B(K)$, if ${f_n}$ uniformly converges, then ${f_n}$ is equicontinuous on $K$.
  ]
  #thm(name:"Arzela-Ascoli")[
    Suppose $K$ is a compact set, if $|f_n (x)|<=F(x)$ and $f_n (x)$ is equicontinuous, then $f_n$ is uniformly bounded on $K$, and there is uniformly convergent ${f_(k_n)}$.
  ]
  #thm[
    Suppose $f$ is continuous on $[a,b]$, then there is an array of polynomials ${P_n}$ such that $lim P_n (x)=f(x)$ on $[a,b]$.
  ]
]
