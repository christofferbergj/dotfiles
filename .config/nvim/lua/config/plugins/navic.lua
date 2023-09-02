return {
  "SmiteshP/nvim-navic",
  cond = not vim.g.vscode,

  config = function()
    vim.g.navic_silence = true
    require("nvim-navic").setup({
      highlight = false,
      separator = " ",
      depth_limit = 5,
      depth_limit_indicator = "..",
      safe_output = true,
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
      }
    })
  end,
}
