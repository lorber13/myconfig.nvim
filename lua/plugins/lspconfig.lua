return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufWritePost", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "folke/neodev.nvim"
    },
    config = function()
        require("neodev").setup()
        local servers = {
            "rust_analyzer",
            "tsserver",
            "clangd",
            "lua_ls",
            "bashls",
            "pyright"
        }
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                capabilities = capabilities
            }
        end
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                vim.lsp.inlay_hint.enable(true)
                local wk = require("which-key")
                wk.register({
                    K = { vim.lsp.buf.hover, "symbol information" }
                }, { buffer = ev.buf })
                wk.register({
                    l = {
                        name = "lsp",
                        r = { vim.lsp.buf.rename, "Rename symbol" },
                        f = { vim.lsp.buf.format, "Format document" },
                        u = { vim.lsp.buf.references, "find Usages" },
                        d = { vim.lsp.buf.definition, "goto Definition" },
                        i = { vim.lsp.buf.implementation, "goto Implementation" },
                    }
                }, { prefix = "<leader>", buffer = ev.buf })
                wk.register({
                    l = {
                        name = "lsp",
                        q = { vim.lsp.buf.code_action, "Quick fix" },
                    }
                }, {
                    prefix = "<leader>",
                    mode = { "n", "v" },
                    buffer = ev.buf,
                })
                wk.register({
                    g = {
                        i = { vim.lsp.buf.implementation, "goto Implementation" },
                        d = { vim.lsp.buf.definition, "goto Definition" }
                    }
                }, {
                    buffer = ev.buf,
                })
            end
        })
    end
}
