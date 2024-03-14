vim.g.mapleader = ' '

-- Marks for azerty
vim.keymap.set('n', '²', '`')

-- Scrolling
vim.keymap.set('n', '<C-j>', 'j<C-E>')
vim.keymap.set('n', '<C-k>', 'k<C-Y>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<C-h>', 'zH')
vim.keymap.set('n', '<C-l>', 'zL')
-- vim.keymap.set('n', '{', '{zz')
-- vim.keymap.set('n', '}', '}zz')

-- Move blocks of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center when searching
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Replace whithout yanking
vim.keymap.set("v", "<Leader>p", "\"_dP")
vim.keymap.set("n", "<Leader>d", "\"_d")
vim.keymap.set("v", "<Leader>d", "\"_d")
vim.keymap.set("n", "<Leader>x", "\"_x")
vim.keymap.set("v", "<Leader>x", "\"_x")

-- Copy to system clipboard
vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>y", "\"+y")

-- C shortcuts
vim.keymap.set("n", "<Leader>cb", "o<ESC>I{<CR>}<CR><ESC>kO") -- C body
vim.keymap.set("n", "<Leader>ca", "A()<ESC>i") -- C arguments
vim.keymap.set("n", "<Leader>cs", "A {<CR>}<ESC>O") -- C statement
vim.keymap.set("n", "<Leader>cm", "0Cint main(int argc, char *argv[])<ESC>o<ESC>I{<CR>}<CR><ESC>kO") -- C main
vim.keymap.set("n", "<Leader>cdi", "0Clog_info(\"\");<ESC>==ci\"") -- C statement`

-- Add / remove simple / double quotes around word / Word
vim.keymap.set("n", "<Leader>qw", "bi\"<ESC>ea\"<ESC>")
vim.keymap.set("n", "<Leader>qW", "Bi\"<ESC>Ea\"<ESC>")
vim.keymap.set("n", "<Leader>uq", "F\"xf\"x")

