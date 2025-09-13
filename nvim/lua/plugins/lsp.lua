return {
    {
        "mason-org/mason.nvim",
        config = {
            ui = {
                backdrop = 100,
            }
        },
    },
    { "mason-org/mason-lspconfig.nvim",  config = true },
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        opts = {
            keymap = {
                preset = "none",
                ["<C-space>"] = { "show", "hide" },

                ["<C-l>"] = { "show", "hide"},
                ["<C-k>"] = { "show_signature", "hide_signature" },

                ["<C-y>"] = { "select_and_accept" },

                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"] = { "select_next", "fallback_to_mappings" },

                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },

                ["<C-f>"] = { "snippet_forward", "fallback" },
                ["<C-b>"] = { "snippet_backward", "fallback" },
            },
            completion = {
                menu = {
                    auto_show = true,
                },
                documentation = {
                    auto_show = true,
                },
                ghost_text = { enabled = false },
            },
            snippets = { preset = 'luasnip' },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        transform_items = function(_, items)
                            local seen = {}
                            local deduplicated = {}
                            for _, item in ipairs(items) do
                                local key = item.label .. item.kind
                                if not seen[key] then
                                    seen[key] = true
                                    table.insert(deduplicated, item)
                                end
                            end
                            return deduplicated
                        end,
                    },
                }
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
