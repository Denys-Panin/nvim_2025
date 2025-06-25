return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        json = { "jq" },
        -- тут можна додати інші формати пізніше
      },
    })

    -- необов'язково: можна зробити автозапуск при збереженні
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   pattern = "*",
    --   callback = function(args)
    --     require("conform").format({ bufnr = args.buf })
    --   end,
    -- })
  end,
}

