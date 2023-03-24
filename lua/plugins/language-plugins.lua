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

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "rust",
          "vim",
          "lua",
          "python",
          "bash",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "latex",
          "markdown",
          "make",
          "cmake",
          "llvm",
          "ninja",
          "kdl",
        },
        sync_install = true,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_hightlighting = false,
        },
      })
    end,
  },
}
