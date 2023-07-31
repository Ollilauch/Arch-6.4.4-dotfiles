" numbers
 :set number
 :set relativenumber

" text wrapping
 :set nowrap

" indent
 :set autoindent
 :set tabstop=4
 :set shiftwidth=0
 :set expandtab


" source file of vim-plug
 source $HOME/.config/nvim/vim-plug/plugins.vim

" colorcheme
 colorscheme catppuccin-mocha

" Use tab to trigger autocompletion coc
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" lua config
lua << EOF
    require('nvim-treesitter.configs').setup{ensure_installed = "c", "zig", "cpp", "ts", "python", "org", auto_install = true, highlight = { enable = true, additional_vim_regex_highlighting = {'org'} }, indent = { enable = true}}
    require('nvim-autopairs').setup{} 
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup({
         org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
         org_default_notes_file = '~/notes/refile.org',
         org_hilight_latex_and_related = "entities",
         emacs_config = { executable_path = 'emacs', config_path='$HOME/.config/emacs/init.el' }
    })
    require'sniprun'.setup({
    interpreter_options = {
        C_original = {
             compiler = "gcc"
            }
        }
    })
    require('neorg').setup {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/notes/norg",
                    },
                    default_workspace = "notes",
                },
            },
        },
    }
EOF

" LATEX config

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
 filetype plugin on

 syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
 let g:vimtex_view_method = 'zathura'

 let g:vimtex_compiler_method = 'latexmk'

 function! InstallPackages()
    let winview = winsaveview()
    call inputsave()
    let cmd = ['sudo -S tlmgr install']
    %call add(cmd, matchstr(getline('.'), '\\usepackage\(\[.*\]\)\?{\zs.*\ze\}'))
    echomsg join(cmd)
    let pass = inputsecret('Enter sudo password:') . "\n"
    echo system(join(cmd), pass)
    call inputrestore()
    call winrestview(winview)
endfunction

command! InstallPackages call InstallPackages()

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab'>
" `my_snippets` is the directory we created before
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
