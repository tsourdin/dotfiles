return {
  -- Comments
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },

  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },

  { "ellisonleao/gruvbox.nvim",
    config = {
        italic = {
            strings = false,
        },
    },
    priority = 1000 }
}
