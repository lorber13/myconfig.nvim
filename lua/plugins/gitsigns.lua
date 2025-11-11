return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  ---@module "gitsigns"
  ---@type Gitsigns.Config
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    signs_staged = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true,
  },
  keys = {
    {
      "ghp",
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      desc = "[H]unk [P]review",
    },
    {
      "ghs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "[H]unk [s]tage",
    },
    {
      "ghr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "[H]unk [R]eset",
    },
    {
      "]c",
      function()
        require("gitsigns").nav_hunk("next")
      end,
      desc = "Jump to next hunk",
    },
    {
      "[c",
      function()
        require("gitsigns").nav_hunk("prev")
      end,
      desc = "Jump to previous hunk",
    },
  },
}
