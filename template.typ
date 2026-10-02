#let normalize-length(values, length) = {
  if values.len() > length {
    values.slice(0, length)
  } else if values.len() < length {
    values + (length - values.len()) * (0,)
  } else {
    values
  }
}

// Runs inside the context established by `counter.display`.
#let chapter-numbering(..nums) = {
  numbering("1.1", ..normalize-length(counter(heading).get(), 1), ..nums)
}

#let framed(it, fill) = {
  set align(left)
  block(
    fill: fill,
    inset: 8pt,
    radius: 4pt,
    breakable: true,
    width: 100%,
  )[
  #strong({
    it.supplement
    if it.numbering != none {
      [ ]
      context it.counter.display(it.numbering)
    }
    [.]
  })
  #if it.caption != none [ _(#it.caption.body)_]\
  #it.body
  ]
}

#let statement(body, kind, supplement, name) = figure(
  body,
  kind: kind,
  supplement: supplement,
  outlined: false,
  numbering: chapter-numbering,
  caption: if name == "" { none } else { name },
)

#let def(body, name: "") = statement(body, "definition", [Definition], name)
#let thm(body, name: "") = statement(body, "theorem", [Theorem], name)
#let lem(body, name: "") = statement(body, "lemma", [Lemma], name)
#let cor(body, name: "") = statement(body, "corollary", [Corollary], name)
#let prop(body, name: "") = statement(body, "proposition", [Proposition], name)

#let re(body) = {
  block(
    fill: rgb("#DFF1FF"),
    inset: 8pt,
    radius: 4pt,
    breakable: true,
    width: 100%,
  )[
    *Remark.*\
    #body
  ]
}

#let eg(body) = {
  block(
    fill: rgb("#F3F8EA"),
    inset: 8pt,
    radius: 4pt,
    breakable: true,
    width: 100%,
  )[
    *Example.*\
    #body
  ]
}

#let pf(body) = {[
  *Proof.*\
  #body
  $qed$
  
]}

#let note(
  title: "",
  author: "Yuchao Feng",
  email: "fengyuchao@sjtu.edu.cn",
  body,
) = {
  set document(title: title, author: author)
  set text(lang: "en", size: 12pt)
  set heading(numbering: "1.1")
  set page(
    paper: "iso-b5",
    margin: (x: 14mm, top: 16mm, bottom: 14mm),
    numbering: "1 / 1",
    header: context {
      let current = counter(page).get().first()
      let seen = query(heading.where(level: 1)).filter(h => {
        counter(page).at(h.location()).first() < current
      })
      if seen.len() == 0 { return }
      align(right, text(size: 8.5pt, fill: luma(100), seen.last().body))
    },
    footer: context {
      align(center, text(size: 9pt, fill: luma(100))[
        #counter(page).display("1 / 1", both: true)
      ])
    },
  )

  show heading.where(level: 1): it => {
    counter(figure.where(kind: "definition")).update((0,))
    counter(figure.where(kind: "theorem")).update((0,))
    counter(figure.where(kind: "lemma")).update((0,))
    counter(figure.where(kind: "corollary")).update((0,))
    counter(figure.where(kind: "proposition")).update((0,))
    it
  }
  show figure.where(kind: "definition"): it => framed(it, luma(240))
  show figure.where(kind: "theorem"): it => framed(it, rgb("#DFF1F1"))
  show figure.where(kind: "lemma"): it => framed(it, rgb("#F8F1D8"))
  show figure.where(kind: "corollary"): it => framed(it, rgb("#DFF1F1"))
  show figure.where(kind: "proposition"): it => framed(it, rgb("#F3E8F8"))

  align(center, text(16pt)[*#title*])
  v(0.35em)
  align(center, author)
  if email != "" {
    v(0.15em)
    align(center, text(size: 10.5pt, fill: luma(80), link("mailto:" + email)[#email]))
  }
  v(1.3em)
  outline(depth: 2)
  v(1.5em)
  body
}
