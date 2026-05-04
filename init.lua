-- visual
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.background = "dark"
vim.opt.ruler = true

-- editing
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.mouse = ""
vim.opt.cinoptions:append("l1")

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- menu
vim.opt.wildmenu = true

-- autoreloading
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- setup plugins
require("config.lazy")

-- keymap: normal
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "File tree" })
vim.keymap.set("n", "<Leader>T", "<Cmd>Translate JA<CR>", { desc = "Translate" })
vim.keymap.set("n", "<Leader>x", "<Cmd>Trouble diagnostics toggle<CR>", { noremap = true, silent = true, desc = "Diagnostics" })
vim.api.nvim_create_autocmd("LspAttach", {  -- enabled when LSP is active
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
  end,
})
vim.keymap.set("n", "<Leader>cc", "<Cmd>ClaudeCode<CR>", { noremap = true, silent = true, desc = "Open" })
vim.keymap.set("n", "<Leader>cf", "<Cmd>ClaudeCodeFocus<CR>", { noremap = true, silent = true, desc = "Focus" })
vim.keymap.set("n", "<Leader>cr", "<Cmd>ClaudeCode --resume<CR>", { noremap = true, silent = true, desc = "Resume" })
vim.keymap.set("n", "<Leader>tt", "<Cmd>1ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 1" })
vim.keymap.set("n", "<Leader>t1", "<Cmd>1ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 1" })
vim.keymap.set("n", "<Leader>t2", "<Cmd>2ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 2" })
vim.keymap.set("n", "<Leader>t3", "<Cmd>3ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 3" })
vim.keymap.set("n", "<Leader>t4", "<Cmd>4ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 4" })
vim.keymap.set("n", "<Leader>t5", "<Cmd>5ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 5" })
vim.keymap.set("n", "<Leader>ts", "<Cmd>TermSelect<CR>", { noremap = true, silent = true, desc = "Select terminal" })
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- keymap: visual
-- ga: align
-- gA: align with preview
vim.keymap.set("v", "<Leader>t", "<Cmd>Translate JA<CR>", { desc = "Translate" })
vim.keymap.set("v", "<Leader>cs", "<Cmd>ClaudeCodeSend<CR>", { noremap = true, silent = true, desc = "Send selection" })

-- keymap: terminal
vim.keymap.set("t", "<C-w>N", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-w>:", "<C-\\><C-n>:", { noremap = true })
vim.keymap.set("t", "<C-w>w", "<C-\\><C-n><C-w>w", { noremap = true })
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { noremap = true })
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j", { noremap = true })
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k", { noremap = true })
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l", { noremap = true })
vim.keymap.set("t", "<C-w>gt", "<C-\\><C-n><C-w>gt", { noremap = true })
