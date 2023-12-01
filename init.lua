require('main')

-- More comprehensible variables for global options, buffer-local options, and window-local options: https://icyphox.sh/blog/nvim-lua/
local global_options = vim.o
local buffer_local_options = vim.bo
local window_local_options = vim.wo



--[[
    Settings searchable using ":h '<option>'".
    Example: ":h 'number'"
--]]
-- New window created by ':vs' will be to the right of the current window.
global_options.splitbelow = true
-- New window creatd by ':sp' will be below the current window.
global_options.splitright = true
-- Prints line number on left column
global_options.number = true
-- Number of screen-lines to use for command-line
global_options.cmdheight = 1
-- Show line and column number of cursor
global_options.ruler = true
-- Copy indent of current line on the next line when created
global_options.autoindent = true
-- When <Tab> hit, inserts blanks according to 'shiftwidth'
global_options.smarttab = true
global_options.shiftwidth = 4
-- Last window will always have a status line
global_options.laststatus = 2
-- Prompt for a confirmation before executing certain commands
global_options.confirm = true
-- When bracket is inserted, briefly jump to the matching one (if on-screen)
global_options.showmatch = true
-- Command line completion on <Tab> is in 'enhanced' mode (??)
global_options.wildmenu = true
-- Backspace over the whole indentation, END-OF-LINE, and start
global_options.backsapce = indent, eol, start
-- Incremental search; highlights matches as you type
global_options.incsearch = true
-- Highlight all found items once serach command is done
global_options.hlsearch = true
-- Make it so the tildae (~) does not show on lines where there is no text
-- https://github.com/neovim/neovim/issues/2067
global_options.fcs = "eob: "

--[[
    nvim-tree setup: https://github.com/nvim-tree/nvim-tree.lua
    TODO: should i just move these somewhere else??
--]]
-- disable netrw at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

