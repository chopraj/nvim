-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Cursor-like keybindings
-- Cmd+F for local file search (current buffer search)
vim.keymap.set("n", "<D-f>", "/", { desc = "Search in current buffer" })

-- Standard editor shortcuts
-- Cmd+Z for undo (works in normal and insert mode)
vim.keymap.set("n", "<D-z>", "<cmd>undo<cr>", { desc = "Undo" })
vim.keymap.set("i", "<D-z>", "<C-o><cmd>undo<cr>", { desc = "Undo" })

-- Cmd+S for save (works in normal and insert mode)
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<D-s>", "<C-o><cmd>w<cr>", { desc = "Save file" })

-- Cmd+A for select all (works in normal and insert mode)
vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all" })
vim.keymap.set("i", "<D-a>", "<C-o>ggVG", { desc = "Select all" })

-- Clipboard shortcuts (works in normal, visual, and insert mode)
-- Cmd+C for copy
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<D-c>", '"+yy', { desc = "Copy line to clipboard" })

-- Cmd+V for paste
vim.keymap.set("n", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("i", "<D-v>", "<C-r>+", { desc = "Paste from clipboard" })

-- Cmd+X for cut
vim.keymap.set("v", "<D-x>", '"+x', { desc = "Cut to clipboard" })
vim.keymap.set("n", "<D-x>", '"+dd', { desc = "Cut line to clipboard" })

-- Option+Backspace to delete word backward in insert mode
vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "Delete word backward" })

-- Cmd+D for show all references using glance.nvim (works in normal and insert mode)
vim.keymap.set("n", "<D-d>", "<cmd>Glance references<cr>", { desc = "Show all references (Glance)" })
vim.keymap.set("i", "<D-d>", "<C-o><cmd>Glance references<cr>", { desc = "Show all references (Glance)" })


-- Cmd+W for close current buffer (works in normal and insert mode)
vim.keymap.set("n", "<D-w>", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
vim.keymap.set("i", "<D-w>", "<C-o><cmd>bdelete<cr>", { desc = "Close current buffer" })
