#let homework(
  title: "",
  author: "Yuchao Feng",
  id: "524071910038",
  date: none,
  body,
) = {
  set document(title: title, author: author)
  set page(paper: "a4", numbering: "1")

  align(center, text(16pt)[*#title*])
  v(0.4em)
  align(center)[
    #author
    #if id != "" [ #h(1em) #id]
  ]
  v(0.3em)
  align(center)[#if date == none {
    datetime.today().display("[year].[month].[day]")
  } else if type(date) == datetime {
    date.display("[year].[month].[day]")
  } else {
    date
  }]
  v(1.2em)
  body
}
