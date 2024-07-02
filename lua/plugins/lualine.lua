return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.opt.showmode = false
  end,
  config = true,
  opts = {
    options = {
      globalstatus = true,
      section_separators = '',
      component_separators = ''
    }
  }
}
