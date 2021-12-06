# Copyright (c) 2019 Sebastian Gniazdowski
# Copyright (c) 2021 Z-Shell ZI Contributors

# Get $0 according to the Zsh Plugin Standard:
# https://github.com/z-shell/zi/wiki/Zsh-Plugin-Standard

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

typeset -gA zi_annex_unscope
zi_annex_unscope[0]="$0" zi_annex_unscope[repo-dir]="${0:h}"

# According to the Zsh Plugin Standard:
# https://github.com/z-shell/zi/wiki/Zsh-Plugin-Standard
typeset -gA Plugins
Plugins[UNSCOPE_DIR]=${0:h}

autoload -Uz za-unscope-before-load-handler za-unscope-scope-cmd-help-handler \
za-unscope-scope-cmd .za-scope-dynamic .za-unscope-list-mappings

# An empty stub to fill the help handler fields
za-unscope-help-null-handler() { :; }

# The unscoping-support hook.
@zi-register-annex "z-a-unscope" \
    hook:before-load-5 \
    za-unscope-before-load-handler \
    za-unscope-help-null-handler \
    "dynamic-unscope''|ghapi" # New ices

# The subcommand `scope'.
@zi-register-annex "z-a-unscope" \
    subcommand:scope \
    za-unscope-scope-cmd \
    za-unscope-scope-cmd-help-handler

# The hash that holds mappings of the unscoped plugin names to the
# scoped ones, and also the nick-names that map to the same, however
# are different in that they're not just stripped GitHub user name
# (i.e.: unscoped), but free in general names.

typeset -gA zi_annex_unscope_mappings

zi_annex_unscope_mappings=(
  # z-shell/null
  "1.   null"				"z-shell/null 0"
  # z-a-as-monitor
  "2.   z-a-as-monitor"		"z-shell/z-a-as-monitor 0"
  "3.   as-monitor"			"z-shell/z-a-as-monitor 0"
  "4.   monitor"			"z-shell/z-a-as-monitor 0"
  # z-a-patch-dl
  "5.   z-a-patch-dl"			"z-shell/z-a-patch-dl 0"
  "6.   patch-dl"			"z-shell/z-a-patch-dl 0"
  # z-a-submods
  "7.   z-a-submods"			"z-shell/z-a-submods 0"
  "8.   submods"			"z-shell/z-a-submods 0"
  # z-a-rust
  "9.   z-a-rust"			"z-shell/z-a-rust 0"
  "10.  rust"				"z-shell/z-a-rust 0"
  # z-a-bin-gem-node
  "11.   z-a-bin-gem-node"		"z-shell/z-a-bin-gem-node 0"
  "12.   bin-gem-node"		"z-shell/z-a-bin-gem-node 0"
  "13.   bgn"				"z-shell/z-a-bin-gem-node 0"
  # zi-console
  "14.   zi-console"		"z-shell/zi-console 0"
  "15.   console"			"z-shell/zi-console 0"
  "16.   consolette"			"z-shell/zi-console 0"
  # Prezto archive
  "17.  archive"			"PZTM::archive 1"
  "18.  arch"				"PZTM::archive 1"
  # Prezto directory
  "19.  directory"			"PZTM::directory 1"
  "20.  dir"				"PZTM::directory 1"
  # Prezto environment
  "21.  environment"			"PZTM::environment 1"
  "22.  env"				"PZTM::environment 1"
  # Prezto utility
  "23.  utility"			"PZTM::utility 1"
  "24.  util"				"PZTM::utility 1"
  # fast-syntax-highlighting
  "25.  fast-syntax-highlighting"	"z-shell/fast-syntax-highlighting 0"
  "26.  f-sy-h"		        "z-shell/fast-syntax-highlighting 0"
  "27.  fsh"				"z-shell/fast-syntax-highlighting 0"
  # history-search-multi-word
  "28.  history-search-multi-word"	"z-shell/history-search-multi-word 0"
  "29.  hsmw"				"z-shell/history-search-multi-word 0"
  # ZUI
  "30.  zui"				"z-shell/zui 0"
  "31.  ZUI"				"z-shell/zui 0"
  # Zconvey
  "32.  zconvey"			"z-shell/zconvey 0"
  "33.  zconv"			"z-shell/zconvey 0"
  # Zbrowse
  "34.  zbrowse"			"z-shell/zbrowse 0"
  # zzcomplete
  "35.  zzcomplete"			"z-shell/zzcomplete 0"
  "36.  zzcomp"			"z-shell/zzcomplete 0"
  "37.  zzcom"			"z-shell/zzcomplete 0"
  # zsh-autosuggestions
  "38.  zsh-autosuggestions"		"zsh-users/zsh-autosuggestions 0"
  "39.  autosuggestions"		"zsh-users/zsh-autosuggestions 0"
  "40.  autosug"			"zsh-users/zsh-autosuggestions 0"
  "41.  asug"				"zsh-users/zsh-autosuggestions 0"
  "42.  z-asug"			"zsh-users/zsh-autosuggestions 0"
  # zsh-syntax-highlighting
  "43.  zsh-syntax-highlighting"      "zsh-users/zsh-syntax-highlighting 0"
  "44.  z-sy-h"		        "zsh-users/zsh-syntax-highlighting 0"
  # zsh-autocomplete
  "45.  zsh-autocomplete"		"marlonrichert/zsh-autocomplete 0"
  "46.  autocomplete"			"marlonrichert/zsh-autocomplete 0"
  "47.  autocomp"			"marlonrichert/zsh-autocomplete 0"
  "48.  aucom"			"marlonrichert/zsh-autocomplete 0"
  "49.  acom"				"marlonrichert/zsh-autocomplete 0"
  "50.  z-aucom"			"marlonrichert/zsh-autocomplete 0"
  "51.  z-acom"			"marlonrichert/zsh-autocomplete 0"
  # zsh-autopair
  "52.  zsh-autopair"			"hlissner/zsh-autopair 0"
  "53.  autopair"			"hlissner/zsh-autopair 0"
  "54.  aupair"			"hlissner/zsh-autopair 0"
  "55.  aupa"				"hlissner/zsh-autopair 0"
  "56.  z-aupa"			"hlissner/zsh-autopair 0"
  # zsh-vi-more/evil-registers
  "57.  evil-registers"		"zsh-vi-more/evil-registers 0"
  "58.  evil-reg"			"zsh-vi-more/evil-registers 0"
  "59.  vi-reg"			"zsh-vi-more/evil-registers 0"
  "60.  vireg"			"zsh-vi-more/evil-registers 0"
  # vi-motions
  "61.  vi-motions"			"zsh-vi-more/vi-motions 0"
  "62.  evil-mot"			"zsh-vi-more/vi-motions 0"
  "63.  vi-mot"			"zsh-vi-more/vi-motions 0"
  "64.  vimot"			"zsh-vi-more/vi-motions 0"
  # vi-increment
  "65.  vi-increment"			"zsh-vi-more/vi-increment 0"
  "66.  evil-inc"			"zsh-vi-more/vi-increment 0"
  "67.  vi-inc"			"zsh-vi-more/vi-increment 0"
  "68.  viinc"			"zsh-vi-more/vi-increment 0"
  # vi-quote
  "69.  vi-quote"			"zsh-vi-more/vi-quote 0"
  "70.  evil-qte"			"zsh-vi-more/vi-quote 0"
  "71.  vi-qte"			"zsh-vi-more/vi-quote 0"
  "72.  viqte"			"zsh-vi-more/vi-quote 0"
  # vi-quote
  "73.  directory-marks"		"zsh-vi-more/directory-marks 0"
  "73.  evil-dir-marks"		"zsh-vi-more/directory-marks 0"
  "74.  vi-dir-marks"			"zsh-vi-more/directory-marks 0"
  "75.  vi-dirma"			"zsh-vi-more/directory-marks 0"
  "76.  vidirma"			"zsh-vi-more/directory-marks 0"
  # sharkdp/fd
  "77.  fd"				"sharkdp/fd 0"
  "78.  shark-fd"			"sharkdp/fd 0"
  # sharkdp/bat
  "79.  bat"				"sharkdp/bat 0"
  "80.  shark-bat"			"sharkdp/bat 0"
  # ogham/exa
  "81.  exa"				"ogham/exa 0"
  # zsh-users/zsh-completions
  "82.  zsh-completions"		"zsh-users/zsh-completions 0"
  "83.  completions"			"zsh-users/zsh-completions 0"
  "84.  comps"			"zsh-users/zsh-completions 0"
)
