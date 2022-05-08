--lspconfig
require'nvim-lsp-installer'.setup()
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {'clangd'}
for _, lsp in pairs(servers) do
    require'lspconfig'[lsp].setup {
        capabilities = capabilities
    }
end

--lspsignature
cfg = {
    hint_prefix = " 異",  --rocket for parameter
}
require'lsp_signature'.setup(cfg) --no need to specify bufnr if you don't use toggle_key
--require'lsp_signature'.on_attach(cfg, bufnr) --no need to specify bufnr if you don't use toggle_key

--betterescape
require'better_escape'.setup()
