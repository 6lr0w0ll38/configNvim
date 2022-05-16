local function map(mode, lhs, rhs, opts)
    local options = { silent = true, noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opt)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--general mappings
--file
map("n", "w", ":w<CR>")
map("n", "q", ":q!<CR>")
map("n", "wq", ":wq<CR>")
map("n", "<F5>", ":%source<CR>") --reload
map("n", "<C-c>", ":%y<CR>") --copy whole file content

--use ESC to turn off search highlighting
map("n", "<Esc>", ":noh<CR>")

--move cursor within insert mode
map("i", "<C-k>", "<Up>")
map("i", "<C-e>", "<End>") --endline
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-l>", "<Right>")
map("i", "<C-b>", "<Esc>^i") --beginline

--navigation between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

--below are all plugin related mappings
--bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")

--comment
map("n", "<Leader><Leader>", ":lua require'Comment.api'.toggle_current_linewise()<CR>")
map("v", "<Leader><Leader>", "<Esc>:lua require'Comment.api'.toggle_linewise_op(vim.fn.visualmode())<CR>")

--nvim Tree
map("n", "<Leader>t", ":NvimTreeToggle<CR>")
map("n", "<Leader>c", ":NvimTreeFindFile<CR>")

--telescope
map("n", "<Leader>bm", ":Telescope marks<CR>")
map("n", "<Leader>fm", ":Telescope keymaps<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fo", ":Telescope oldfiles<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fw", ":Telescope live_grep<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>gs", ":Telescope git_status<CR>")
map("n", "<Leader>gc", ":Telescope git_commits<CR>")
map("n", "<Leader>cc", ":Telescope colorscheme<CR>")
map("n", "<Leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")

--lsp
map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
map("n", "gr", ":lua vim.lsp.buf.references()<CR>")
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<Space>f", ":lua vim.diagnostic.open_float()<CR>")
map("n", "<Space>q", ":lua vim.diagnostic.setloclist()<CR>")
map("n", "<Space>k", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "<Space>D", ":lua vim.lsp.buf.type_definition()<CR>")
map("n", "<Space>rn", ":lua vim.lsp.buf.rename()<CR>")
map("n", "<Space>fm", ":lua vim.lsp.buf.formatting()<CR>")
map("n", "<Space>ca", ":lua vim.lsp.buf.code_action()<CR>")
map("n", "<Space>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>")
map("n", "<Space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>")
map("n", "<Space>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

--cmp
local cmp = require'cmp'
cmp.setup {
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require'luasnip'.expand_or_jumpable() then
                require'luasnip'.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require'luasnip'.jumpable(-1) then
                require'luasnip'.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
}
