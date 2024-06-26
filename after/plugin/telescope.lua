local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

vim.keymap.set('n', '<leader>fc', function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end)