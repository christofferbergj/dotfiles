vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspAttach_conflicts", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "eslint" then
      local clients = vim.lsp.get_clients()
      for _, client_ in pairs(clients) do
        if client_.name == "tsserver" then
          client_.server_capabilities.documentFormattingProvider = false
        end
      end
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("LruBufferLimit", { clear = true }),
  callback = function()
    local max_buffers = 10
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })

    if #bufs <= max_buffers then
      return
    end

    table.sort(bufs, function(a, b)
      return a.lastused < b.lastused
    end)

    local current = vim.api.nvim_get_current_buf()
    local deleted_count = 0
    local to_delete = #bufs - max_buffers

    for _, buf in ipairs(bufs) do
      if deleted_count >= to_delete then
        break
      end

      local is_modified = vim.api.nvim_get_option_value("modified", { buf = buf.bufnr })
      local is_pinned = vim.b[buf.bufnr].pinned or false

      if buf.bufnr ~= current and not is_modified and not is_pinned then
        Snacks.bufdelete(buf.bufnr)
        deleted_count = deleted_count + 1
      end
    end
  end,
})
