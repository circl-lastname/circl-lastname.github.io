(html :lang 'en
  (head
    (meta :charset 'utf-8)
    (link :rel 'stylesheet :href "/style.css")
    (title "circl's website"))
  
  (body
    (p (a :href ".." "Main page"))
    
    (h1 "MBLF and Brainfuck stuff")
    
    (p "In order to simplify Brainfuck development, I made a language called "
       "MBLF. It's assembly-close-enough and has 14 instructions for common "
       "tasks in Brainfuck programs. It uses a unique \"pointing\" system, "
       "where instructions act upon the currently pointed variable and an "
       "additional variable or value provided in an argument, allowing you to "
       "chain actions like so:")
    
    (pre
"var a ;; create variable 'a'

point a ;; start acting upon the variable 'a'
getchr ;; take one character from the user
print ;; print the same character
sub 1 ;; print the previous character in the alphabet/ascii
print")
    
    (p "Its original compiler did things pretty badly and was written in "
       "JavaScript, it had a few extra instructions like " (code "if") " and "
       (code "while") ", but I unfortunately removed it.")
    
    (p "My friend "
         (a :href "https://raymon.dev/" :target '_blank "Raymon")
       " wrote a new version of the compiler in Rust using Pest grammar. You "
       "can find it on "
         (a :href "https://crates.io/crates/mblf" :target '_blank "crates.io")
       ".")
    
    (p "I have created a "
         (a :href "reference.txt" :target '_blank "very rough cheat sheet for "
                                                  "the language")
       ". If you have any problems, feel free to contact me.")))
