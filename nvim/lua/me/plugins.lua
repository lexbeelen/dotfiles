-- Install packer
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

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

-- Install plugins
local use = require('packer').use

use('wbthomason/packer.nvim') -- Let packer manage itself

use('farmergreg/vim-lastplace')

use('tpope/vim-sleuth') -- Indent autodetection with editorconfig support

use('tpope/vim-surround')
-- Add comments with gcc
use('tpope/vim-commentary')

-- Blade
use('jwalton512/vim-blade')

use({
  'sickill/vim-pasta',
  config = function()
    require('me.plugins.pasta')
  end,
})

-- LSP
use({
  'neovim/nvim-lspconfig',
  requires = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'b0o/schemastore.nvim',
    'folke/lsp-colors.nvim',
  },
  config = function()
    require('me.plugins.lsp')
  end,
})


-- null-ls
use({
    'jose-elias-alvarez/null-ls.nvim',
  requires = {
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('me.plugins.null-ls')
  end,
})

use({
  'L3MON4D3/LuaSnip',
  config = function()
    require('me.plugins.luasnip')
  end,
})

-- Completion
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'jessarcher/cmp-path',
    'onsails/lspkind-nvim',
    'saadparwaiz1/cmp_luasnip',
    "hrsh7th/cmp-copilot",
  },
  config = function()
    require('me.plugins.cmp')
  end,
})

-- Copilot
use('github/copilot.vim')

-- Tokyo Night Them
use({'folke/tokyonight.nvim',
    config = function()
        vim.cmd('colorscheme tokyonight')

        -- Hide the characters in FloatBorder
        vim.api.nvim_set_hl(0, 'FloatBorder', {
          fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
          bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        })

        -- Hide the characters in CursorLineBg // NOT WORKING
        vim.api.nvim_set_hl(0, 'TelescopeBorder', {
          fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
          bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        })

        vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
        vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })

        end,
})

-- Telescope
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('me.plugins.telescope')
  end,
})

-- Tree
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('me.plugins.nvim-tree')
  end,
})


use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('me.plugins.treesitter')
  end,
})

-- Status line
use({
  'nvim-lualine/lualine.nvim',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('me.plugins.lualine')
  end,
})

-- Indent blankline
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('me.plugins.indent-blankline')
  end,
})

-- Bufferline
use({
  'akinsho/bufferline.nvim',
  requires = 'nvim-tree/nvim-web-devicons',
  after = 'tokyonight.nvim',
  config = function()
      require('me.plugins.bufferline')
  end,
})

-- Automatically add closing brackets, quotes, etc.
use({'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end,
});

-- Dashboard
use({
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('me.plugins.dashboard')
  end,
  requires = {'nvim-tree/nvim-web-devicons'},
})

-- Add smooth scrolling to avoid jarring jumps
use({'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end,
});

use({
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('gitsigns').setup({
      sign_priority = 20,
        current_line_blame = true
    })
  end,
})

-- ToggleTerm
use({ "akinsho/toggleterm.nvim", tag = '*', config = function()
    require('me.plugins.toggleterm')
end })

-- All closing buffers without closing the split window.
use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

use({
  'folke/trouble.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('trouble').setup()
  end,
})

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
