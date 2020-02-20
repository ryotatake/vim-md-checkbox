if exists('b:ftplugin_markdown_md_checkbox')
  finish
endif
let b:ftplugin_markdown_md_checkbox = 1

let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <buffer> <C-c> :<C-u>call md_checkbox#toggle()<CR>
vnoremap <silent> <buffer> <C-c> :call md_checkbox#toggle()<CR>
nnoremap <silent> <buffer> <C-b> :<C-u>call md_checkbox#create()<CR>
vnoremap <silent> <buffer> <C-b> :call md_checkbox#create()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
