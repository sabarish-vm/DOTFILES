return {

  { -- render
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = false,
      pipe_table = {
        enabled = true,
      },
    },
  },

  { -- local options
    dir = vim.fn.getcwd(),
    config = function()
      vim.opt.termsync = false
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.expandtab = true
      vim.keymap.set("x", "<leader>uf", ":!prettier --config .prettierrc<CR>", {
        desc = "Compact inline HTML format on selection",
        silent = true,
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.b.autoformat = false
        end,
      })
      require("which-key").add({
        {
          mode = { "x" },
          {
            "<leader>uf",
            desc = "Compact inline HTML format on selection",
          },
        },
      })
    end,
  },

  { -- nvim-lspconfig
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes_include = { "markdown" },
        },
        html = {
          filetypes = { "markdown", "html" },
        },
      },
    },
  },


  { -- conform
    "stevearc/conform.nvim",
    enabled = false,
    opts = {},
  },

  { -- mini.snippets
    "nvim-mini/mini.snippets",
    event = "InsertEnter",
    opts = function()
      local snippets = require("mini.snippets")
      return {
        snippets = {
          -- Safely expands '~' to read your global snippet file on any system
          snippets.gen_loader.from_file(vim.fn.expand("./.snippets/markdown.json")),
          snippets.gen_loader.from_lang(),
        },
      }
    end,
  },

  { -- outline.nvim
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>co", "<cmd>Outline<CR>", desc = "Toggle Component Outline" },
    },
    opts = {
      guides = {
        enabled = true,
        markers = {
          bottom = "└",
          middle = "├",
          vertical = "│",
        },
      },
      outline_window = {
        auto_close = false,
      },
    },
  },

  { -- inden-blankline
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        show_exact_scope = true,
        injected_languages = true,
      },
      viewport_buffer = {
        min = 10,
        max = 40,
      },
    },
  },

}
