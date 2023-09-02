local bind = vim.keymap.set
local vsc = vim.fn.VSCodeNotify

-- File actions
local file = {
  showInExplorer = function()
    vsc('workbench.files.action.showActiveFileInExplorer')
  end,
}

-- Editor actions
local editor = {
  toggleMinimap = function()
    vsc('editor.action.toggleMinimap')
  end,

  organizeImports = function()
    vsc('editor.action.organizeImports')
  end,

  error = {
    next = function()
      vsc('editor.action.marker.next')
    end,

    prev = function()
      vsc('editor.action.marker.prev')
    end,
  }
}

bind('n', '<leader>e', file.showInExplorer, { desc = 'Show active file in explorer' })
bind('n', '<leader>o', editor.organizeImports, { desc = 'Organize imports' })

-- Next and previous error
bind('n', '<A-j>', editor.error.next, { desc = 'Next error' })
bind('n', '<A-k>', editor.error.prev, { desc = 'Prev error' })

-- Switch ^ and 0
bind('n', '0', '^', { noremap = false })
bind('n', '^', '0', { noremap = false })
