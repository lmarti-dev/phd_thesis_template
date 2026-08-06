#import "../utils/template.typ": *


#if acrodict.keys().len()!=0{
heading(level: 1, numbering: none)[Acronyms]
[#{
  let sorted_dict = acrodict.pairs().sorted(key:k=>lower(k.at(0).at(0)))
  for ac in  sorted_dict{
    [- *#ac.at(1)* #h(8pt) #ac.at(0) #label("acr" + ac.at(1))]
  }
} <part:acronyms>]
}