export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox
export TERMINAL=/usr/bin/termite
export PATH="$PATH:/usr/local/stata15"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

export ELECTRON_TRASH=gio

# Aliases
alias vi=nvim
alias ll=ls -lH
