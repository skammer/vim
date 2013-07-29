" CtrlP OS-X Menu remapping
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

if has("gui_macvim")
  " re-remap CMD-t to open tabs
  macmenu &File.New\ Tab key=<D-t>
  macmenu &File.Print key=<nop>
endif

set vb t_vb=

