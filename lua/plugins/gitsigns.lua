return {
    "lewis6991/gitsigns.nvim",
    config = true,
    opts = {
        numhl = true,
        current_line_blame = true,
        on_attach = function()
            local gs = package.loaded.gitsigns
            local wk = require("which-key")
            wk.register({
                g = {
                    name = "git",
                    p = { gs.preview_hunk_inline, "preview Hunk" },
                    r = { gs.reset_hunk, "Reset hunk" },
                    s = { gs.stage_hunk, "Stage hunk" },
                }
            }, { prefix = "<leader>" })
        end
    }
}
