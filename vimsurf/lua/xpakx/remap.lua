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

local function gf_http_link()
    -- Get the word under the cursor (assumed to be a URL)
    local url = vim.fn.expand('<cfile>')

    -- Check if the word under the cursor is an HTTP/HTTPS URL
    if not url:match('^https?://') then
        -- If not a URL, fall back to the default `gf` behavior
        vim.cmd('normal! gf')
        return
    end

    -- Extract the last part of the URL (e.g., "page" from "https://example.com/page")
    local last_part = url:match('/([^/]+)/?$') or 'page'

    -- Remove query parameters or fragments
    last_part = last_part:gsub('[?#].*$', '')

    local html_file = 'temp.html'
    local md_file = last_part .. '.md'

    local curl_cmd = string.format('curl -s "%s" > %s', url, html_file)
    os.execute(curl_cmd)

    local pandoc_cmd = string.format('pandoc --output %s -t gfm-raw_html %s', md_file, html_file)
    os.execute(pandoc_cmd)

    vim.cmd('edit ' .. md_file)
end

vim.keymap.set('n', 'gf', gf_http_link, { noremap = true, silent = true })
