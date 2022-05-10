local cmd = vim.cmd
local opt = vim.opt --to set option

--file
cmd('set noswapfile') --no swap file
opt.shadafile = "NONE" --no shadafile

--display
opt.list = true --show some invisible characters
opt.title = true --allows nvim to send the terminal details of the current window
opt.number = true --show line number
opt.hidden = true --enable background buffers
opt.encoding = "utf-8" --default encoding to UTF-8
opt.showmode = true --display mode
opt.linebreak = true --stop words being broken on wrap
opt.scrolloff = 4 --line of context
opt.signcolumn = "yes:1" --always show signcolumns
opt.sidescrolloff = 8 --colume of context
    --highlight
opt.hlsearch = true --highlight found searches
opt.cursorline = true --highlight line
opt.cursorcolumn = true --highlight colum
    --color
opt.termguicolors = true --change expericence for diagnostic messages(default 4000)
    --indentation
opt.tabstop = 4 --number of spaces tabs count for
opt.expandtab = true --use spaces instead of tabs
opt.shiftwidth = 4 --size of an indent
opt.shiftround = true --round indent
opt.autoindent = true
opt.smartindent = true --insert indents automatically
opt.softtabstop = 4

--function
opt.mouse = "a" --mouse
opt.incsearch = true --shows the match while typing
opt.clipboard = "unnamedplus" --use clipboard
opt.smartcase = true --do not ignore case with capitals
opt.ignorecase = true --ignore case
opt.foldenable = false
opt.foldmethod = "indent"
opt.inccommand = "split" --get a preview of replacements
opt.splitbelow = true --put new windows below current
opt.splitright = true --put new windows right current
opt.completeopt = "menu,menuone,noselect" --cmp
opt.formatoptions = "l"

--load plugins
require'plugin.plugins'

--load mappings
require'mappings'
