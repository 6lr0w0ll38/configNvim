# configNeovim

🎁my config-Neovim

### DirectoryTree
    nvim
        │   init.lua
        │
        └───lua
            │   mappings.lua
            │
            ├───plugin
            │       install.lua
            │       plugins.lua
            │
            └───setting
                │   general.lua
                │
                └───plugins
                        alpha.lua
                        bufferline.lua
                        cmp.lua
                        comment.lua
                        feline.lua
                        gitsings.lua
                        lsp.lua
                        telescope.lua
                        tokyonight.lua
                        tree.lua
                        treesitter.lua
### Lsp + Formatting
[build](https://github.com/MaskRay/ccls/wiki/Build "🤣") c/c++ language server

[formatting clangd](https://github.com/clangd/vscode-clangd/issues/313 "😅") run the command ```clang-format -style=Microsoft -dump-config > .clang-format```
