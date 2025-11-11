return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      group_empty_dirs = true,
    },
    window = {
      mappings = {
        ["<tab>"] = { "toggle_preview", config = { use_float = false } },
      },
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          -- auto close
          vim.cmd("Neotree close")
        end,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          action = "focus",
          toggle = true,
          source = "filesystem",
          position = "left",
        })
      end,
      desc = "File tree",
    },
    {
      "<leader>g",
      function()
        require("neo-tree.command").execute({
          action = "focus",
          toggle = true,
          source = "git_status",
          position = "left",
        })
      end,
      desc = "Git status",
    },
  },
}
