return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    local wk = require("which-key")
    local nta = require("nvim-tree.api")
    wk.register({
      e = { nta.tree.toggle, "tree" }
    }, { prefix = "<leader>" })
  end,
  config = true
}
