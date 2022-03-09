(html :lang 'en
  (head
    (meta :charset 'utf-8)
    (link :rel 'stylesheet :href "/style.css")
    (title "circl's website"))
  
  (body
    (p (a :href ".." "Main page"))
    
    (h1 "HyperLisp!")
    
    (p "I made a simple Lisp lexer/parser in C as a coding exercise, and as a "
       "base for further projects. My friend "
         (a :href "https://raymon.dev/" :target '_blank "Raymon")
       " had previously expressed a want for making websites using Lisp "
       "syntax, and so on the base of this parser I created HyperLisp!")
    
    (p "HyperLisp!™ is a preprocessor provides a 1:1 mapping of HTML to Lisp "
       "syntax, in fact I am using it right now to write this page.")
    
    (p "You can find the source as well as a quick guide on the "
         (a :href "https://github.com/circl-lastname/HyperLisp" :target '_blank
         "GitHub repo")
       ". If you don't want to bother compiling it, you can try out the "
         (a :href "/HyperLisp-demo" :target '_blank "online demo")
       " powered by "
         (a :href "https://emscripten.org/" :target '_blank "Emscripten")
       ".")
    
    (p (a :href "https://github.com/circl-lastname/HyperLisp" :target '_blank (img :src "https://img.shields.io/badge/built%20with-HyperLisp!-blue")))))
