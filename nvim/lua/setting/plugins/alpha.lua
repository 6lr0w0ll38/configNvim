local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = {
    [[  PTITL                                                  ]],
    [[                                                          ]],
    [[                                 _ :         _ :          ]],
    [[                                                          ]],
    [[      -:                      -:'         -:'             ]],
    [[                                                          ]],
    [[     _:  -.     . - .        -:          -:      . -.     ]],
    [[                                                          ]],
    [[    _:    :   _: . -'       _:          _:      :     ;   ]],
    [[                                                          ]],
    [[   .:           ; ; '   _ ; : _.-   _ ; : _.-    `:: '    ]]
}

local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl = "Function"
    b.opts.hl_shortcut = "Type"
    return b
end

dashboard.section.buttons.val= {
    button("q", "  Quit", ":q!<CR>"),
    button("<Leader>ff", "  Find File", ":Telescope find_files<CR>"),
    button("<Leader>fw", "  Find Word", ":Telescope live_grep<CR>"),
    button("<Leader>bm", "  Bookmarks", ":Telescope marks<CR>"),
    button("<leader>cc", "  Themes", ":Telescope colorscheme<CR>"),
    button("<Leader>fo", "  Recent File", ":Telescope oldfiles<CR>"),
}

require'alpha'.setup(dashboard.opts)
