-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
-- -----------------------------------------------------
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'},
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  use { "ellisonleao/gruvbox.nvim" }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } 

  -- Treesitter text objects
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  -- Provides a tabline with buffers (files)
  use { "ap/vim-buftabline" }
  -- use { "edibegovic/vim-buftabline" }

  -- Commentry
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Smart close buffers
  use { "mhinz/vim-sayonara" }

  -- Multiple cursors
  use { "mg979/vim-visual-multi" }

  -- Improoved text objects
  use { "wellle/targets.vim" }

  -- Highlight yanked region
  use { "machakann/vim-highlightedyank" }

  -- Vim surround
  use({
    "kylechui/nvim-surround",
    tag = "*", 
    config = function()
      require("nvim-surround").setup({
        -- Configuration here
      })
    end
  })

  -- Auto-close pairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Change in surrounding
  use { "briandoll/change-inside-surroundings.vim" }

  -- Send text to tmux-instances
  use { "jpalardy/vim-slime" }


  -- Undo tree
  use { "mbbill/undotree" }

  -- Icons
  use { 'nvim-tree/nvim-web-devicons' }

  -- LSP and completion
  use { 
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }

  -- Auto-read file when changed externally
  use {"djoshea/vim-autoread"}

end) 
