-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- General hotkeys
map("n", "<leader>pf", "<cmd>lua vim.lsp.buf.format() <CR>", { desc = "Format buffer" })
vim.keymap.del("n", "s")
-- map("n", "s", "xi", { desc = "delete char and enter insert" })
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "toggle comment" })
map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "toggle comment" }
)

-- Terminal
local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

map(
  "n",
  "<leader>h",
  ':lua require("nvterm.terminal").toggle "horizontal" <cr>',
  { desc = "Toggle horizontal terminal" }
)
map("n", "<leader>v", ':lua require("nvterm.terminal").toggle "vertical" <cr>', { desc = "Toggle vertical terminal" })
map("t", "<C-x>", termcodes("<C-\\><C-N>"), { desc = "Escape terminal mode" })

-- Hotkeys for debugging
map("n", "<F5>", ":lua require'dap'.continue() <CR>", { desc = "Continue debugging" })
map("n", "<F8>", ":lua require'dap'.toggle_breakpoint() <CR>", { desc = "Toggle breakpoint" })
map("n", "<F9>", ":lua require'dap'.repl_open() <CR>", { desc = "Debug inspect state" })
map("n", "<F10>", ":lua require'dap'.step_over() <CR>", { desc = "Debug step over" })
map("n", "<F11>", ":lua require'dap'.step_into() <CR>", { desc = "Debug step into" })
map("n", "<F12>", ":lua require'dap'.step_out() <CR>", { desc = "Debug step out" })
map("n", "<F4>", ":lua require'dap'.terminate() <CR>", { desc = "Terminate debug session" })

-- Rust keybinds
map("n", "<leader>rr", ":RustRun <CR>", { desc = "Rust run" })
map("n", "<leader>ra", ":RustRunnables <CR>", { desc = "Rust runnables" })
map("n", "<leader>rd", ":RustDebuggables <CR>", { desc = "Rust debuggables" })
map("n", "<leader>rk", ":RustMoveItemUp <CR>", { desc = "Rust move item up" })
map("n", "<leader>rj", ":RustMoveItemDown <CR>", { desc = "Rust move item down" })
map("n", "<leader>rh", ":RustHoverActions <CR>", { desc = "Rust Hover Actions (help)" })
