return {
  "monaqa/dial.nvim",
  enabled = true,
  keys = {
    { "<C-a>", "<cmd>lua return require('dial.map').inc_normal()<cr>", expr = true },
    { "<C-x>", "<cmd>lua return require('dial.map').dec_normal()<cr>", expr = true },
  },

  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.bool,
        augend.semver.alias.semver,
      },
    })
  end,

  init = function()
    -- Initialization space
  end,
}
