local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<D-f>", "/", { desc = "Search in current buffer" })

-- Cmd+Z for undo
vim.keymap.set("n", "<D-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<D-z>", "<C-o>u", { desc = "Undo" })

-- Cmd+Shift+Z for redo
vim.keymap.set("n", "<D-S-z>", "<cmd>redo<cr>", { desc = "Redo" })
vim.keymap.set("i", "<D-S-z>", "<C-o><cmd>redo<cr>", { desc = "Redo" })

-- Cmd+S for save
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<D-s>", "<C-o><cmd>w<cr>", { desc = "Save file" })

-- Cmd+A for select all
vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all" })
vim.keymap.set("i", "<D-a>", "<C-o>ggVG", { desc = "Select all" })

-- Clipboard shortcuts
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

-- Cmd+D for show all references using Telescope
vim.keymap.set("n", "<D-d>", "<cmd>Telescope lsp_references<cr>", { desc = "Show all references (Telescope)" })
vim.keymap.set("i", "<D-d>", "<C-o><cmd>Telescope lsp_references<cr>", { desc = "Show all references (Telescope)" })

-- Cmd+W for close current buffer
vim.keymap.set("n", "<D-w>", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
vim.keymap.set("i", "<D-w>", "<C-o><cmd>bdelete<cr>", { desc = "Close current buffer" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Tab shortcuts
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Split window shortcuts
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })
