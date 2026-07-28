local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- My plugins here
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- Telescope!
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
    }
  }

  -- Switching to lua line.
  -- use 'feline-nvim/feline.nvim'

  -- LSP Stuff
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Git gutter
  use 'lewis6991/gitsigns.nvim'

  -- Colorscheme
  use 'sainnhe/everforest'
  use 'slugbyte/lackluster.nvim'
  use 'vimcolorschemes/olive-crt.nvim'
  use 'sainnhe/gruvbox-material'
  use "scottmckendry/cyberdream.nvim"
  use "rebelot/kanagawa.nvim"
  use "iagorrr/noctishc.nvim"
  use "srcery-colors/srcery-vim"
  use "morhetz/gruvbox"
  use "rose-pine/neovim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
