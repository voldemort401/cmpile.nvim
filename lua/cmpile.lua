-- COMPILE CPP AND C FILES AUTOMATICALLY FROM NVIM ITSELF
--
--
local M = {}

function M.compile_file()
  local current_file = vim.api.nvim_buf_get_name(0)
  local wd = vim.fn.getcwd()
  local Job = require 'plenary.job'
  local i = 0
  Job:new({
    command = Compiler,
    args    = { current_file, Compiler_args },
    cwd     = wd,
    on_start = function()
      print("Compiling")
    end,

    on_stderr = function(_,k,l) 
      -- this is kinda messy but if i dont do this the error message will repeat
      if i <= 3 then
        vim.print(l._stderr_results)
      end
      i=i+1
    end,

  }):sync() -- or start()
end



function M.setup(opts)
  opts = opts or {}
  vim.api.nvim_create_user_command("Compile", M.compile_file, {})

  local keymap  = opts.keymap or '<leader>mm'
  Compiler      = opts.compiler or 'g++'
  Compiler_args = opts.compiler_args or '-o main.out'

  vim.keymap.set('n', keymap, M.compile_file, {
    desc = "compile",
    silent = true -- Prevents the command from being echoed in the command line
  })
end

return M
