options = {
    noremap = true
}

vim.g.mapleader = " "

--[[
    KEYBINDINGS
    Refer to original vim mappings: https://vim.rtorr.com/
    Vim Modes: https://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes
    First argment is the 'mode', second is the new mapping, third is old.
--]]
-- Replace Escape as toggle between INSERT mode -> NORMAL mode 
vim.keymap.set('i', 'jj', '<Esc>', options)

-- In NORMAL, add a new line before or after current, and go back to NORMAL.
vim.keymap.set('n', '<S-Enter>', 'O<Esc>', {})
vim.keymap.set('n', '<CR>', 'o<Esc>', {})

-- Move cursor to different windows when opened
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', options)
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', options)
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', options)
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', options)

-- Move to next or previous tab if multiple open 
vim.keymap.set('n', 'F', 'gt', options)
vim.keymap.set('n', 'P', 'gT', options)

-- Add the corresponding closing bracket to an opening bracket
-- TODO: Do I really need a lot of the bracket ones?
-- I think some of them can be replaced with plugins.
-- Example: https://github.com/windwp/nvim-autopairs
vim.keymap.set('i', '(', '()<Left>', options)
vim.keymap.set('i', '(<CR>', '(<CR>)<Esc>O', options)
vim.keymap.set('i', '[', '[]<Left>', options)
vim.keymap.set('i', '[<CR>', '[<CR>]<Esc>O', options)
vim.keymap.set('i', '{', '{}<Left>', options)
vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>O', options)

-- Extra opening backets boil down to just one opening bracket.
vim.keymap.set('i', '{{', '{', options)
vim.keymap.set('i', '((', '(', options)
vim.keymap.set('i', '[[', '[', options)

-- Don't create extra brackets when I've already specified both.
vim.keymap.set('i', '{}', '{}', options)
vim.keymap.set('i', '()', '()', options)
vim.keymap.set('i', '[]', '[]', options)

