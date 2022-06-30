"      ___           ___           ___           ___           ___     
"     /\  \         /\  \         /\  \         /\  \         /\  \    
"    /::\  \       /::\  \       /::\  \       /::\  \       /::\  \   
"   /:/\ \  \     /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/\:\  \  
"  _\:\~\ \  \   /::\~\:\  \   /:/  \:\  \   /:/  \:\  \   /::\~\:\  \ 
" /\ \:\ \ \__\ /:/\:\ \:\__\ /:/__/ \:\__\ /:/__/ \:\__\ /:/\:\ \:\__\
" \:\ \:\ \/__/ \/__\:\/:/  / \:\  \  \/__/ \:\  \  \/__/ \/__\:\/:/  /
"  \:\ \:\__\        \::/  /   \:\  \        \:\  \            \::/  / 
"   \:\/:/  /        /:/  /     \:\  \        \:\  \           /:/  /  
"    \::/  /        /:/  /       \:\__\        \:\__\         /:/  /   
"     \/__/         \/__/         \/__/         \/__/         \/__/    
"
" Authour: Saccarosium
" Structure:
"   * lua/* 
"       autocmds, mappings, packadds, settings
"
"   * lua/plugins/*
"       all the configurations for lua based plugins
"
"   * after/plugin/*
"       all the configurations for vimL based plugins


lua require("settings")
lua require("plugins")
lua require("mappings")
lua require("autocmds")

colorscheme codedark

cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev db bdelete!
cnoreabbrev dot $DOTFILES
cnoreabbrev rc $MYVIMRC
