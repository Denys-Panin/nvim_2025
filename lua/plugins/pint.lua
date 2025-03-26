return {
  'laravel/pint',
  build = function()
    vim.fn.system({
      'composer', 'global', 'require', 'laravel/pint'
    })
  end,
  lazy = true,
}

