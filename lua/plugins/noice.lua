return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        opts = {
          stages = 'fade_in_slide_out',
          timeout = 2000,
          render = 'default',
          top_down = false,
        },
        config = function(_, opts)
          local notify = require 'notify'
          notify.setup(opts)
          vim.notify = notify
        end,
      },
    },
    opts = {
      lsp = {
        progress = { enabled = true },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        signature = { enabled = true },
        hover = { enabled = true },
      },
      presets = {
        bottom_search = true, --search/replace at the bottom of the screen 
        command_palette = true, --CMD palette in the center 
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      routes = {
       -- mute "written" messages and similar noise 
        { filter = { event = 'msg_show', find = 'written' }, opts = { skip = true } },
      },
      cmdline = {
        view = 'cmdline_popup',
        format = {
          cmdline = { icon = '' },
          search_forward = { icon = '' },
          search_reverse = { icon = '' },
        },
      },
      views = {
        cmdline_popup = { border = { style = 'rounded' } },
        hover = { border = { style = 'rounded' } },
        mini = { win_options = { winblend = 0 } },
      },
    },
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {
      input = {
        border = 'rounded',
        relative = 'editor',
        prefer_width = 0.4,
      },
      select = {
        backend = { 'telescope', 'builtin' },-- if you have a Telescope, it will be nice 
        builtin = {
          border = 'rounded',
        },
      },
    },
  },
}
