return {
  "ggandor/leap.nvim",
  event = "VeryLazy",

  dependencies = {
    {
      "ggandor/flit.nvim",
      config = {
        labeled_modes = "nv",
        multiline = true
      }
    },
  },

  config = function()
    require("leap").add_default_mappings()
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
  end,

  init = function()
    vim.api.nvim_set_hl(0, 'LeapBackdrop', {
      fg = '#777777',
    })

    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'white', -- for light themes, set to 'black' or similar
      bold = true,
      nocombine = true,
    })
  end,
}
