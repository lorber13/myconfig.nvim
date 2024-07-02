return {
    "sindrets/diffview.nvim",
    init = function ()
        local wk = require("which-key")
        wk.register({
            g = {
                name = "git",
                d = { "<cmd>DiffviewOpen<cr>", "status (diff)" },
                h = { "<cmd>DiffviewFileHistory<cr>", "History" }
            }
        }, {
            prefix = "<leader>",
        })
    end
}
