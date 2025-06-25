require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup {
  require 'plugins.neotree',
  require 'plugins.colortheme',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.none-ls',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.comment',
  require 'plugins.emmet-vim',
  require 'plugins.toggleterm',
  require 'plugins.diffview',
  require 'plugins.pint',
  require 'plugins.trouble',
  require 'plugins.session',
  require 'plugins.conform',
}

local default_theme = "onedark"  -- тут змінюй яку тему хочеш

local themes = {
  nord = function()
    require('lazy').load { plugins = { 'nord.nvim' } }
    require('nord').set()
  end,

  sonokai = function()
    require('lazy').load { plugins = { 'sonokai' } }
    vim.cmd.colorscheme('sonokai')
  end,

  onedark = function()
    require('lazy').load { plugins = { 'onedark.nvim' } }
    require('onedark').load()
  end,

  github = function()
    require('lazy').load { plugins = { 'github-nvim-theme' } }
    vim.cmd("colorscheme github_light_default")
  end,

  cyberdream = function()
    require('lazy').load { plugins = { 'cyberdream.nvim' } }
    vim.cmd.colorscheme('cyberdream')
  end,
}

-- Мапінги
vim.keymap.set('n', '<leader>tn', themes.nord, { desc = 'Nord Theme' })
vim.keymap.set('n', '<leader>ts', themes.sonokai, { desc = 'Sonokai Theme' })
vim.keymap.set('n', '<leader>to', themes.onedark, { desc = 'Onedark Theme' })
vim.keymap.set('n', '<leader>tg', themes.github, { desc = 'Github Theme' })
vim.keymap.set('n', '<leader>tc', themes.cyberdream, { desc = 'Cyberdream Theme' })

-- Автоматичне застосування дефолтної теми:
themes[default_theme]()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
