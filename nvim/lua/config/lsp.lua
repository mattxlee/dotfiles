vim.keymap.set("n", "<Leader>m", ":Mason<CR>")
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { desc = "Show hover documentation" })
vim.keymap.set("n", "<C-i>", vim.lsp.buf.format, { desc = "Format current document" })
