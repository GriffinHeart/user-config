local status, rustaceanvim = pcall(require, 'rustaceanvim')
if (not status) then return end

local extension_path = vim.env.HOME .. '/.vscode-oss/extensions/vadimcn.vscode-lldb-1.9.2-universal/'

local this_os = vim.loop.os_uname().sysname;
if this_os:find "Windows" then
  extension_path = vim.env.HOME .. '/.vscode-server/extensions/vadimcn.vscode-lldb-1.9.2/'
end

local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'

-- The path in windows is different
if this_os:find "Windows" then
  codelldb_path = extension_path .. "adapter\\codelldb.exe"
  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for linux and .dylib for macOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

local cfg = require('rustaceanvim.config')
local opts = {
  tools = {
    test_executor = 'background'
  },
    -- ... other configs
  dap = {
    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
  },
  server = {
    -- on_attach = function(_, bufnr)
    --   vim.keymap.set("n", "<Leader>xh", rustaceanvim.hover_actions.hover_actions, { buffer = bufnr })
    -- end,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        check = {
          command = "clippy",
          extraArgs = {"--all-features"},
        },
        rustfmt = {},
      }
    }
  },
}

vim.g.rustaceanvim = opts;
local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

-- require("dapui").setup({
--   icons = { expanded = "▾", collapsed = "▸" },
--
--   lspconfig = {
--     cmd = { "lua-language-server" },
--     on_attach = function(c, b)
--     end,
--     settings = {
--       Lua = {
--         hint = {
--           enable = true,
--         },
--       },
--     },
--   },
--   mappings = {
--     -- Use a table to apply multiple mappings
--     expand = { "<CR>", "<2-LeftMouse>" },
--     open = "o",
--     remove = "d",
--     edit = "e",
--     repl = "r",
--     toggle = "t",
--   },
--   -- Expand lines larger than the window
--   -- Requires >= 0.7
--   expand_lines = vim.fn.has("nvim-0.7"),
--   -- Layouts define sections of the screen to place windows.
--   -- The position can be "left", "right", "top" or "bottom".
--   -- The size specifies the height/width depending on position. It can be an Int
--   -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
--   -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
--   -- Elements are the elements shown in the layout (in order).
--   -- Layouts are opened in order so that earlier layouts take priority in window sizing.
--   layouts = {
--     {
--       elements = {
--         -- Elements can be strings or table with id and size keys.
--         {
--           id = "scopes",
--           size = 0.25,
--         },
--         "breakpoints",
--         "stacks",
--         "watches",
--       },
--       size = 40, -- 40 columns
--       position = "left",
--     },
--     {
--       elements = {
--         "repl",
--         "console",
--       },
--       size = 0.25, -- 25% of total lines
--       position = "bottom",
--     },
--   },
--   floating = {
--     max_height = nil, -- These can be integers or a float between 0 and 1.
--     max_width = nil, -- Floats will be treated as percentage of your screen.
--     border = "single", -- Border style. Can be "single", "double" or "rounded"
--     mappings = {
--       close = { "q", "<Esc>" },
--     },
--   },
--   windows = { indent = 1 },
--   render = {
--     max_type_length = nil, -- Can be integer or nil.
--   },
-- })
--
-- local dap, dapui = require("dap"), require("dapui")
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
--
vim.g.rust_recommended_style = false
