return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  main = "nvim-treesitter.configs",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
