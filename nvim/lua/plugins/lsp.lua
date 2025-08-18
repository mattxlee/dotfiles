return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            sync_install = false,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = false },
        }
    },
    {
        "mason-org/mason.nvim",
        config = {
            ui = {
                backdrop = 100,
            }
        },
    },
    { "mason-org/mason-lspconfig.nvim", config = true },
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        opts = {
            keymap = {
                preset = "none",
                ["<C-space>"] = { "show", "hide" },
                ["<C-e>"] = { "hide" },

                ["<C-l>"] = { "show_documentation", "hide_documentation" },
                ["<C-k>"] = { "show_signature", "hide_signature" },

                ["<C-y>"] = { "select_and_accept" },

                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"] = { "select_next", "fallback_to_mappings" },

                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },

                ["<tab>"] = { "snippet_forward", "fallback" },
                ["<S-tab>"] = { "snippet_backward", "fallback" },
            },
            completion = {
                menu = {
                    auto_show = true,
                },
                documentation = {
                    auto_show = true,
                },
                ghost_text = { enabled = true },
            },
            snippets = { preset = 'luasnip' },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            signature = {
                enabled = true,
                window = {
                    show_documentation = true,
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        opts = {
            servers = { -- You can add your own setup here
                lua_ls = {}
            }
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end,
    }
}
