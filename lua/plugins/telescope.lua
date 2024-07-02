return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  init = function()
    local builtin = require('telescope.builtin')
    local wk = require("which-key")
    wk.register({
      s = {
        name = "search",
        f = { builtin.find_files, "search Files" },
        g = { builtin.live_grep, "Grep" },
        b = { builtin.buffers, "search among Buffers" },
        h = { builtin.help_tags, "search Help tags" },
      }
    }, { prefix = "<leader>" })
    wk.register({
      g = {
        name = "git",
        b = { builtin.git_branches, "Branches" },
      }
    }, { prefix = "<leader>" })
  end,
  config = true,
  opts = {
    pickers = {
      git_branches = {
        mappings = {
          i = {
            ["<CR>"] = "git_switch_branch"
          }
        }
      }
    }
  }
}
