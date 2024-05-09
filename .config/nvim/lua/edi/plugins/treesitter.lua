return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  depends = { "windwp/nvim-ts-autotag" },
  config = function()
    require("nvim-treesitter.configs").setup{
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
      sync_install = false,
      auto_install = true,
      ignore_install = { "javascript" },
      highlight = {
        enable = true,
        indent = { enable = true },
        autotag = { enable = true },

        -- line by line list of languages to install
        ensure_installed = {
          "bash",
          "c",
          "dockerfile",
          "go",
          "html",
          "javascript",
          "lua",
          "python",
          "rust",
          "typescript",
          "tsx",
          "yaml",
          "markdown",
          "json",
          "yaml",
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
