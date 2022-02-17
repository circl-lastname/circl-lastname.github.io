(html :lang 'en
  (head
    (meta :charset 'utf-8)
    (link :rel 'stylesheet :href "/style.css")
    (title "circl's website"))
  
  (body
    (p (a :href ".." "Main page"))
    
    (h1 "6502 stuff")
    
    (p "The 6502 is a nice little chip. I forked an "
      (a :href "https://github.com/circl-lastname/6502js" :target '_blank "online 6502 simulator")
    ", and I'm messing around with it.")
    
    (p "I use "
      (a :href "http://sun.hasenbraten.de/vasm/" :target '_blank "vasm")
    " as my assembler, and a "
      (a :href "dcbify.js" :target '_blank "node script")
    " I made to convert the binary data to " (code "dcb") " statements for the online simulator.")))
