return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  opts = {
    sign_priority = 0,
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local actions = {
        { title = "Stage hunk", cmd = "stage_hunk", fn = gs.stage_hunk },
        { title = "Reset hunk", cmd = "reset_hunk", fn = gs.reset_hunk },
        { title = "Undo stage hunk", cmd = "undo_stage_hunk", fn = gs.undo_stage_hunk },
        {
          title = "Preview hunk",
          cmd = "preview_hunk",
          fn = gs.preview_hunk_inline,
        },
        { title = "Blame line", cmd = "blame_line", fn = gs.blame_line },
        { title = "Stage buffer", cmd = "stage_buffer", fn = gs.stage_buffer },
        { title = "Reset buffer", cmd = "reset_buffer", fn = gs.reset_buffer },
      }

      vim.lsp.start({
        name = "gitsigns",
        root_dir = vim.fn.getcwd(),
        cmd = function(dispatchers)
          local closing = false
          return {
            request = function(method, params, callback)
              if method == "initialize" then
                callback(nil, {
                  capabilities = {
                    codeActionProvider = true,
                    executeCommandProvider = {
                      commands = vim.tbl_map(function(a)
                        return a.cmd
                      end, actions),
                    },
                  },
                })
              elseif method == "textDocument/codeAction" then
                callback(
                  nil,
                  vim.tbl_map(function(a)
                    return {
                      title = a.title,
                      kind = "quickfix",
                      command = { command = a.cmd, title = a.title },
                    }
                  end, actions)
                )
              elseif method == "workspace/executeCommand" then
                for _, a in ipairs(actions) do
                  if a.cmd == params.command then
                    a.fn()
                    break
                  end
                end
                callback(nil, nil)
              elseif method == "shutdown" then
                closing = true
                callback(nil, nil)
              end
              return true, nil
            end,
            notify = function(method)
              if method == "exit" then
                dispatchers.on_exit(0, 15)
              end
            end,
            is_closing = function()
              return closing
            end,
            terminate = function()
              closing = true
            end,
          }
        end,
      }, { bufnr = bufnr })
    end,
  },
}
