return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
  init = function()
    local wk = require("which-key")
    local ng = require("neogit")
    wk.register({
      g = {
        name = "git",
        c = {
          function()
            ng.open({ "commit" })
          end, "commit"
        }
      }
    }, { prefix = "<leader>" })
  end,
  config = true
}
