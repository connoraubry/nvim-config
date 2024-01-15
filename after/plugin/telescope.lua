local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = "Find files (git repo)"})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {desc = "Find grep string"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find help tags"})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {desc = "Find diagnostic"})

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules", "venv", "dist", "bin", "__pycache__"
        }
    }
}
