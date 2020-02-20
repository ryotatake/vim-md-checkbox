if exists('g:loaded_md_checkbox')
  finish
endif
let g:loaded_md_checkbox = 1

let s:save_cpo = &cpo
set cpo&vim



let &cpo = s:save_cpo
unlet s:save_cpo
