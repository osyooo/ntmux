vim.opt.termguicolors = true
vim.opt.encoding="UTF-8"
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.g.filetype = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
vim.opt.clipboard="unnamedplus"

vim.g.mkdp_refresh_slow = 0

vim.g.tmux_navigator_no_mappings = false

vim.opt.splitright = true
vim.opt.splitbelow = true
