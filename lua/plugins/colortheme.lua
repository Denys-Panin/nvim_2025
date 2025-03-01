-- return {
--   'shaunsingh/nord.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Example config in lua
--     vim.g.nord_contrast = true
--     vim.g.nord_borders = false
--     vim.g.nord_disable_background = true
--     vim.g.nord_italic = false
--     vim.g.nord_uniform_diff_background = true
--     vim.g.nord_bold = false
--
--     -- Load the colorscheme
--     require('nord').set()
--
--     -- Toggle background transparency
--     local bg_transparent = true
--
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.nord_disable_background = bg_transparent
--       vim.cmd [[colorscheme nord]]
--     end
--
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }
-- return {
--   {
--     'sainnhe/sonokai',
--     priority = 1000,
--     config = function()
--       vim.g.sonokai_transparent_background = '1'
--       vim.g.sonokai_enable_italic = '1'
--       vim.g.sonokai_style = 'andromeda'
--       vim.cmd.colorscheme 'sonokai'
--     end,
--   },
-- }
return {
  {
    'navarasu/onedark.nvim',
    lazy = false, -- завантажувати відразу
    priority = 1000, -- пріоритет, щоб тема завантажувалась першою
    config = function()
      require('onedark').setup {
        style = 'deep', -- dark, darker, cool, deep, warm, warmer
        transparent = true, -- прозорий фон
        term_colors = true, -- змінювати кольори терміналу
        ending_tildes = true, -- показувати тільди (~) в порожніх рядках
      }
      require('onedark').load()
    end,
  },
}
-- return {
--   {
--     'scottmckendry/cyberdream.nvim',
--     lazy = false, -- щоб завантажувалась одразу
--     priority = 1000, -- щоб тема завантажувалась першою
--     config = function()
--       require('cyberdream').setup {
--         transparent = true, -- зробити фон прозорим (true/false)
--         italic_comments = true, -- курсив для коментарів
--         hide_fillchars = true, -- прибрати зайві символи заповнення
--       }
--       vim.cmd.colorscheme 'cyberdream'
--     end,
--   },
-- }
