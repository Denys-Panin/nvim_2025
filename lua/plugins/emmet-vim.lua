return {
  {
    'mattn/emmet-vim',
    lazy = false, -- Load Emmet immediately
    config = function()
      vim.g.user_emmet_leader_key = ',' -- Change shortcut prefix (default: `<C-y>`)
    end,
  },
}
