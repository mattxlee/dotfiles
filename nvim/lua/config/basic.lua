-- Disable backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Search options
vim.o.incsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tab options
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = false
vim.o.autoindent = true

-- Show cursor line
vim.o.cursorline = true

-- Sign column and show line numbers
vim.o.number = true
vim.o.signcolumn = "yes"

vim.o.linebreak = true

-- Do not jump to next match on press "*"
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<CR>")

-- Splitting current window
vim.keymap.set("n", "<Leader>v", ":vsp<CR>")
vim.keymap.set("n", "<Leader>s", ":sp<CR>")

-- Jumping between windows
vim.keymap.set("n", "<Leader>w", "<c-w>w")
vim.keymap.set("n", "<Leader>W", "<c-w>W")
vim.keymap.set("n", "<Leader><Leader>", "<c-w>x")
vim.keymap.set("n", "<Leader>=", "<c-w>=")

-- Navigating in fix window
vim.keymap.set("n", "<Leader>j", ":cnext<CR>")
vim.keymap.set("n", "<Leader>k", ":cprev<CR>")

-- Close all other windows
vim.keymap.set("n", "K", ":only<CR>")

-- Close all buffers
vim.keymap.set("n", "<Leader>q", ":%bd<CR>")

-- Hide the highlights
vim.keymap.set("n", "<Leader>n", ":noh<CR>")