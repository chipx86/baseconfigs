set ts=8

map ;t :s/^[ <Tab>]*//<ESC>O;<ESC>74a-<ESC>jI; <ESC>o;<ESC>74a=<ESC>kA
vmap ;t <ESC>:'<,'>s/^/; /<CR>'<O;<ESC>74a-<ESC>'>o;<ESC>74a=<ESC>'<j0WW
