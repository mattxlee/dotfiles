vim.cmd[[colorscheme tokyonight-storm]]

vim.api.nvim_set_hl(0, "CmpNormal", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel" })
