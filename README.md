# configNeovim

πmy config-Neovim

### DirectoryTree
    nvim
        β   init.lua
        β
        ββββlua
            β   mappings.lua
            β
            ββββplugin
            β       install.lua
            β       plugins.lua
            β
            ββββsetting
                β   general.lua
                β
                ββββplugins
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
[build](https://github.com/MaskRay/ccls/wiki/Build "π€£") c/c++ language server

[formatting clangd](https://github.com/clangd/vscode-clangd/issues/313 "π") run the command ```clang-format -style=Microsoft -dump-config > .clang-format```
