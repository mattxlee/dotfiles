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
vim.o.linebreak = true

-- Show cursor line
vim.o.cursorline = true

-- Sign column and show line numbers
vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = "yes"

-- No fucking mouse
vim.o.mouse = ""
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

-- Set windows border to "rounded"
vim.o.winborder = "rounded"

-- Do not jump to next match on press "*"
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<CR>")

-- Jumping between windows
vim.keymap.set("n", "<Leader>w", "<c-w>w")
vim.keymap.set("n", "<Leader>W", "<c-w>W")
vim.keymap.set("n", "<Leader><Leader>", "<c-w>w")
vim.keymap.set("n", "<Leader>=", "<c-w>=")
vim.keymap.set("n", "<Leader>v", ":vsp<CR>")
vim.keymap.set("n", "<Leader>s", ":sp<CR>")
vim.keymap.set("n", "<Leader>e", "<c-w>x")
vim.keymap.set("n", "+", ":horizontal resize +3<CR>")
vim.keymap.set("n", "_", ":horizontal resize -3<CR>")
vim.keymap.set("n", ")", ":vertical resize +3<CR>")
vim.keymap.set("n", "(", ":vertical resize -3<CR>")

-- Navigating in fix window
vim.keymap.set("n", "<Leader>j", ":cnext<CR>")
vim.keymap.set("n", "<Leader>k", ":cprev<CR>")

-- Close all other windows
vim.keymap.set("n", "K", ":only<CR>")

-- Close all buffers
vim.keymap.set("n", "<Leader>q", ":%bd<CR>")

-- Hide the highlights
vim.keymap.set("n", "<Leader>n", ":noh<CR>")

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", '"*y')

-- show current file path
vim.keymap.set("n", "<leader>p", ':echo expand("%:p")<CR>')

-- terminal map
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.cmd [[
    hi clear LazyNormal
    hi link LazyNormal conceal
    hi link WinSeparator VertSplit
    hi link markdownError NONE
    set maxmempattern=2000000
    filetype indent on
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    let g:tex_conceal=''
    let g:vim_markdown_math=0
    let g:vim_markdown_conceal=0
    let g:vim_markdown_folding_disabled=1
    let g:vim_markdown_conceal_code_blocks=0
]]
