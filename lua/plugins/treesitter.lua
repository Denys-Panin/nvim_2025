return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {}, -- ВАЖЛИВО: має бути список, навіть якщо порожній
  opts = {
    ensure_installed = {
      'lua', 'python', 'javascript', 'typescript', 'vimdoc', 'vim',
      'regex', 'terraform', 'sql', 'dockerfile', 'toml', 'json', 'java',
      'groovy', 'go', 'gitignore', 'graphql', 'yaml', 'make', 'cmake',
      'markdown', 'markdown_inline', 'bash', 'tsx', 'css', 'html'
    },
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = { 'ruby' } },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)

    -- 🔹 Функція для додавання класів із виділеного HTML у CSS
    function _G.ExtractSelectedHtmlClasses()
        local classes = {}

        -- Отримуємо виділений текст
        local start_line, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
        local end_line, end_col = unpack(vim.fn.getpos("'>"), 2, 3)

        local selected_lines = vim.fn.getline(start_line, end_line)
        if #selected_lines == 0 then return end

        -- Вирізаємо правильну частину для першого та останнього рядка
        selected_lines[1] = string.sub(selected_lines[1], start_col)
        selected_lines[#selected_lines] = string.sub(selected_lines[#selected_lines], 1, end_col)

        -- Обробляємо кожен рядок і шукаємо класи
        for _, line in ipairs(selected_lines) do
            for class_list in line:gmatch('class="(.-)"') do
                for class_name in class_list:gmatch("%S+") do
                    classes[class_name] = true
                end
            end
        end

        -- Визначаємо шлях до файлу styles.css
        local css_dir = vim.fn.getcwd() .. "/css"
        local css_file = css_dir .. "/styles.css"

        -- Перевіряємо, чи існує директорія, і якщо ні, створюємо її
        if vim.fn.isdirectory(css_dir) == 0 then
            vim.fn.mkdir(css_dir, "p")
        end

        local existing_classes = {}

        -- Якщо файл існує, зчитуємо його вміст
        if vim.fn.filereadable(css_file) == 1 then
            local lines = vim.fn.readfile(css_file)
            for _, line in ipairs(lines) do
                local existing_class = line:match("^%s*%.([%w%-_]+)%s*{")
                if existing_class then
                    existing_classes[existing_class] = true
                end
            end
        end

        -- Формуємо CSS-код, додаючи тільки нові класи
        local css_lines = {}
        if vim.fn.filereadable(css_file) == 1 then
            css_lines = vim.fn.readfile(css_file) -- Зчитуємо існуючий CSS
        else
            table.insert(css_lines, "/* Generated styles.css */") -- Додаємо заголовок, якщо файл новий
        end

        for class_name, _ in pairs(classes) do
            if not existing_classes[class_name] then
                table.insert(css_lines, "." .. class_name .. " {}")
            end
        end

        -- Записуємо в styles.css, зберігаючи існуючі стилі
        vim.fn.writefile(css_lines, css_file)

        print("✅ CSS-файл оновлено: " .. css_file)

        -- Відкриваємо styles.css у Neovim
        vim.cmd(string.format("edit %s", css_file))
    end

    -- 🔹 Прив’язуємо до Visual Mode (виділення + <leader>ec)
    vim.api.nvim_set_keymap("v", "<leader>ec", ":lua ExtractSelectedHtmlClasses()<CR>", { noremap = true, silent = true })
  end,
}

