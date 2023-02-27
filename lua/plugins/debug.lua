return {
  {
    "mfussenegger/nvim-dap",
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("~/.local/share/virtualenvs/debugpy/bin/python")
    end,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({
        library = { pluginsj = { "nvim-dap-ui" }, types = true },
      })
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = "mfussenegger/nvim-dap",
    config = function()
      require("dapui").setup()
      -- subscribe to dap events
      require("dap").listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end
      require("dap").listeners.before.event_terminated["dapui_config"] = function()
        require("dapui").close()
      end
      require("dap").listeners.before.event_exited["dapui_config"] = function()
        require("dapui").close()
      end
    end,
  },
}
