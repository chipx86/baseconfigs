" Vim syntax file example
" Language:     C gtk
" Maintainer:   krisna
" Last change:  2003-02-19

if version < 600
  so <sfile>:p:h/xlib.vim
  so <sfile>:p:h/glib.vim
  so <sfile>:p:h/pango.vim
  so <sfile>:p:h/gdk.vim
  so <sfile>:p:h/dbus.vim
  so <sfile>:p:h/galago.vim
else
  runtime! syntax/libs/atk.vim
  runtime! syntax/libs/dbus.vim
  runtime! syntax/libs/galago.vim
  runtime! syntax/libs/gconf.vim
  runtime! syntax/libs/gdk.vim
  runtime! syntax/libs/gdkpixbuf.vim
" runtime! syntax/libs/gimp.vim
  runtime! syntax/libs/glib.vim
  runtime! syntax/libs/gobject.vim
  runtime! syntax/libs/gtk.vim
  runtime! syntax/libs/libc.vim
  runtime! syntax/libs/libgnome.vim
  runtime! syntax/libs/libgnomecanvas.vim
  runtime! syntax/libs/libgnomeui.vim
  runtime! syntax/libs/pango.vim
  runtime! syntax/libs/xlib.vim
endif
