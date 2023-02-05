return {
  {
    "lervag/vimtex",
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(
            vim.env.HOME .. "/.vscode-oss/extensions/vadimcn.vscode-lldb-1.8.1-universal/adapter/codelldb",
            vim.env.HOME .. "/.vscode-oss/extensions/vadimcn.vscode-lldb-1.8.1-universal/lldb/lib/liblldb.so"
          ),
        },
      })
    end,
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup()
    end,
  },
}
