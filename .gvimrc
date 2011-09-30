" VIM config for graphical UI
"
set guioptions=egmrt

let os=substitute(system('uname'), "\n", "", "")

if os == "Linux"
  set guioptions=egrt " hide the menu bar
  set guifont="FreeMono 12"
  set background=light
  colorscheme  solarized
elseif os == "Darwin"
  " set noanti
  set guifont=Menlo Regular:h11
  colorscheme  mac_classic
end

