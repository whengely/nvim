local ok, packer = pcall(require, 'packer')
if not ok then return end

return packer.startup(function(use)
  use "rebelot/kanagawa.nvim"

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require('user.configs.null_ls')
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
end)
