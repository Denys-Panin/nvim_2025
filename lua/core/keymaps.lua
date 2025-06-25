-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.keymap.set('n', 'x', ':bdelete<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'x', function()
  local next_buf = vim.fn.bufnr('#')
  vim.cmd('bdelete')
  if vim.fn.buflisted(next_buf) == 1 then
    vim.cmd('buffer ' .. next_buf)
  else
    vim.cmd('bnext')
  end
end, { noremap = true, silent = true })

vim.keymap.set('n', 'xx', function()
  local bufs = vim.api.nvim_list_bufs()
  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, 'buftype') == '' then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { noremap = true, silent = true })

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- -- delete single character without copying into register
-- vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Diffview.nvim keymaps
vim.keymap.set('n', '<leader>go', '<cmd>DiffviewOpen<CR>', { desc = 'Відкрити Diffview' })
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<CR>', { desc = 'Закрити Diffview' })
vim.keymap.set('n', '<leader>gt', '<cmd>DiffviewToggleFiles<CR>', { desc = 'Переключити бічну панель' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', { desc = 'Історія поточного файлу' })
vim.keymap.set('n', '<leader>gl', '<cmd>DiffviewOpen HEAD~1<CR>', { desc = 'Порівняти з попереднім комітом' })
vim.keymap.set('n', '<leader>gr', '<cmd>DiffviewRefresh<CR>', { desc = 'Оновити Diffview' })
vim.keymap.set('n', '<leader>gm', '<cmd>DiffviewOpen main<CR>', { desc = 'Порівняти з main/master' })

-- Gitsigns.nvim keymaps
vim.keymap.set('n', '<leader>gb', function()
  require('gitsigns').blame_line({ full = true })
end, { desc = 'Показати blame для рядка' })

vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'Показати зміни (hunk)' })
vim.keymap.set('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', { desc = 'Закомітити частину змін (hunk)' })
vim.keymap.set('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = 'Відмінити staging hunk' })
vim.keymap.set('n', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>', { desc = 'Наступна зміна (hunk)' })
vim.keymap.set('n', '<leader>gN', '<cmd>Gitsigns prev_hunk<CR>', { desc = 'Попередня зміна (hunk)' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>', { desc = 'Порівняти з HEAD' })
vim.keymap.set('n', '<leader>gD', '<cmd>Gitsigns toggle_deleted<CR>', { desc = 'Показати/сховати видалені рядки' })

-- Live server
vim.keymap.set('n', '<leader>ls', function()
  vim.fn.jobstart('live-server .', { detach = true })
  print 'Live Server запущено 🚀'
end, { desc = 'Запустити Live Server' })

vim.keymap.set('n', '<leader>le', function()
  vim.fn.jobstart('pkill -f live-server', { detach = true })
  print 'Live Server зупинено ❌'
end, { desc = 'Зупинити Live Server' })

-- Unmark search word
vim.keymap.set('n', '<leader>,', ':noh<CR>', { noremap = true, silent = true })

-- PHP formatting with php-cs-fixer
vim.keymap.set('n', '<leader>pf', function()
  vim.cmd('!php-cs-fixer fix --config=' .. vim.fn.stdpath('config') .. '/tools_config/php-cs-fixer.php %')
  vim.cmd('edit')
end, { noremap = true, silent = true, desc = 'Format PHP file with local fixer config' })

-- Laravel formatting
vim.keymap.set('n', '<leader>lf', function()
  vim.cmd('!pint %')
  vim.cmd('edit')
end, { noremap = true, silent = true, desc = 'Laravel Pint форматування' })

-- Search in HTML files
vim.keymap.set('n', '<leader>sh', function()
  require('telescope.builtin').grep_string({
    search = vim.fn.expand('<cword>'),
    additional_args = function()
      return { "--glob=**/*.html" }
    end
  })
end, { desc = "Search in HTML files" })

-- Search in CSS files
vim.keymap.set('n', '<leader>sc', function()
  require('telescope.builtin').grep_string({
    search = vim.fn.expand('<cword>'),
    additional_args = function()
      return { "--glob=**/*.css", "--glob=**/*.scss" }
    end
  })
end, { desc = "Search in CSS/SCSS files" })

-- Search in JS files
vim.keymap.set('n', '<leader>sj', function()
  require('telescope.builtin').grep_string({
    search = vim.fn.expand('<cword>'),
    additional_args = function()
      return { "--glob=**/*.js" }
    end
  })
end, { desc = "Search in JS files" })

-- Trouble diagnostics (for v2)
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (workspace + buffer)" })
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "LSP References" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Quickfix list" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "Document symbols" })

-- Telescope diagnostics
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Search diagnostics (Telescope)", noremap = true, silent = true })

-- Copying file path
vim.keymap.set('n', '<leader>cp', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path, vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = 'Copy full file path to clipboard' })

-- Formatter JSON
vim.keymap.set("n", "<leader>fj", function()
  require("conform").format()
end, { desc = "Format JSON" })

