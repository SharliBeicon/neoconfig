local map = vim.keymap.set

-- Telescope
local builtin = require 'telescope.builtin'
map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

map('n', '<leader>s/', function()
builtin.live_grep {
  grep_open_files = true,
  prompt_title = 'Live Grep in Open Files',
}
end, { desc = '[S]earch [/] in Open Files' })

vim.keymap.set('n', '<leader>sn', function()
builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

--Tabufline
map('n', '<leader>b', '<cmd>enew<CR>', { desc = 'buffer new' })

map('n', '<tab>', function()
	require('nvchad.tabufline').next()
end, { desc = 'buffer goto next' })

map('n', '<S-tab>', function()
	require('nvchad.tabufline').prev()
end, { desc = 'buffer goto prev' })

map('n', '<leader>x', function()
	require('nvchad.tabufline').close_buffer()
end, { desc = 'buffer close' })
