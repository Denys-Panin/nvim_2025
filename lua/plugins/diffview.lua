return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFileHistory' },
    config = function()
      require('diffview').setup {
        enhanced_diff_hl = true, -- Покращене підсвічування змін
        view = {
          merge_tool = {
            layout = 'diff3_mixed',
          },
        },
      }
    end,
  },
}
