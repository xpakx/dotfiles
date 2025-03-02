vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>pp", [["+p]])
vim.keymap.set("n", "<M-k>", ':wincmd k<CR>')
vim.keymap.set("n", "<M-j>", ':wincmd j<CR>')
vim.keymap.set("n", "<M-h>", ':wincmd h<CR>')
vim.keymap.set("n", "<M-l>", ':wincmd l<CR>')

vim.keymap.set("n", "[q", ':cp!<cr>')
vim.keymap.set("n", "]q", ':cn!<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP keybindings',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end
})
