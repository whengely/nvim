local ok, packer = pcall(require, 'packer')
if not ok then return end


return packer.startup(function(use)
  use "rebelot/kanagawa.nvim"

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
  }

  use {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    config = function()
      require('user.configs.luasnip')
    end
  }

  use {
    'rcarriga/nvim-notify',
    config = function()
      require('user.configs.notify')
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      require('user.configs.telescope')
    end,
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('user.configs.which-key')
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('user.configs.nvim-tree')
    end
  }

  use {
    "rebelot/heirline.nvim",
    config = function()
      require('user.configs.heirline')
    end
  }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require('user.configs.navic')
    end
  }

  use {
    'folke/trouble.nvim',
    config = function()
      require('user.configs.trouble')
    end
  }

  use 'jbyuki/one-small-step-for-vimkind'

  use {
    'mfussenegger/nvim-dap',
    config = function()
      require('user.configs.dap')
    end
  }
end)
