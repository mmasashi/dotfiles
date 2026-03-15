vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.lazy")
require("config.options")
require("config.keymaps")
