--      ___           ___           ___           ___           ___     
--     /\  \         /\  \         /\  \         /\  \         /\  \    
--    /::\  \       /::\  \       /::\  \       /::\  \       /::\  \   
--   /:/\ \  \     /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/\:\  \  
--  _\:\~\ \  \   /::\~\:\  \   /:/  \:\  \   /:/  \:\  \   /::\~\:\  \ 
-- /\ \:\ \ \__\ /:/\:\ \:\__\ /:/__/ \:\__\ /:/__/ \:\__\ /:/\:\ \:\__\
-- \:\ \:\ \/__/ \/__\:\/:/  / \:\  \  \/__/ \:\  \  \/__/ \/__\:\/:/  /
--  \:\ \:\__\        \::/  /   \:\  \        \:\  \            \::/  / 
--   \:\/:/  /        /:/  /     \:\  \        \:\  \           /:/  /  
--    \::/  /        /:/  /       \:\__\        \:\__\         /:/  /   
--     \/__/         \/__/         \/__/         \/__/         \/__/    
--
-- Authour: Saccarosium
-- Structure:
--   * lua/* 
--       autocmds, mappings, packadds, settings
--
--   * lua/plugins/*
--       all the configurations for lua based plugins
--
--   * after/plugin/*
--       all the configurations for vimL based plugins

local command = vim.api.nvim_command

require("settings")
require("plugins")
require("mappings")
require("autocmds")

command("colorscheme codedark")

command("cnoreabbrev vb vs<space><bar><space>b")
command("cnoreabbrev sb sp<space><bar><space>b")
command("cnoreabbrev db bdelete!")
command("cnoreabbrev dot $DOTFILES")
command("cnoreabbrev rc $MYVIMRC")
