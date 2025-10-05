vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "<Leader>cc", ":CopilotChatToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>cm", ":CopilotChatCommit<CR>", { noremap = true, silent = true })
