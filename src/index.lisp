(html :lang 'en
  (head
    (meta :charset 'utf-8)
    (link :rel 'stylesheet :href "/style.css")
    (title "circl's website"))
  
  (body
    (h1 "circl's website")
    
    (p "Welcome! I make software (usually of no practical use) as a hobby. "
       "This simple website serves as a hub for the stuff I do.")
  
    (h2 "Software projects")
    
    (ul
      (li (a :href "some-pc"   "SomePC"))
      (li (a :href "hyperlisp" "Hyperlisp!"))
      (li (a :href "6502"      "6502 stuff"))
      (li (a :href "mblf"      "MBLF and Brainfuck stuff")))
    
    (h2 "Contact")
    
    (p "My Discord username is circl#3993, and my e-mail is "
         (a :href "mailto:circl.lastname@gmail.com" "circl.lastname@gmail.com")
       ".")))
