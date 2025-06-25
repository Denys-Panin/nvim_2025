return {
  {
    'shaunsingh/nord.nvim',
    lazy = true,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end
  },
  {
    'sainnhe/sonokai',
    lazy = true,
    config = function()
      vim.g.sonokai_transparent_background = '1'
      vim.g.sonokai_enable_italic = '1'
      vim.g.sonokai_style = 'andromeda'
    end
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    config = function()
      require('onedark').setup {
        style = 'deep',
        transparent = true,
        term_colors = true,
        ending_tildes = true,
      }
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = true,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
        }
      })
    end,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = true,
    config = function()
      require('cyberdream').setup {
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
      }
    end,
  },
}

