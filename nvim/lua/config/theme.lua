-- Options:
require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})

-- The following definitions are used for the Nvim-cmp auto-comlete menu
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#3c3836" })
vim.api.nvim_set_hl(0, "CmpSel", { bg = "#504945" })

-- Finally change the color scheme
vim.cmd("colorscheme gruvbox")

-- The sign-column background color
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282828" })

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "RED", bg = "#282828" })  -- Example: dark bg for errors
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "YELLOW", bg = "#282828" })   -- Adjust colors as needed
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "WHITE", bg = "#282828" })      -- Transparent for info
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "WHITE", bg = "#282828" })
