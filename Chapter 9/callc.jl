# calling a function in a shared library:
lang = ccall( (:getenv, "libc"), Cstring, (Cstring,), "LANGUAGE")
unsafe_string(lang) #> "en_US"

# test existence of library:
find_library(["libc"]) #> "libc"