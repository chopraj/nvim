-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use absolute line numbers instead of relative
vim.opt.relativenumber = true
vim.opt.number = true

-- Make line number column narrower
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes:1"
vim.opt.statuscolumn = "%l%s"

-- Add a little extra vertical space for readability
vim.opt.linespace = 10
