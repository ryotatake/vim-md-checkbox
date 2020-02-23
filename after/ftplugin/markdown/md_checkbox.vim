if exists('b:ftplugin_markdown_md_checkbox')
  finish
endif
let b:ftplugin_markdown_md_checkbox = 1

let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <Plug>(md_checkbox_toggle) :<C-u>call md_checkbox#toggle()<CR>
vnoremap <silent> <Plug>(md_checkbox_toggle_v) :call md_checkbox#toggle()<CR>
nnoremap <silent> <Plug>(md_checkbox_create) :<C-u>call md_checkbox#create()<CR>
vnoremap <silent> <Plug>(md_checkbox_create_v) :call md_checkbox#create()<CR>

if !get(g:, 'md_checkbox_no_default_key_mappings', 0)
  if !hasmapto('<Plug>(md_checkbox_toggle)')
    nmap <unique> <buffer> <C-c> <Plug>(md_checkbox_toggle)
  endif

  if !hasmapto('<Plug>(md_checkbox_toggle_v)')
    vmap <unique> <buffer> <C-c> <Plug>(md_checkbox_toggle_v)
  endif

  if !hasmapto('<Plug>(md_checkbox_create)')
    nmap <unique> <buffer> <C-b> <Plug>(md_checkbox_create)
  endif

  if !hasmapto('<Plug>(md_checkbox_create_v)')
    vmap <unique> <buffer> <C-b> <Plug>(md_checkbox_create_v)
  endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo
