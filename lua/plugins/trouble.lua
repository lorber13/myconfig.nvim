return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        local wk = require("which-key")
        wk.register({
            x = {
                name = "trouble",
                x = { function() require("trouble").toggle() end, "toggle" },
                w = { function() require("trouble").toggle("workspace_diagnostics") end, "Workspace diagnostics" },
                d = { function() require("trouble").toggle("document_diagnostics") end, "Document diagnostics" },
                q = { function() require("trouble").toggle("quickfix") end, "Quickfix" },
                l = { function() require("trouble").toggle("loclist") end, "Loclist" },
            }
        }, {
            prefix = "<leader>"
        })
        wk.register({
            g = {
                R = { function() require("trouble").toggle("lsp_references") end, "find usages" }
            }
        })
    end,
    config = true
}
