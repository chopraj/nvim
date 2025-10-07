-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true
