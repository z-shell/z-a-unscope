# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Copyright (c) 2021 Z-Shell Community

# Get $0 according to the Zsh Plugin Standard:
# https://z.digitalclouds.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

typeset -gA zi_annex_unscope
zi_annex_unscope[0]="$0" zi_annex_unscope[repo-dir]="${0:h}"

# https://z.digitalclouds.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

# Standard Plugins Hash
# https://z.digitalclouds.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[UNSCOPE_DIR]=${0:h}

# The Proposed Function-Name Prefixes
# https://z.digitalclouds.dev/community/zsh_plugin_standard#the-proposed-function-name-prefixes
autoload -Uz →za-unscope-before-load-handler →za-unscope-scope-cmd-help-handler \
→za-unscope-scope-cmd .za-scope-dynamic .za-unscope-list-mappings

# An empty stub to fill the help handler fields
→za-unscope-null-handler() { :; }

# The unscoping-support hook.
@zi-register-annex "z-a-unscope" hook:before-load-5 \
  →za-unscope-before-load-handler \
  →za-unscope-null-handler "dynamic-unscope''|ghapi" # New ices

# The subcommand `scope'.
@zi-register-annex "z-a-unscope" subcommand:scope \
  →za-unscope-scope-cmd \
  →za-unscope-scope-cmd-help-handler

# The hash that holds mappings of the unscoped plugin names to the
# scoped ones, and also the nick-names that map to the same, however
# are different in that they're not just stripped GitHub user name
# (i.e.: unscoped), but free in general names.

typeset -gA zi_annex_unscope_mappings

zi_annex_unscope_mappings=(
  # z-shell/null
  "1.   null"				"z-shell/null 0"
  # z-a-readurl
  "2.   z-a-readurl"		"z-shell/z-a-readurl 0"
  "3.   read-url"			"z-shell/z-a-readurl 0"
  "4.   rdurl"			"z-shell/z-a-readurl 0"
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
  # z-a-meta-plugins
  "14.   meta"		"z-shell/z-a-meta-plugins 0"
  "15.   metaplg"			"z-shell/z-a-meta-plugins 0"
  "16.   meta-plugins"			"z-shell/z-a-meta-plugins 0"
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
  "25.  pzcomp"     "PZTM::completion 1"
  # F-Sy-H
  "26.  F-Sy-H"	  "z-shell/F-Sy-H 0"
  "27.  f-sy-h"   "z-shell/F-Sy-H 0"
  "28.  fsh"    "z-shell/F-Sy-H 0"
  # H-S-MW
  "29.  H-S-MW"   "z-shell/H-S-MW 0"
  "30.  hsmw"   "z-shell/H-S-MW 0"
  # ZUI
  "31.  zui"				"z-shell/zui 0"
  "32.  ZUI"				"z-shell/zui 0"
  # Zconvey
  "33.  zconvey"			"z-shell/zconvey 0"
  "34.  zconv"			"z-shell/zconvey 0"
  # Zbrowse
  "35.  zbrowse"			"z-shell/zbrowse 0"
  # zzcomplete
  "36.  zzcomplete"			"z-shell/zzcomplete 0"
  "37.  zzcomp"			"z-shell/zzcomplete 0"
  "38.  zzcom"			"z-shell/zzcomplete 0"
  # zsh-autosuggestions
  "39.  zsh-autosuggestions"    "zsh-users/zsh-autosuggestions 0"
  "40.  autosuggestions"    "zsh-users/zsh-autosuggestions 0"
  "41.  autosug"    "zsh-users/zsh-autosuggestions 0"
  "42.  asug"				"zsh-users/zsh-autosuggestions 0"
  "43.  z-asug"			"zsh-users/zsh-autosuggestions 0"
  # zsh-syntax-highlighting
  "44.  zsh-syntax-highlighting"      "zsh-users/zsh-syntax-highlighting 0"
  "45.  z-sy-h"		        "zsh-users/zsh-syntax-highlighting 0"
  # zsh-autocomplete
  "46.  zsh-autocomplete"		"marlonrichert/zsh-autocomplete 0"
  "47.  autocomplete"			"marlonrichert/zsh-autocomplete 0"
  "48.  autocomp"			"marlonrichert/zsh-autocomplete 0"
  "49.  aucom"			"marlonrichert/zsh-autocomplete 0"
  "50.  acom"				"marlonrichert/zsh-autocomplete 0"
  "51.  z-aucom"			"marlonrichert/zsh-autocomplete 0"
  "52.  z-acom"			"marlonrichert/zsh-autocomplete 0"
  # zsh-vi-more/evil-registers
  "53.  evil-registers"		"zsh-vi-more/evil-registers 0"
  "54.  evil-reg"			"zsh-vi-more/evil-registers 0"
  "55.  vi-reg"			"zsh-vi-more/evil-registers 0"
  "56.  vireg"			"zsh-vi-more/evil-registers 0"
  # vi-motions
  "57.  vi-motions"			"zsh-vi-more/vi-motions 0"
  "58.  evil-mot"			"zsh-vi-more/vi-motions 0"
  "59.  vi-mot"			"zsh-vi-more/vi-motions 0"
  "60.  vimot"			"zsh-vi-more/vi-motions 0"
  # vi-increment
  "61.  vi-increment"			"zsh-vi-more/vi-increment 0"
  "62.  evil-inc"			"zsh-vi-more/vi-increment 0"
  "63.  vi-inc"			"zsh-vi-more/vi-increment 0"
  "64.  viinc"			"zsh-vi-more/vi-increment 0"
  # vi-quote
  "65.  vi-quote"			"zsh-vi-more/vi-quote 0"
  "66.  evil-qte"			"zsh-vi-more/vi-quote 0"
  "67.  vi-qte"			"zsh-vi-more/vi-quote 0"
  "68.  viqte"			"zsh-vi-more/vi-quote 0"
  # vi-quote
  "69.  directory-marks"		"zsh-vi-more/directory-marks 0"
  "70.  evil-dir-marks"		"zsh-vi-more/directory-marks 0"
  "71.  vi-dir-marks"			"zsh-vi-more/directory-marks 0"
  "72.  vi-dirma"			"zsh-vi-more/directory-marks 0"
  "73.  vidirma"			"zsh-vi-more/directory-marks 0"
  # sharkdp/fd
  "74.  fd"				"sharkdp/fd 0"
  "75.  shark-fd"			"sharkdp/fd 0"
  # sharkdp/bat
  "76.  bat"				"sharkdp/bat 0"
  "77.  shark-bat"			"sharkdp/bat 0"
  # ogham/exa
  "78.  exa"				"ogham/exa 0"
  # zsh-users/zsh-completions
  "79.  zsh-completions"		"zsh-users/zsh-completions 0"
  "80.  completions"			"zsh-users/zsh-completions 0"
  "81.  comps"			"zsh-users/zsh-completions 0"
)
