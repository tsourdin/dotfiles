vim.opt.nu = true
vim.opt.rnu = true

-- indenting
vim.opt.expandtab = true -- replace tab with spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
-- mapping to disable de-indenting on # insertion
vim.cmd("inoremap # X#")

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"
