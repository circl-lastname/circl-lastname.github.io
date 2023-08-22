(html :lang 'en
  (head
    (meta :charset 'utf-8)
    (link :rel 'stylesheet :href "/style.css")
    (title "circl's website"))
  
  (body
    (p (a :href ".." "Main page"))
    
    (h1 "MSED and SDL stuff")
    
    (p "After creating simple non-interactive C programs, I wanted to try my "
       "hand at interactive graphical software. To create such an app, I've "
       "chosen the "
         (a :href "https://github.com/libsdl-org/SDL" :target '_blank "SDL")
       " library.")
    
    (p "SDL is much more than just a graphics, sound, and input library, it "
       "also concers itself with providing cross-platform APIs for file I/O, "
       "multithreading, memory allocation, and other system functions. Such a "
       "level of abstraction is great for making video games, however I now "
       "consider it overkill for simple graphical programs like mine.")
    
    (p "MSED - what I ended up creating - is much better suited as a terminal "
       "program, in fact it is stylized as such and only uses keyboard input, "
       "it allows you to create 80x24 ASCII art in the CP437 character set of "
       "the original IBM PC. The saved files can be simply " (code "type") "d "
       "in DOS and will appear exactly as in the editor. These files can of "
       "course be loaded, however they cannot have been created by other ASCII "
       "editors, as a "
         (a :href
         "https://github.com/circl-lastname/msed/blob/master/src/editor.c#L158" 
         :target '_blank "naive aproach")
       " is used to decode the ANSI escape codes.")
    
    (p "As always, if you'd like to try it, visit the "
         (a :href "https://github.com/circl-lastname/msed" :target '_blank 
         "respository")
       " on GitHub.")))
