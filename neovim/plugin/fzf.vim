let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--prompt=Files: ']}), <bang>0)

