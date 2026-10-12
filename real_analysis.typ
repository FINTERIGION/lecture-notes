#import "template.typ": *

#note(
  title: "Real Analysis"
)[
  = Preliminaries
  #def(name:"Limit Superior and Limit Inferior")[
    Let ${A_n}_(n=1)^oo$ be a sequence of sets. The limit superior and the limit inferior are
    $ limsup A_n = inter.big_(k=1)^oo union.big_(n=k)^oo A_n, quad liminf A_n = union.big_(k=1)^oo inter.big_(n=k)^oo A_n. $
  ]
  #re[
    A point $x$ lies in $limsup A_n$ if and only if $x$ belongs to infinitely many of the sets $A_n$. It lies in $liminf A_n$ if and only if $x$ fails to belong to only finitely many of the sets $A_n$.
  ]
  #def(name:"Sigma-Algebra")[
    A family $cal(A) subset 2^X$ is a sigma-algebra on $X$ if
    - $emptyset in cal(A)$;
    - $A in cal(A)$ implies $A^c in cal(A)$;
    - ${A_n}_(n=1)^oo subset cal(A)$ implies $union.big_(n=1)^oo A_n in cal(A)$.
  ]
  #def(name:"Borel Sigma-Algebra")[
    The Borel sigma-algebra $cal(B)$ on $RR$ is the smallest sigma-algebra containing every open subset of $RR$. A set in $cal(B)$ is a Borel set.
  ]
  #re[
    An $F_sigma$ set is a countable union of closed sets. A $G_delta$ set is a countable intersection of open sets. Both are Borel.
  ]
  #lem[
    Every open set $U subset RR$ is an at most countable union of pairwise disjoint open intervals.
  ]
  #thm(name:"Cantor")[
    The interval $[0,1]$ is uncountable.
  ]
  #pf[
    Suppose $[0,1]={x_1,x_2,dots}$. Trisect $I_0=[0,1]$. At least one of the two closed outer thirds misses $x_1$; call it $I_1$. Trisect $I_1$ and choose a closed third $I_2$ that misses $x_2$. Continuing gives a nested sequence $I_0 supset I_1 supset dots.c$ of nonempty closed intervals with $x_n in.not I_n$. Their intersection contains a point $x$. Then $x in [0,1]$ and $x$ equals no $x_n$.
  ]
  = Lebesgue Measure
  == Outer Measure
  #def(name:"Outer Measure")[
    For $A subset RR$, the outer measure of $A$ is
    $ m^*(A) = inf {sum_(k=1)^oo l(I_k) : A subset union.big_(k=1)^oo I_k}, $
    where each $I_k$ is a bounded open interval and $l(I_k)$ is its length. The empty set admits the empty cover, so $m^*(emptyset)=0$.
  ]
  #re[
    - $m^*(A)>=0$, and $m^*(emptyset)=0$. A set with $m^*(A)=0$ is a null set.
    - If $A subset B$, then $m^*(A)<=m^*(B)$.
  ]
  #prop[
    Every countable set $A subset RR$ satisfies $m^*(A)=0$.
  ]
  #prop[
    If $I subset RR$ is an interval, then $m^*(I)=l(I)$, where an unbounded interval has length $oo$.
  ]
  #pf[
    If $I=[a,b]$, then $I subset (a-epsilon,b+epsilon)$, so $m^*(I)<=l(I)$. Conversely, any open cover of $I$ has a finite subcover, and the lengths of those intervals sum to at least $l(I)$. Thus $m^*(I)>=l(I)$.\
    A bounded interval is pinched between closed intervals whose lengths approach $l(I)$. An unbounded interval contains closed subintervals of arbitrary finite length, so its outer measure is infinite.
  ]
  #prop[
    For every $A subset RR$ and every $x in RR$, $m^*(A+x)=m^*(A)$.
  ]
  #prop(name:"Countable Subadditivity")[
    $ m^*(union.big_(k=1)^oo E_k) <= sum_(k=1)^oo m^*(E_k). $
  ]
  #pf[
    The claim is immediate if some $m^*(E_k)$ is infinite. Otherwise, fix $epsilon>0$. Cover $E_k$ by open intervals whose lengths sum to less than $m^*(E_k)+epsilon\/2^k$. These intervals together cover the union, and their lengths sum to less than $sum_k m^*(E_k)+epsilon$. Let $epsilon->0$.
  ]
  #eg[
    Let $C$ be the middle-thirds Cantor set, and let $C_n$ be the union of the $2^n$ closed intervals of length $3^(-n)$ remaining at stage $n$. Then $C subset C_n$, so
    $ m^*(C) <= m^*(C_n) <= (2/3)^n -> 0. $
    Thus $m^*(C)=0$.
  ]
  #prop[
    If $d(E_1,E_2)>0$, then $m^*(E_1 union E_2)=m^*(E_1)+m^*(E_2)$.
  ]
  #pf[
    Subadditivity gives one inequality. For the other, assume both outer measures are finite and set $delta=d(E_1,E_2)$ and $E=E_1 union E_2$. Given $epsilon>0$, cover $E$ by open intervals of total length less than $m^*(E)+epsilon$, and subdivide them into open intervals of length less than $delta\/2$. No such interval can meet both $E_1$ and $E_2$. Enlarging the pieces by a factor $lambda>1$ if needed to keep them open and covering, one gets
    $ m^*(E_1)+m^*(E_2) < lambda (m^*(E)+epsilon). $
    Let $lambda->1$ and $epsilon->0$.
  ]
  == Measurable Sets
  #def(name:"Carathéodory")[
    A set $E subset RR$ is Lebesgue measurable if, for every $A subset RR$,
    $ m^*(A) = m^*(A inter E) + m^*(A inter E^c). $
  ]
  #re[
    Countable subadditivity always yields $m^*(A) <= m^*(A inter E)+m^*(A inter E^c)$. Measurability is the reverse inequality.
  ]
  #prop[
    If $m^*(E)=0$, then $E$ is measurable.
  ]
  #pf[
    For every $A$, $m^*(A inter E)<=m^*(E)=0$, so
    $ m^*(A) >= m^*(A inter E^c) = m^*(A inter E) + m^*(A inter E^c). $
  ]
  #prop[
    If $E_1$ and $E_2$ are measurable, then so is $E_1 union E_2$. By De Morgan, $E_1 inter E_2$ and $E_1 \\ E_2$ are measurable as well.
  ]
  #pf[
    Let $A subset RR$. Measurability of $E_1$ and then of $E_2$ gives
    $ m^*(A) &= m^*(A inter E_1) + m^*(A inter E_1^c) \
    &= m^*(A inter E_1) + m^*(A inter E_1^c inter E_2) + m^*(A inter E_1^c inter E_2^c). $
    The first two sets on the right are disjoint and their union is $A inter (E_1 union E_2)$, while the third is $A inter (E_1 union E_2)^c$. Subadditivity closes the estimate.
  ]
  #cor[
    - If $E_1$ and $E_2$ are measurable, then $E_1 inter E_2$ is measurable.
    - A finite intersection of measurable sets is measurable.
  ]
  #prop(name:"Finite Additivity")[
    Let ${E_k}_(k=1)^n$ be pairwise disjoint measurable sets. Then for every $A subset RR$,
    $ m^*(A inter union.big_(k=1)^n E_k) = sum_(k=1)^n m^*(A inter E_k). $
  ]
  #pf[
    The case $n=1$ is immediate. If the identity holds up through $n-1$, measurability of $E_n$ gives
    $ m^*(A inter union.big_(k=1)^n E_k) = m^*(A inter E_n) + m^*(A inter union.big_(k=1)^(n-1) E_k), $
    and the inductive hypothesis finishes the proof.
  ]
  #prop[
    A countable union of measurable sets is measurable.
  ]
  #pf[
    Let $E_i$ be measurable and set $F_1=E_1$, $F_j=E_j \\ union.big_(i<j) E_i$. The sets $F_j$ are measurable and pairwise disjoint, and $E=union.big_j E_j=union.big_j F_j$. The partial unions $G_n=union.big_(j=1)^n F_j$ are measurable and increase to $E$. For every $A$,
    $ m^*(A) = m^*(A inter G_n) + m^*(A inter G_n^c) >= sum_(j=1)^n m^*(A inter F_j) + m^*(A inter E^c). $
    Let $n->oo$. Subadditivity of the series $sum_j m^*(A inter F_j)$ yields the Carathéodory inequality for $E$.
  ]
  #prop(name:"Countable Additivity")[
    Let ${E_i}_(i=1)^oo$ be pairwise disjoint measurable sets. Then for every $A subset RR$,
    $ m^*(A inter union.big_(i=1)^oo E_i) = sum_(i=1)^oo m^*(A inter E_i). $
  ]
  #pf[
    Finite additivity gives
    $ sum_(i=1)^n m^*(A inter E_i) = m^*(A inter union.big_(i=1)^n E_i) <= m^*(A inter union.big_(i=1)^oo E_i). $
    Let $n->oo$. Countable subadditivity supplies the reverse inequality.
  ]
  #re[
    The measurable sets form a sigma-algebra, the Lebesgue sigma-algebra, written $cal(M)$.
  ]
  #prop[
    Let $E subset A$ be measurable and $m^*(E)<oo$. If $A$ is measurable, then
    $ m^*(A \\ E) = m^*(A) - m^*(E). $
  ]
  #pf[
    Measurability of $E$ gives $m^*(A)=m^*(E)+m^*(A \\ E)$.
  ]
  #prop[
    Every interval is measurable.
  ]
  #pf[
    It is enough to treat $E=(a,+oo)$. Let $A subset RR$. If $a in.not A$, the two pieces below are $A inter (-oo,a)$ and $A inter (a,+oo)$; the point $a$ does not affect outer measure. Cover $A$ by open intervals $I_k$, and split each $I_k$ into $I_k inter E^c$ and $I_k inter E$. Then
    $ m^*(A inter E^c) + m^*(A inter E) <= sum_k l(I_k). $
    Taking the infimum over covers gives the Carathéodory inequality.
  ]
  #thm[
    For $E subset RR$, the following are equivalent.
    - $E$ is measurable.
    - For every $epsilon>0$ there is an open set $U supset E$ with $m^*(U \\ E)<epsilon$.
    - There is a $G_delta$ set $G supset E$ with $m^*(G \\ E)=0$.
    - For every $epsilon>0$ there is a closed set $F subset E$ with $m^*(E \\ F)<epsilon$.
    - There is an $F_sigma$ set $F subset E$ with $m^*(E \\ F)=0$.
  ]
  #pf[
    Assume $E$ is measurable. If $m^*(E)<oo$, choose open intervals covering $E$ whose lengths sum to less than $m^*(E)+epsilon$, and let $U$ be their union. Subtraction gives $m^*(U \\ E)<epsilon$. If $m^*(E)=oo$, write $E$ as a countable union of disjoint measurable sets of finite measure and take a small open neighborhood of each.\
    Given such neighborhoods $U_n$ with $m^*(U_n \\ E)<1\/n$, the intersection $G=inter.big_n U_n$ is a $G_delta$ set containing $E$ and $m^*(G \\ E)=0$. Then $G \\ E$ is a null set, hence measurable, and $E=G \\ (G \\ E)$ is measurable.\
    The closed and $F_sigma$ conditions are the same statements applied to $E^c$.
  ]
  #re[
    - For every $E subset RR$ there is a $G_delta$ set $G supset E$ with $m^*(G)=m^*(E)$. Such a $G$ is a measurable cover of $E$.
    - A set $E$ is measurable if and only if there is an $F_sigma$ set $F subset E$ with $m^*(F)=m^*(E)$.
  ]
  #def(name:"Lebesgue Measure")[
    Lebesgue measure is the restriction of outer measure to the Lebesgue sigma-algebra. It is written $m(E)$.
  ]
  #def(name:"Symmetric Difference")[
    For $A,B subset RR$, the symmetric difference is $A Delta B = (A \\ B) union (B \\ A)$.
  ]
  #thm[
    Let $E$ be measurable with $m(E)<oo$. For every $epsilon>0$ there exist finitely many pairwise disjoint open intervals $I_1,dots.c,I_n$ such that
    $ m(E Delta union.big_(k=1)^n I_k) < epsilon. $
  ]
  #pf[
    Choose an open set $V supset E$ with $m(V \\ E)<epsilon\/2$. Write $V$ as a countable union of pairwise disjoint open intervals $I_k$. Finite measure of $E$ forces $m(V)<oo$, so the tail $sum_(k>n) l(I_k)$ can be made smaller than $epsilon\/2$. The symmetric difference of $E$ with the finite union is covered by $V \\ E$ and that tail.
  ]
  == Continuity of Measure
  #def(name:"Monotone Sequences of Sets")[
    A sequence ${E_i}$ is increasing if $E_i subset E_(i+1)$, and decreasing if $E_i supset E_(i+1)$.
  ]
  #prop[
    Let ${E_i}$ be measurable.
    - If ${E_i}$ is increasing, then $m(union.big_(i=1)^oo E_i) = lim_(i->oo) m(E_i)$.
    - If ${E_i}$ is decreasing and $m(E_1)<oo$, then $m(inter.big_(i=1)^oo E_i) = lim_(i->oo) m(E_i)$.
  ]
  #pf[
    For the increasing case, set $E_0=emptyset$ and $F_i=E_i \\ E_(i-1)$. The sets $F_i$ are measurable and pairwise disjoint, and $union_i F_i = union_i E_i$. Countable additivity gives
    $ m(union.big_i E_i) = sum_(i=1)^oo (m(E_i)-m(E_(i-1))) = lim_(i->oo) m(E_i). $
    The decreasing case follows by applying the increasing case to $E_1 \\ E_i$.
  ]
  #cor[
    If ${E_i}$ is measurable, then $m(liminf E_i) <= liminf m(E_i)$.
  ]
  #pf[
    The sets $F_k=inter.big_(i>=k) E_i$ are measurable and increase to $liminf E_i$, and $m(F_k)<=m(E_k)$. Therefore
    $ m(liminf E_i) = lim_(k->oo) m(F_k) <= liminf_(k->oo) m(E_k). $
  ]
  #def(name:"Almost Everywhere")[
    A property holds almost everywhere on a measurable set $E$, written a.e., if the set of points in $E$ where it fails is a null set.
  ]
  #lem(name:"Borel--Cantelli")[
    Let ${E_i}$ be measurable and $sum_(i=1)^oo m(E_i)<oo$. Then almost every $x in RR$ belongs to only finitely many of the sets $E_i$.
  ]
  #pf[
    The sets $G_k=union.big_(i>=k) E_i$ decrease, and $m(G_k)<=sum_(i>=k) m(E_i)<oo$. Hence
    $ m(limsup E_i) = m(inter.big_(k=1)^oo G_k) = lim_(k->oo) m(G_k) = 0. $
  ]
  #lem[
    Let $E subset RR$ be bounded and measurable. If there is an uncountable set $Lambda$ such that the translates ${E+lambda}_(lambda in Lambda)$ are pairwise disjoint, then $m(E)=0$.
  ]
  == Nonmeasurable Sets
  #def(name:"Rational Equivalence")[
    For $x,y in RR$, write $x tilde y$ when $y-x in QQ$. This is an equivalence relation.
  ]
  #re[
    Let $E subset RR$. By the axiom of choice, the quotient $E \/ tilde$ has a set $C_E subset E$ of representatives, and
    - $d-c in.not QQ$ whenever $c,d in C_E$ are distinct, so the translates ${C_E+lambda}_(lambda in QQ)$ are pairwise disjoint;
    - for every $x in E$ there exist $c in C_E$ and $q in QQ$ with $x=c+q$.
  ]
  #thm(name:"Vitali")[
    Every $E subset RR$ with $m^*(E)!=0$ contains a nonmeasurable set.
  ]
  #pf[
    Passing to $E inter [-n,n]$ for large $n$, one may assume $E$ is bounded and $m^*(E)>0$. Let $V=C_E$. The rational translates of $V$ are pairwise disjoint, and $E subset union.big_(q in QQ) (V+q)$. If $V$ were measurable and $m(V)=0$, then $m^*(E)=0$. If $m(V)>0$, the countably many disjoint translates $V+q$ with $q in QQ inter [-1,1]$ would all sit in a fixed bounded interval and the sum of their measures would be infinite. Thus $V$ is not measurable.
  ]
  #cor[
    There exist disjoint sets $A,B subset RR$ with $m^*(A union B) < m^*(A)+m^*(B)$.
  ]
  #pf[
    If outer measure were additive on every pair of disjoint sets, then every set would satisfy the Carathéodory identity and would be measurable, contradicting Vitali's theorem.
  ]
  #def(name:"Middle-Thirds Cantor Set")[
    The middle-thirds Cantor set is
    $ C = {sum_(n=1)^oo a_n / 3^n : a_n in {0,2}}. $
  ]
  #prop(name:"Cantor--Lebesgue Function")[
    On $C$, the map
    $ phi(sum_(n=1)^oo a_n / 3^n) = sum_(n=1)^oo b_n / 2^n, quad b_n = a_n / 2, $
    extends to a continuous nondecreasing surjection $phi:[0,1]->[0,1]$, constant on each open interval in the complement of $C$.
  ]
  #prop[
    The function $psi:[0,1]->[0,1]$ given by $psi(x)=1/2 (phi(x)+x)$ is strictly increasing, and $m(psi(C))=1/2$.
  ]
  #pf[
    Since $phi$ is nondecreasing and $x |-> x$ is strictly increasing, $psi$ is strictly increasing. It is continuous, $psi(0)=0$, and $psi(1)=1$, so $psi$ maps $[0,1]$ onto $[0,1]$. Let $D=[0,1]\\C=union.big_k I_k$, where the $I_k$ are the pairwise disjoint open intervals removed in forming $C$ and $sum_k l(I_k)=1$. On each $I_k$ the function $phi$ is constant, so $l(psi(I_k))=l(I_k)\/2$. These image intervals are pairwise disjoint and
    $ sum_(k=1)^oo l(psi(I_k)) = 1/2. $
    Therefore $m(psi(C))=1-1/2=1/2$.
  ]
  #cor[
    There exists a Lebesgue measurable set that is not Borel.
  ]
  #pf[
    Since $m(psi(C))=1/2>0$, Vitali's theorem supplies a nonmeasurable set $E subset psi(C)$. The preimage $psi^(-1)(E)$ is contained in $C$, so it is a null set and hence Lebesgue measurable. It is not Borel: $psi$ is a homeomorphism of $[0,1]$ onto itself, and the image of a Borel set under a homeomorphism is Borel, but $E=psi(psi^(-1)(E))$ is not Borel.
  ]
  = Measurable Functions
  == Measurable Functions
  #prop[
    Let $E$ be measurable and $f:E->overline(RR)$, where $overline(RR)=RR union {-oo,+oo}$. The following are equivalent.
    - For every $c in RR$, the set ${x in E : f(x)>c}$ is measurable.
    - For every $c in RR$, the set ${x in E : f(x)>=c}$ is measurable.
    - For every $c in RR$, the set ${x in E : f(x)<c}$ is measurable.
    - For every $c in RR$, the set ${x in E : f(x)<=c}$ is measurable.
  ]
  #pf[
    The identities
    $ {f >= c} = inter.big_(k=1)^oo {f > c-1/k}, quad {f > c} = union.big_(k=1)^oo {f >= c+1/k} $
    pass between the first two conditions. Complements give the other two.
  ]
  #def(name:"Lebesgue Measurable Function")[
    Let $f:E->overline(RR)$. If $E$ is measurable and one of the four conditions above holds, then $f$ is a Lebesgue measurable function.
  ]
  #re[
    If $f$ is measurable, then ${x in E : f(x)=c}$ is measurable for every $c in overline(RR)$. The converse is false.
  ]
  #prop[
    A function $f:E->RR$ is measurable if and only if $f^(-1)(U)$ is measurable for every open $U subset RR$.
  ]
  #cor[
    - Every continuous function is measurable.
    - If $f:E->RR$ is measurable, $g:F->RR$ is continuous, and $f(E) subset F$, then $g compose f$ is measurable.
  ]
  #prop[
    - If $f$ is measurable and $g=f$ almost everywhere, then $g$ is measurable.
    - Let $E_0 subset E$ be measurable. Then $f$ is measurable on $E$ if and only if its restrictions to $E_0$ and to $E \\ E_0$ are measurable.
  ]
  #prop[
    Let $f$ and $g$ be measurable and finite almost everywhere. Then $alpha f+beta g$ and $f g$ are measurable for all $alpha,beta in RR$.
  ]
  #pf[
    For every $c in RR$,
    $ {x in E : f(x)+g(x)<c} = union.big_(q in QQ) ({g < c-q} inter {f < q}), $
    which is measurable. The square $f^2$ is measurable because ${f^2 > c}={f>sqrt(c)} union {f<-sqrt(c)}$ for $c>=0$. The product is measurable because
    $ f g = ((f+g)^2 - (f-g)^2) / 4. $
  ]
  #prop[
    If $f_1,dots.c,f_n$ are measurable, then so are $max{f_1,dots.c,f_n}$ and $min{f_1,dots.c,f_n}$.
  ]
  #def(name:"Positive and Negative Parts")[
    $ f^+ = max{f,0}, quad f^- = max{-f,0}. $
  ]
  #re[
    - $f=f^+-f^-$ and $|f|=f^++f^-$.
    - $f$ is measurable if and only if both $f^+$ and $f^-$ are measurable.
  ]
  #prop[
    If ${f_i}_(i=1)^oo$ are measurable, then $sup_i f_i$, $inf_i f_i$, $limsup f_i$, and $liminf f_i$ are measurable.
  ]
  #cor[
    An almost-everywhere pointwise limit of measurable functions is measurable.
  ]
  #def(name:"Characteristic Function")[
    For $A subset RR$, the characteristic function of $A$ is
    $ chi_A (x) = cases(1 & "if" x in A, 0 & "if" x in.not A). $
  ]
  #re[
    The function $chi_A$ is measurable if and only if $A$ is measurable.
  ]
  #def(name:"Simple Function")[
    A measurable function $f:E->RR$ is simple if its range is finite. If the distinct values are $c_1,dots.c,c_n$ and $E_k={x in E : f(x)=c_k}$, then
    $ f = sum_(k=1)^n c_k chi_(E_k). $
  ]
  == Approximation by Simple Functions
  #lem[
    Let $f:E->RR$ be bounded and measurable. For every $epsilon>0$ there exist simple functions $phi_epsilon$ and $psi_epsilon$ on $E$ with $phi_epsilon <= f <= psi_epsilon$ and $0 <= psi_epsilon - phi_epsilon < epsilon$.
  ]
  #pf[
    Suppose $f(E) subset (c,d)$. Choose $c=y_0<dots.c<y_n=d$ with $y_k-y_(k-1)<epsilon$, and set $E_k=f^(-1)([y_(k-1),y_k))$. The functions $phi_epsilon=sum_k y_(k-1) chi_(E_k)$ and $psi_epsilon=sum_k y_k chi_(E_k)$ have the required properties.
  ]
  #thm[
    A function $f:E->overline(RR)$ is measurable if and only if there is a sequence of simple functions ${phi_n}$ with $phi_n -> f$ at every point of $E$ and $|phi_n|<=|f|$. If $f>=0$, the sequence may be chosen increasing.
  ]
  #pf[
    A pointwise limit of simple functions is measurable. Conversely, since $f=f^+-f^-$ and $|f|=f^++f^-$, it is enough to treat $f>=0$. Let $E_n={x in E : f(x)<=n}$. On $E_n$ the previous lemma supplies a simple function lying between $0$ and $f$ and within $1\/n$ of $f$. Extend it by the value $n$ on $E \\ E_n$, and call the result $phi_n$. Then $0<=phi_n<=f$. If $f(x)$ is finite and $n>=f(x)$, then $0<=f(x)-phi_n (x)<1\/n$. If $f(x)=+oo$, then $phi_n (x)=n->+oo$. The running maxima $hat(phi)_n=max{phi_1,dots.c,phi_n}$ are simple, increase, and converge to $f$.
  ]
  #thm(name:"Egorov")[
    Let $E$ be measurable with $m(E)<oo$, and let $f_n:E->RR$ be measurable. If $f_n$ converges pointwise to $f$, then for every $epsilon>0$ there is a closed set $F subset E$ with $m(E \\ F)<epsilon$ such that $f_n$ converges uniformly on $F$.
  ]
  #re[
    - Pointwise convergence may be weakened to almost-everywhere convergence.
    - If $m(E)=oo$ and $f_n -> f$ almost everywhere, then for every $M>0$ there is a closed set $F_M subset E$ with $m(F_M)>M$ on which the convergence is uniform.
  ]
  #thm(name:"Lusin")[
    Let $f:E->RR$ be measurable. For every $epsilon>0$ there exist a closed set $F subset E$ and a continuous function $g:RR->RR$ such that $m(E \\ F)<epsilon$ and $g$ agrees with $f$ on $F$.
  ]
  = Lebesgue Integral
  == Bounded Functions
  #def(name:"Integral of a Simple Function")[
    If $phi=sum_(k=1)^n c_k chi_(E_k)$ is simple, with the sets $E_k$ pairwise disjoint and measurable, its Lebesgue integral is
    $ integral_E phi = sum_(k=1)^n c_k m(E_k). $
  ]
  #re[
    The integral of simple functions is linear, additive over measurable subsets, monotone, and satisfies the triangle inequality.
  ]
  #def(name:"Upper and Lower Integrals")[
    Let $E$ be measurable with $m(E)<oo$, and let $f:E->RR$ be bounded. The lower and upper Lebesgue integrals are
    $ underline(integral)_E f = sup {integral_E phi : phi "simple", phi <= f}, quad overline(integral)_E f = inf {integral_E psi : psi "simple", psi >= f}. $
    If they agree, $f$ is Lebesgue integrable and the common value is written $integral_E f$.
  ]
  #thm[
    Let $f:[a,b]->RR$ be bounded. If $f$ is Riemann integrable, then $f$ is Lebesgue integrable and the two integrals agree.
  ]
  #pf[
    Every lower Darboux sum is the integral of a simple function lying below $f$, and every upper Darboux sum is the integral of a simple function lying above $f$. Therefore
    $ underline(integral)_a^b f dif x <= underline(integral)_([a,b]) f <= overline(integral)_([a,b]) f <= overline(integral)_a^b f dif x. $
    Riemann integrability forces equality throughout.
  ]
  #thm[
    Let $E$ be measurable with $m(E)<oo$. Every bounded measurable $f:E->RR$ is Lebesgue integrable.
  ]
  #thm(name:"Uniform Convergence")[
    Let $E$ be measurable with $m(E)<oo$, and let ${f_n}$ be measurable and uniformly bounded. If $f_n$ converges uniformly to $f$, then $f$ is integrable and $integral_E f = lim_(n->oo) integral_E f_n$.
  ]
  #re[
    Pointwise convergence is not enough. The tents
    $ f_n (x) = n(1-n x) chi_((0,1/n))(x) $
    converge pointwise to $0$, while $integral_0^1 f_n = 1/2$ for every $n$.
  ]
  #thm(name:"Bounded Convergence")[
    Let $E$ be measurable with $m(E)<oo$, and let ${f_n}$ be measurable and uniformly bounded. If $f_n$ converges pointwise to $f$, then $f$ is integrable and
    $ integral_E f = lim_(n->oo) integral_E f_n. $
  ]
  == Nonnegative Functions
  #def(name:"Integral of a Nonnegative Function")[
    Let $f:E->overline(RR)$ be nonnegative and measurable. Define
    $ integral_E f = sup {integral_E h : h "bounded and measurable", 0<=h<=f, m({h != 0})<oo}. $
    If $integral_E f < oo$, then $f$ is Lebesgue integrable.
  ]
  #thm(name:"Chebyshev")[
    Let $f:E->overline(RR)$ be nonnegative and measurable. For every $lambda>0$,
    $ m({x in E : f(x) >= lambda}) <= (1/lambda) integral_E f. $
  ]
  #pf[
    Let $E_lambda={f>=lambda}$. If $m(E_lambda)<oo$, the function $h=lambda chi_(E_lambda)$ is an admissible competitor, so $lambda m(E_lambda)=integral_E h <= integral_E f$. If $m(E_lambda)=oo$, the same estimate on $E_lambda inter [-n,n]$ sends the left side to infinity, and the integral is infinite as well.
  ]
  #prop[
    Let $f:E->overline(RR)$ be nonnegative and measurable. Then $integral_E f = 0$ if and only if $f=0$ almost everywhere.
  ]
  #pf[
    If the integral vanishes, Chebyshev gives $m({f>=1/n})<=n integral_E f=0$, so ${f>0}=union_n {f>=1/n}$ is a null set. Conversely, if $f=0$ almost everywhere and $0<=h<=f$ is bounded with support of finite measure, then $h=0$ almost everywhere, so $integral_E h=0$.
  ]
  #lem(name:"Fatou")[
    Let ${f_n}$ be nonnegative and measurable, and let $f_n -> f$ almost everywhere. Then
    $ integral_E f <= liminf_(n->oo) integral_E f_n. $
  ]
  #cor[
    Let ${f_n}$ be nonnegative and measurable, with $f_n -> f$ almost everywhere and $0<=f_n<=f$. Then $integral_E f = lim_(n->oo) integral_E f_n$.
  ]
  #thm(name:"Monotone Convergence")[
    Let ${f_n}$ be nonnegative and measurable, and let $f_n$ increase to $f$ almost everywhere. Then $f$ is measurable and
    $ integral_E f = lim_(n->oo) integral_E f_n. $
  ]
  #re[
    The theorem fails for decreasing sequences. If $f_n=chi_((n,+oo))$, then $f_n$ decreases to $0$, but $integral f_n = oo$ while $integral f = 0$.
  ]
  #cor[
    If ${u_n}$ are nonnegative and measurable and $sum_(n=1)^oo u_n = f$ almost everywhere, then
    $ integral_E f = sum_(n=1)^oo integral_E u_n. $
  ]
  #cor(name:"Fatou")[
    If ${f_n}$ are nonnegative and measurable, then
    $ integral_E liminf_(n->oo) f_n <= liminf_(n->oo) integral_E f_n. $
  ]
  #re[
    The functions $g_n=inf_(k>=n) f_k$ are nonnegative and measurable, increase to $liminf f_n$, and satisfy $0<=g_n<=f_n$. Monotone convergence and the comparison $integral g_n <= integral f_n$ give the corollary.
  ]
  #prop[
    A nonnegative measurable function that is integrable is finite almost everywhere.
  ]
  #lem(name:"Beppo Levi")[
    Let ${f_n}$ be nonnegative and measurable, and assume $f_n$ is increasing. If ${integral_E f_n}$ is bounded, then $f_n$ converges pointwise to an integrable function $f$, the limit is finite almost everywhere, and $integral_E f = lim_(n->oo) integral_E f_n$.
  ]
  == Integrable Functions
  #prop[
    Let $f$ be measurable. Then $|f|$ is integrable if and only if both $f^+$ and $f^-$ are integrable.
  ]
  #pf[
    Both $f^+$ and $f^-$ are nonnegative and measurable, $0<=f^(plus.minus)<=|f|$, and $|f|=f^++f^-$.
  ]
  #def(name:"Integrable Function")[
    A measurable function $f$ is integrable if $|f|$ is integrable. In that case
    $ integral_E f = integral_E f^+ - integral_E f^-. $
  ]
  #prop[
    An integrable function is finite almost everywhere. If $f$ is integrable and $E_0 subset E$ is a null set, then $integral_(E \\ E_0) f = integral_E f$.
  ]
  #prop[
    The integral of integrable functions is linear, additive over measurable subsets, monotone, and satisfies the triangle inequality.
  ]
  #thm(name:"Dominated Convergence")[
    Let ${f_n}$ be measurable, let $g$ be integrable, and assume $|f_n|<=g$ almost everywhere. If $f_n -> f$ almost everywhere, then $f$ is integrable and
    $ integral_E f = lim_(n->oo) integral_E f_n. $
  ]
  #thm(name:"Generalized Dominated Convergence")[
    Let $f_n -> f$ almost everywhere, and let $g_n$ be nonnegative and measurable with $g_n -> g$ almost everywhere. If $|f_n|<=g_n$ almost everywhere for every $n$ and $lim_(n->oo) integral_E g_n = integral_E g < oo$, then $f$ is integrable and $integral_E f = lim_(n->oo) integral_E f_n$.
  ]
  #thm[
    Let ${f_k}$ be integrable and $sum_(k=1)^oo integral_E |f_k| < oo$. Then $sum_k f_k (x)$ converges absolutely for almost every $x$, the sum is integrable, and
    $ integral_E sum_(k=1)^oo f_k = sum_(k=1)^oo integral_E f_k. $
  ]
  #pf[
    The function $F=sum_k |f_k|$ is nonnegative and measurable, and monotone convergence gives $integral_E F = sum_k integral_E |f_k| < oo$. Thus $F$ is finite almost everywhere, so the series of $f_k$ converges absolutely almost everywhere. The partial sums are dominated by $F$, and dominated convergence passes the integral through the limit.
  ]
  #thm[
    Let $E=union.big_(k=1)^oo E_k$ with the $E_k$ pairwise disjoint and measurable, and let $f$ be integrable on $E$. Then
    $ integral_E f = sum_(k=1)^oo integral_(E_k) f. $
  ]
  #cor[
    Let $f$ be integrable on $E$, and let ${E_k}$ be measurable subsets of $E$. If ${E_k}$ increases to a set $E_oo$, then $integral_(E_oo) f = lim_k integral_(E_k) f$. If ${E_k}$ decreases to $E_oo$, then $integral_(E_oo) f = lim_k integral_(E_k) f$.
  ]
  == Absolute Continuity of the Integral
  #lem[
    If $m(E)<oo$, then for every $delta>0$ there is a finite partition of $E$ into pairwise disjoint measurable sets of measure less than $delta$.
  ]
  #prop(name:"Absolute Continuity of the Integral")[
    Let $f$ be measurable. If $f$ is integrable, then for every $epsilon>0$ there is $delta>0$ such that
    $ A subset E "measurable and" m(A)<delta quad "imply" quad integral_A |f| < epsilon. $
    If $m(E)<oo$, the converse holds.
  ]
  #pf[
    First assume $f$ is integrable and $f>=0$. Given $epsilon>0$, choose a bounded measurable $f_epsilon$ with $0<=f_epsilon<=f$, $m({f_epsilon != 0})<oo$, and $0<=integral_E f - integral_E f_epsilon<epsilon\/2$. Then $f_epsilon<M$ for some $M$. For $delta=epsilon\/(2M)$ and $m(A)<delta$,
    $ integral_A f = integral_A f_epsilon + integral_A (f-f_epsilon) < M m(A) + epsilon/2 < epsilon. $\
    Conversely, assume $m(E)<oo$ and the $epsilon$-$delta$ condition, and again take $f>=0$. Choose $delta>0$ so that $m(A)<delta$ implies $integral_A f<1$, and partition $E$ into finitely many measurable pieces $E_k$ of measure less than $delta$. Every bounded measurable $h$ with $0<=h<=f$ then satisfies
    $ integral_E h = sum_k integral_(E_k) h <= sum_k integral_(E_k) f < oo. $
    The supremum defining $integral_E f$ is finite, so $f$ is integrable.
  ]
  #def(name:"Uniform Integrability")[
    A family $cal(F)$ of measurable functions is uniformly integrable if for every $epsilon>0$ there is $delta>0$ such that
    $ A subset E, m(A)<delta, f in cal(F) quad "imply" quad integral_A |f| < epsilon. $
  ]
  #eg[
    If $g$ is nonnegative and integrable, then ${f "measurable" : |f|<=g}$ is uniformly integrable.
  ]
  #thm(name:"Vitali Convergence")[
    Let $m(E)<oo$, and let ${f_n}$ be uniformly integrable. If $f_n -> f$ almost everywhere, then $f$ is integrable and $integral_E f = lim_(n->oo) integral_E f_n$.
  ]
  #prop[
    Let $m(E)<oo$, and let ${h_n}$ be nonnegative and measurable with $h_n -> 0$ almost everywhere. Then $lim_(n->oo) integral_E h_n = 0$ if and only if ${h_n}$ is uniformly integrable.
  ]
  #prop[
    If $f$ is integrable, then for every $epsilon>0$ there is a measurable $E_0 subset E$ with $m(E_0)<oo$ and $integral_(E \\ E_0) |f| < epsilon$.
  ]
  #def(name:"Tight Family")[
    A family $cal(F)$ of measurable functions is tight if for every $epsilon>0$ there is a measurable $E_0 subset E$ with $m(E_0)<oo$ such that $integral_(E \\ E_0) |f| < epsilon$ for every $f in cal(F)$.
  ]
  #thm(name:"Vitali")[
    Let ${f_n}$ be uniformly integrable and tight. If $f_n -> f$ almost everywhere, then $f$ is integrable and $integral_E f = lim_(n->oo) integral_E f_n$.
  ]
  #cor[
    Let ${h_n}$ be nonnegative and measurable, and let $h_n -> 0$ almost everywhere. Then $lim_n integral_E h_n = 0$ if and only if ${h_n}$ is uniformly integrable and tight.
  ]
  == Convergence in Measure
  #def(name:"Convergence in Measure")[
    Let ${f_n}$ be measurable and finite almost everywhere. The sequence converges to $f$ in measure if, for every $eta>0$,
    $ lim_(n->oo) m({x in E : |f_n (x)-f(x)| >= eta}) = 0. $
  ]
  #prop[
    If $f_n$ converges in measure to both $f$ and $g$, then $f=g$ almost everywhere.
  ]
  #prop[
    If $f_n$ converges uniformly to $f$ and $f$ is finite almost everywhere, then $f_n$ converges to $f$ in measure.
  ]
  #thm(name:"Lebesgue")[
    Let $m(E)<oo$. If $f_n -> f$ almost everywhere and $f$ is finite almost everywhere, then $f_n$ converges to $f$ in measure.
  ]
  #re[
    The converse is false. Enumerate the dyadic intervals
    $ [0,1], [0,1/2], [1/2,1], [0,1/4], [1/4,1/2], dots.c $
    as ${I_n}$. Then $chi_(I_n)$ converges to $0$ in measure on $[0,1]$, but the sequence diverges at every point.
  ]
  #thm(name:"Riesz")[
    If $f_n$ converges to $f$ in measure, then some subsequence converges to $f$ almost everywhere.
  ]
  #pf[
    For each $k>=1$, choose $n_k>n_(k-1)$ so that $m(E_k)<2^(-k)$, where
    $ E_k = {x in E : |f(x)-f_(n_k)(x)| >= 1/k}. $
    Then $sum_k m(E_k)<oo$. By Borel--Cantelli, almost every $x$ lies in only finitely many $E_k$. At such an $x$ there is $N(x)$ so that $k>=N(x)$ implies $|f(x)-f_(n_k)(x)|<=1/k$, and therefore $f_(n_k)(x)->f(x)$.
  ]
  #thm[
    Let ${f_n}$ be nonnegative and measurable. Then $lim_(n->oo) integral_E f_n = 0$ if and only if $f_n$ converges to $0$ in measure and ${f_n}$ is uniformly integrable and tight.
  ]
  #pf[
    Suppose the integrals tend to $0$, but some subsequence satisfies $integral_E f_(n_k)>=epsilon$. That subsequence still converges to $0$ in measure. Riesz's theorem extracts a further subsequence converging almost everywhere to $0$, and Vitali's theorem forces its integrals to $0$, a contradiction. Thus convergence in measure together with uniform integrability and tightness implies $integral_E f_n -> 0$.\
    Conversely, Chebyshev's inequality gives, for every $eta>0$,
    $ m({f_n >= eta}) <= (1/eta) integral_E f_n -> 0, $
    so $f_n -> 0$ in measure. For the tail of the sequence the integrals themselves are smaller than any prescribed $epsilon$, hence so are the integrals over every measurable subset and over the complement of every finite-measure subset. Each individual integrable function is absolutely continuous and tight, so the finite initial segment does not destroy uniform integrability or tightness.
  ]
  #lem[
    Let ${phi_n}$ be integrable and increasing, and let ${psi_n}$ be integrable and decreasing, with $phi_n <= f <= psi_n$ and $lim_n integral_E (psi_n - phi_n)=0$. Then $phi_n$ and $psi_n$ converge almost everywhere to $f$, the function $f$ is integrable, and
    $ integral_E f = lim_n integral_E phi_n = lim_n integral_E psi_n. $
  ]
  #thm[
    Let $m(E)<oo$ and let $f$ be bounded. Then $f$ is integrable if and only if $f$ is measurable.
  ]
  == Riemann Integral
  #def(name:"Oscillation")[
    The oscillation of $f$ at $x$ is
    $ omega_f (x) = inf_(delta>0) sup {|f(x_1)-f(x_2)| : |x_1-x|<delta, |x_2-x|<delta}. $
  ]
  #re[
    - The function $f$ is continuous at $x$ if and only if $omega_f (x)=0$.
    - The function $omega_f$ is measurable.
    - The set $C(f)$ of points at which $f$ is continuous is a $G_delta$ set.
    - A set is the discontinuity set of some derivative if and only if it is an $F_sigma$ set of first category, that is, a countable union of nowhere dense closed sets.
    - In the compact-open topology, the continuous functions that are differentiable at at least one point form a set of first category.
  ]
  #lem[
    If $f$ is bounded on an interval $I=[a,b]$, then
    $ integral_I omega_f = overline(integral)_a^b f dif x - underline(integral)_a^b f dif x. $
  ]
  #thm(name:"Lebesgue")[
    A bounded function $f:[a,b]->RR$ is Riemann integrable if and only if $m({x in [a,b] : x in.not C(f)})=0$.
  ]
  = Differentiation
  == Covering and Derivatives
  #prop[
    A monotone function $f:(a,b)->RR$ is continuous except at countably many points.
  ]
  #prop[
    For every countable set $A subset (a,b)$ there is a monotone function $f:(a,b)->RR$ whose set of discontinuities is exactly $A$.
  ]
  #pf[
    Enumerate $A={r_n}_(n=1)^oo$ and set $f(x)=sum_(r_n <= x) 2^(-n)$.
  ]
  #prop[
    Every monotone function $f:(a,b)->RR$ is measurable.
  ]
  #pf[
    Assume $f$ is increasing. For each $r in RR$ the set $A_r={x in (a,b) : f(x)<=r}$ is an interval: if $x_0,x_1 in A_r$ and $x_0<=x_1$, then every convex combination $x_lambda$ lies between them, so $f(x_lambda)<=f(x_1)<=r$. An interval is measurable, so $f$ is measurable.
  ]
  #def(name:"Vitali Cover")[
    Let $E subset RR$. A family $cal(F)$ of nondegenerate closed bounded intervals is a Vitali cover of $E$ if for every $x in E$ and every $epsilon>0$ there is an interval $I in cal(F)$ with $x in I$ and $l(I)<epsilon$.
  ]
  #lem(name:"Vitali")[
    Let $m^*(E)<oo$, and let $cal(F)$ be a Vitali cover of $E$. For every $epsilon>0$ there exist finitely many pairwise disjoint intervals $I_1,dots.c,I_n in cal(F)$ such that
    $ m^*(E \\ union.big_(k=1)^n I_k) < epsilon. $
  ]
  #def(name:"Dini Derivates")[
    The upper and lower derivates of $f$ at $x$ are
    $ overline(D) f(x) = lim_(h->0) sup_(0<|t|<=h) (f(x+t)-f(x))/t, quad underline(D) f(x) = lim_(h->0) inf_(0<|t|<=h) (f(x+t)-f(x))/t. $
  ]
  #re[
    Always $underline(D) f(x) <= overline(D) f(x)$. The two derivates agree if and only if $f$ is differentiable at $x$.
  ]
  #lem[
    Let $f:[a,b]->RR$ be increasing. For every $alpha>0$,
    $ m^*({x in [a,b] : overline(D) f(x) >= alpha}) <= (1/alpha)(f(b)-f(a)). $
  ]
  #pf[
    Write $E_alpha={overline(D) f >= alpha}$. For each $alpha' in (0,alpha)$, the closed intervals $[c,d] subset [a,b]$ with $f(d)-f(c)>=alpha'(d-c)$ form a Vitali cover of $E_alpha$. Given $epsilon>0$, Vitali's lemma selects finitely many disjoint intervals $[c_k,d_k]$ from this cover with $m^*(E_alpha \\ union_k [c_k,d_k])<epsilon$. Then
    $ m^*(E_alpha) <= sum_k (d_k-c_k) + epsilon \
      <= (1/alpha') sum_k (f(d_k)-f(c_k)) + epsilon \
      <= (1/alpha')(f(b)-f(a)) + epsilon. $
    Let $epsilon->0$ and $alpha'->alpha$.
  ]
  #thm(name:"Lebesgue")[
    An increasing function $f:[a,b]->RR$ is differentiable almost everywhere.
  ]
  #re[
    _Riesz--Nagy._ For every null set $E subset [a,b]$ there is an increasing function $f:[a,b]->RR$ that fails to be differentiable at every point of $E$.
  ]
  #def(name:"Difference Quotient and Average")[
    Let $f:[a,b]->RR$ be integrable, and extend it by $f(x)=f(b)$ for $x in (b,b+1]$. For $h in (0,1]$ and $x in [a,b]$,
    $ "Diff"_h f(x) = (f(x+h)-f(x))/h, quad A_h f(x) = (1/h) integral_x^(x+h) f. $
  ]
  #re[
    For every $[c,d] subset [a,b]$, $integral_c^d "Diff"_h f = A_h f(d) - A_h f(c)$.
  ]
  #prop[
    Let $f:[a,b]->RR$ be increasing, and assume $f'$ is integrable on $[a,b]$. Then
    $ integral_a^b f' <= f(b)-f(a). $
  ]
  #pf[
    The difference quotients $"Diff"_(1/n) f$ are nonnegative and measurable, and they converge almost everywhere to $f'$. Fatou's lemma gives
    $ integral_a^b f' <= liminf_(n->oo) n integral_a^b (f(x+1/n)-f(x)) dif x = f(b) - limsup_(n->oo) n integral_a^(a+1/n) f. $
    Since $f$ is increasing, the averages on $[a,a+1/n]$ are at least $f(a)$, and the right side is at most $f(b)-f(a)$.
  ]
  #re[
    The inequality can be strict. The Cantor--Lebesgue function satisfies $phi'=0$ almost everywhere, $phi(0)=0$, and $phi(1)=1$, so $integral_0^1 phi' < phi(1)-phi(0)$.
  ]
  #prop(name:"Fubini")[
    Let $f_n:[a,b]->RR$ be increasing, and suppose $sum_(n=1)^oo f_n (x)$ converges for every $x in [a,b]$. Then
    $ (sum_(n=1)^oo f_n)'(x) = sum_(n=1)^oo f_n '(x) $
    for almost every $x in [a,b]$.
  ]
  == Bounded Variation
  #def(name:"Bounded Variation")[
    For a partition $D: a=x_0<dots.c<x_k=b$ of $[a,b]$, set $V_D (f)=sum_(i=1)^k |f(x_i)-f(x_(i-1))|$. The total variation is $V(f)=sup V_D (f)$, the supremum running over all partitions. If $V(f)<oo$, then $f$ has bounded variation, written $f in "BV"[a,b]$.
  ]
  #eg[
    - If $f$ is increasing, then $V(f)=f(b)-f(a)<oo$.
    - If $f$ is Lipschitz, then $V(f)<=lambda(b-a)$ for some $lambda>0$, so $"Lip"[a,b] subset "BV"[a,b]$.
    - The Cantor--Lebesgue function is not Lipschitz, but it is Hölder continuous: there exist $lambda>0$ and $alpha in (0,1)$ such that $|phi(x)-phi(y)|<=lambda|x-y|^alpha$.
    - The function $f(x)=2x cos(pi/(2x))$ for $x in (0,1]$, with $f(0)=0$, is continuous. On the partition with nodes $1/(2k)$, one has $f(1/(2k))=(-1)^k / k$, and the variation of these nodes is a divergent harmonic series. Thus $f in.not "BV"[0,1]$.
  ]
  #lem[
    For every $c in (a,b)$, $V(f)=V(f;[a,c])+V(f;[c,b])$.
  ]
  #def(name:"Variation Function")[
    If $f in "BV"[a,b]$, the variation function is $V_f (x)=V(f;[a,x])$.
  ]
  #prop[
    If $f in "BV"[a,b]$, then both $V_f$ and $f+V_f$ are increasing.
  ]
  #pf[
    The function $V_f$ is increasing by the additivity of variation. If $a<=x<=y<=b$, then
    $ |f(y)-f(x)| <= V(f;[x,y]) = V_f (y)-V_f (x), $
    so $f(y)+V_f (y) >= f(x)+V_f (x)$.
  ]
  #thm(name:"Jordan Decomposition")[
    A function $f$ lies in $"BV"[a,b]$ if and only if $f=g-h$ for increasing functions $g$ and $h$.
  ]
  #prop[
    If $f in "BV"[a,b]$, then $integral_a^b |f'| <= V(f)$.
  ]
  == Absolute Continuity
  #def(name:"Absolute Continuity")[
    A function $f:[a,b]->RR$ is absolutely continuous, written $f in "AC"[a,b]$, if for every $epsilon>0$ there is $delta>0$ such that
    $ sum_(k=1)^n |f(b_k)-f(a_k)| < epsilon $
    whenever ${(a_k,b_k)}_(k=1)^n$ are pairwise disjoint subintervals of $(a,b)$ with $sum_(k=1)^n (b_k-a_k)<delta$.
  ]
  #re[
    Every Lipschitz function is absolutely continuous, and every absolutely continuous function is continuous. On the compact interval $[a,b]$, continuity is equivalent to uniform continuity.
  ]
  #eg[
    The function $f(x)=sqrt(x)$ lies in $"AC"[0,1]$ but not in $"Lip"[0,1]$.
  ]
  #prop[
    A function $f$ lies in $"AC"[a,b]$ if and only if $V_f$ does.
  ]
  #eg[
    The Cantor--Lebesgue function lies in $"BV"[0,1]$ but not in $"AC"[0,1]$.
  ]
  #cor[
    A function $f$ lies in $"AC"[a,b]$ if and only if $f=g-h$ with $g$ and $h$ absolutely continuous and increasing.
  ]
  #thm[
    Let $f:[a,b]->RR$ be continuous. Then $f in "AC"[a,b]$ if and only if the family ${"Diff"_h f}_(0<h<1)$ is uniformly integrable on $[a,b]$.
  ]
  #thm(name:"Fundamental Theorem I")[
    If $f in "AC"[a,b]$, then $f'$ exists almost everywhere, $f'$ is integrable, and
    $ integral_a^b f' = f(b)-f(a). $
  ]
  #cor(name:"Integration by Parts")[
    If $f,g in "AC"[a,b]$, then
    $ integral_a^b f g' = f(b) g(b) - f(a) g(a) - integral_a^b g f'. $
  ]
  #thm(name:"Change of Variables")[
    Let $u in "AC"[a,b]$ be increasing, and let $f$ be integrable on $[u(a),u(b)]$. Then $(f compose u) u'$ is integrable on $[a,b]$, and
    $ integral_(u(a))^(u(b)) f = integral_a^b (f compose u) u'. $
  ]
  #prop[
    If $f in "AC"[a,b]$ and $E subset [a,b]$ is a null set, then $f(E)$ is a null set.
  ]
  #re[
    These conditions characterize absolute continuity together: $f in "AC"[a,b]$ if and only if $f$ is continuous and of bounded variation and $f$ sends null sets to null sets. An absolutely continuous function is differentiable almost everywhere and its derivative is integrable, but those two properties also hold for every function of bounded variation.
  ]
  #def(name:"Indefinite Integral")[
    A function $f:[a,b]->RR$ is an indefinite integral if there is an integrable $g$ on $[a,b]$ such that
    $ f(x) = f(a) + integral_a^x g $
    for every $x in [a,b]$.
  ]
  #thm[
    A function $f:[a,b]->RR$ is absolutely continuous if and only if it is an indefinite integral.
  ]
  #cor[
    Let $f:[a,b]->RR$ be monotone. Then $f in "AC"[a,b]$ if and only if $integral_a^b f' = f(b)-f(a)$.
  ]
  #lem[
    Let $f:[a,b]->RR$ be integrable. Then $f=0$ almost everywhere if and only if $integral_c^d f = 0$ for every $[c,d] subset [a,b]$.
  ]
  #thm(name:"Fundamental Theorem II")[
    Let $f:[a,b]->RR$ be integrable and set $F(x)=integral_a^x f$. Then $F$ is absolutely continuous, $F$ is differentiable almost everywhere, and $F'=f$ almost everywhere.
  ]
  #def(name:"Singular Function")[
    A function $f in "BV"[a,b]$ is singular if $f'=0$ almost everywhere.
  ]
  #re[
    If $f in "AC"[a,b]$ is singular, then $f$ is constant.
  ]
  #thm(name:"Lebesgue Decomposition")[
    Every $f in "BV"[a,b]$ can be written $f=g+h$ with $g in "AC"[a,b]$ and $h$ singular.
  ]
  #re[
    The singular part splits further as $h=u+v$, where $u$ is continuous and singular and $v$ is a jump function.
  ]
  == Convex Functions
  #def(name:"Convex Function")[
    A function $phi:(a,b)->RR$ is convex if, for all $x_1,x_2 in (a,b)$ and all $lambda in [0,1]$,
    $ phi(lambda x_1 + (1-lambda) x_2) <= lambda phi(x_1) + (1-lambda) phi(x_2). $
  ]
  #lem[
    Let $phi:[a,b]->RR$ be convex, and let $a<x_1<x_2<b$. Writing $p=(x,phi(x))$ and $p_i=(x_i,phi(x_i))$, the slopes of the chords satisfy $S_(p\, p_1) <= S_(p_1\, p_2) <= S_(p\, p_2)$.
  ]
  #lem[
    If $phi$ is convex, then $phi'_-(x)$ and $phi'_+(x)$ exist at every $x in (a,b)$, and
    $ phi'_-(x_1) <= phi'_+(x_1) <= (phi(x_2)-phi(x_1))/(x_2-x_1) <= phi'_-(x_2) <= phi'_+(x_2) $
    whenever $x_1<x_2$.
  ]
  #cor(name:"Local Lipschitz")[
    If $phi:(a,b)->RR$ is convex, then $phi$ is Lipschitz on every compact subinterval $[c,d] subset (a,b)$.
  ]
  #thm[
    A convex function $phi:(a,b)->RR$ is differentiable except at countably many points, and $phi'$ is increasing on the set where it exists.
  ]
  #prop[
    Let $psi$ be increasing and integrable on $[a,b]$, and let $alpha in RR$. Then
    $ phi(x) = alpha + integral_a^x psi $
    is convex.
  ]
  #thm(name:"Jensen")[
    Let $phi:RR->RR$ be convex, and suppose $f$ and $phi compose f$ are integrable on $[0,1]$. Then
    $ phi(integral_0^1 f(x) dif x) <= integral_0^1 phi(f(x)) dif x. $
  ]
  = $L^p$ Spaces
  == Norms
  #def(name:"Norm")[
    Let $X$ be a linear space. A function $||dot||:X->RR$ is a norm if
    - $||x||>=0$, and $||x||=0$ if and only if $x=0$;
    - $||alpha x|| = |alpha| ||x||$ for every scalar $alpha$;
    - $||x+y|| <= ||x|| + ||y||$.
  ]
  #def(name:[$L^p$ Space])[
    Let $E$ be measurable and $1<=p<oo$. Then
    $ L^p (E) = {f:E->RR : integral_E |f|^p < oo}, $
    with norm $||f||_p = (integral_E |f|^p)^(1/p)$. Functions that agree almost everywhere are identified.
  ]
  #re[
    For $0<p<1$ the quantity $||dot||_p$ does not satisfy the triangle inequality. It does satisfy $||f+g||_p^p <= ||f||_p^p + ||g||_p^p$. For $p>=1$ the space $L^p$ is a Banach space, and for $p=2$ it is a Hilbert space.
  ]
  #def(name:[$L^oo$])[
    For a measurable $f$,
    $ ||f||_oo = inf {M>=0 : |f|<=M "a.e."}, $
    and $L^oo (E)={f:E->RR : ||f||_oo < oo}$.
  ]
  #def(name:[Sequence Space $ell^p$])[
    For $1<=p<oo$ and $a={a_k}_(k=1)^oo$ with $a_k in RR$,
    $ ell^p = {a : ||a||_p = (sum_(k=1)^oo |a_k|^p)^(1/p) < oo}. $
    For $p=oo$, $ell^oo={a : ||a||_oo = sup_k |a_k| < oo}$.
  ]
  #def(name:[Space $C[a,b]$])[
    On $C[a,b]$, the supremum norm is $||f||_oo = max_(x in [a,b]) |f(x)|$. Convergence in this norm is uniform convergence.
  ]
  == Hölder and Minkowski
  #def(name:"Conjugate Exponents")[
    Exponents $p,q in [1,oo]$ are conjugate if $1/p+1/q=1$, with the convention $1\/oo=0$.
  ]
  #lem(name:"Young")[
    Let $1<p<oo$ and let $q$ be conjugate to $p$. If $a,b>=0$, then
    $ a b <= a^p / p + b^q / q. $
  ]
  #thm(name:"Hölder")[
    Let $1<=p<=oo$ and let $q$ be conjugate to $p$. If $f in L^p$ and $g in L^q$, then $f g in L^1$ and
    $ ||f g||_1 <= ||f||_p ||g||_q. $
  ]
  #re[
    The same inequality holds in $ell^p$.
  ]
  #cor[
    Let $1<=p<r<q<oo$ and $f in L^p inter L^q$. Then $f in L^r$, and
    $ log ||f||_r <= lambda log ||f||_p + (1-lambda) log ||f||_q, $
    where $lambda=(1/r-1/q)/(1/p-1/q)$, or equivalently $1/r=lambda/p+(1-lambda)/q$.
  ]
  #def(name:"Conjugate Function")[
    Let $1<p<oo$, $f in L^p$, and $f!=0$. The conjugate function of $f$ is
    $ f^* = ||f||_p^(1-p) "sgn"(f) |f|^(p-1). $
  ]
  #lem[
    If $p$ and $q$ are conjugate and $f in L^p$, then $f^* in L^q$, $||f^*||_q=1$, and $integral_E f f^* = ||f||_p$.
  ]
  #cor(name:"Minkowski")[
    Let $1<=p<=oo$ and $f,g in L^p$. Then $f+g in L^p$ and $||f+g||_p <= ||f||_p + ||g||_p$.
  ]
  #prop[
    Let $1<p<oo$ and let $cal(F) subset L^p$. If $||f||_p <= M$ for every $f in cal(F)$, then $cal(F)$ is uniformly integrable.
  ]
  #prop[
    Let $m(E)<oo$ and $1<=p_1<p_2<=oo$. Then $L^(p_2) subset L^(p_1)$ and $||f||_(p_1) <= c ||f||_(p_2)$, where
    $ c = cases(m(E)^((p_2-p_1)/(p_1 p_2)) & "if" p_2<oo, m(E)^(1/p_1) & "if" p_2=oo). $
  ]
  #re[
    - The function $x^alpha$ is integrable on $(0,1)$ if and only if $alpha>-1$.
    - The function $x^alpha$ is integrable on $(1,+oo)$ if and only if $alpha<-1$.
    - If $1<=p_1<p_2<=oo$, then $||a||_oo <= ||a||_(p_2) <= ||a||_(p_1) <= ||a||_1$, and therefore $ell^1 subset ell^(p_1) subset ell^(p_2) subset ell^oo$.
  ]
  == Completeness
  #def(name:"Metric")[
    Let $X$ be nonempty. A function $rho:X times X -> RR$ is a metric if, for all $f,g,h in X$,
    - $rho(f,g)>=0$, and $rho(f,g)=0$ if and only if $f=g$;
    - $rho(f,g)=rho(g,f)$;
    - $rho(f,g)<=rho(f,h)+rho(h,g)$.
  ]
  #def(name:"Cauchy Sequence")[
    A sequence ${f_n}$ in $(X,rho)$ is Cauchy if for every $epsilon>0$ there is $N$ such that $rho(f_j,f_k)<epsilon$ whenever $j,k>N$.
  ]
  #def(name:"Complete Metric Space")[
    A metric space is complete if every Cauchy sequence converges.
  ]
  #eg[
    A norm induces the metric $rho(f,g)=||f-g||$. A complete normed space is a Banach space. The space $C[a,b]$ is complete under $||dot||_oo$ and incomplete under $||dot||_1$.
  ]
  #prop[
    A convergent sequence is Cauchy. A Cauchy sequence that has a convergent subsequence is itself convergent.
  ]
  #def(name:"Rapidly Cauchy Sequence")[
    A sequence ${f_n}$ is rapidly Cauchy if there exist $epsilon_n>0$ with $sum_(n=1)^oo epsilon_n < oo$ such that $rho(f_n,f_(n+1))<epsilon_n$ for every $n$.
  ]
  #prop[
    Every Cauchy sequence has a rapidly Cauchy subsequence.
  ]
  #thm[
    Let $1<=p<=oo$. If ${f_n}$ is rapidly Cauchy in $L^p$, then there exists $f in L^p$ such that $f_n -> f$ almost everywhere and $||f_n-f||_p -> 0$.
  ]
  #thm(name:"Riesz--Fischer")[
    For $1<=p<=oo$ the space $L^p$ is complete. Moreover, if $f_n -> f$ in $L^p$, then some subsequence converges to $f$ almost everywhere.
  ]
  #re[
    - Convergence in $L^p$ implies convergence in measure when $1<=p<oo$, by Chebyshev's inequality. For $p=oo$ the definition of the essential supremum yields a subsequence converging almost everywhere.
    - Convergence in $L^p$ does not imply almost-everywhere convergence. On $[0,1]$, the typewriter sequence
      $ f_(2^k+j) = k chi_([j\/2^k, (j+1)\/2^k]), quad j=0,dots.c,2^k-1, $
      converges to $0$ in every $L^p$, but diverges at every $x$.
    - Almost-everywhere convergence does not imply convergence in $L^p$. If $k>=1/p$, the functions $f_n=n^k chi_((0,1/n))$ converge to $0$ almost everywhere, while $||f_n||_p = n^(k-1/p)$ does not tend to $0$.
  ]
  #thm[
    Let $1<=p<oo$ and $f_n,f in L^p$, and assume $f_n -> f$ almost everywhere. Then $f_n -> f$ in $L^p$ if and only if $||f_n||_p -> ||f||_p$.
  ]
  #thm[
    Let $1<=p<oo$ and $f_n,f in L^p$, and assume $f_n -> f$ almost everywhere. Then $f_n -> f$ in $L^p$ if and only if ${|f_n|^p}$ is uniformly integrable and tight.
  ]
  == Dense Subclasses
  #thm[
    Simple functions are dense in $L^p (E)$ for $1<=p<oo$.
  ]
  #thm[
    Step functions are dense in $L^p ([a,b])$ for $1<=p<oo$. A step function is a finite linear combination of characteristic functions of intervals.
  ]
  #thm[
    Continuous functions of compact support are dense in $L^p ([a,b])$ for $1<=p<oo$.
  ]
  #thm[
    Smooth functions of compact support are dense in $L^p ([a,b])$ for $1<=p<oo$.
  ]
  #def(name:"Separable Space")[
    A topological space is separable if it contains a countable dense subset.
  ]
  #thm[
    If $E subset RR$ is measurable and $1<=p<oo$, then $L^p (E)$ is separable.
  ]
  #re[
    The space $L^oo ([a,b])$ is not separable.
  ]
  == The Dual of $L^p$
  #def(name:"Linear Functional")[
    Let $X$ be a linear space. A map $T:X->RR$ is a linear functional if $T(alpha f+beta g)=alpha T(f)+beta T(g)$ for all $f,g in X$ and all scalars $alpha,beta$.
  ]
  #def(name:"Bounded Linear Functional")[
    Let $(X,||dot||)$ be a normed space. A linear functional $T:X->RR$ is bounded if there exists $M>=0$ such that $|T(f)|<=M||f||$ for every $f in X$. Its operator norm is
    $ ||T|| = inf {M>=0 : |T(f)| <= M ||f|| "for every" f in X}. $
    The space of all bounded linear functionals is the dual $X^*$, equipped with this norm.
  ]
  #lem[
    $ ||T|| = sup {|T(f)| : f in X, ||f||<=1} = sup {|T(f)| : f in X, ||f||=1}. $
  ]
  #cor[
    A linear functional is bounded if and only if it is continuous.
  ]
  #prop[
    The dual $(X^*, ||dot||)$ is a normed linear space.
  ]
  #prop[
    Let $1<=p<oo$, let $q$ be conjugate to $p$, and let $g in L^q$. The functional $T_g (f)=integral_E g f$ belongs to $(L^p)^*$ and $||T_g||=||g||_q$.
  ]
  #prop[
    Let $T,S in X^*$, and let $X_0 subset X$ be dense. If $T(f)=S(f)$ for every $f in X_0$, then $T=S$.
  ]
  #lem[
    Let $1<=p<oo$ and let $q$ be conjugate to $p$. Suppose $g in L^1$ and there is $M>=0$ such that $|integral_E g f| <= M ||f||_p$ for every simple $f in L^p$. Then $g in L^q$ and $||g||_q <= M$.
  ]
  #thm[
    Let $1<=p<oo$ and let $T in (L^p ([a,b]))^*$. There exists $g in L^q ([a,b])$, with $q$ conjugate to $p$, such that
    $ T(f) = integral_a^b g f $
    for every $f in L^p ([a,b])$.
  ]
  #re[
    The integrand is recovered from the indefinite integral $phi(x)=T(chi_([a,x]))$. This $phi$ is absolutely continuous, and $g=phi'$ lies in $L^q ([a,b])$.
  ]
  #re[
    If $A subset E$ is measurable, then $integral_A f = integral_E f chi_A$.
  ]
  #thm(name:"Riesz Representation")[
    Let $1<=p<oo$, let $q$ be conjugate to $p$, and let $E subset RR$ be measurable. For every $T in (L^p (E))^*$ there is a unique $g in L^q (E)$ such that $T=T_g$ and $||T||=||g||_q$.
  ]
]
