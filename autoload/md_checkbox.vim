function! md_checkbox#create() abort
  let lnum = line(".")
  let tmp = getline(lnum)

  if s:md_checkbox_exists(tmp)
    " do nothing
  else
    call s:md_checkbox_create(lnum, tmp)
  endif
endfunction

function! md_checkbox#check() abort
  let lnum = line(".")
  let tmp = getline(lnum)
  call s:md_checkbox_check(lnum, tmp)
endfunction

function! md_checkbox#uncheck() abort
  let lnum = line(".")
  let tmp = getline(lnum)
  call s:md_checkbox_uncheck(lnum, tmp)
endfunction

function! md_checkbox#toggle() abort
  let lnum = line(".")
  let tmp = getline(lnum)

  if s:md_checkbox_exists(tmp)
    if s:md_checkbox_checked(tmp)
      call s:md_checkbox_uncheck(lnum, tmp)
    else
      call s:md_checkbox_check(lnum, tmp)
    endif
  endif
endfunction

function! md_checkbox#toggle_or_create() abort
  let lnum = line(".")
  let tmp = getline(lnum)

  if s:md_checkbox_exists(tmp)
    if s:md_checkbox_checked(tmp)
      call s:md_checkbox_uncheck(lnum, tmp)
    else
      call s:md_checkbox_check(lnum, tmp)
    endif
  else
    call s:md_checkbox_create(lnum, tmp)
  endif
endfunction

function! s:md_checkbox_exists(line) abort
  return match(a:line, '\v^\s*(\*|-) [( |x)\]') != -1
endfunction

function! s:md_checkbox_ul_exists(line) abort
  return match(a:line, '\v(^\s*)(\*|-)') != -1
endfunction

function! s:md_checkbox_checked(line) abort
  return match(a:line, '\v(^\s*)(\*|-) [x\]') != -1
endfunction

function! s:md_checkbox_create(lnum, line) abort
  if s:md_checkbox_ul_exists(a:line)
    call s:md_checkbox_create_for_ul(a:lnum, a:line)
  else
    let str = substitute(a:line, '\v(^\s*)', '\1* [ \] ', "")
    call setline(a:lnum, str)
  endif
endfunction

function! s:md_checkbox_create_for_ul(lnum, line) abort
  let str = substitute(a:line, '\v(^\s*)(\*|-) =', '\1\2 [ \] ', "")
  call setline(a:lnum, str)
endfunction

function! s:md_checkbox_check(lnum, line) abort
  let new_line = substitute(a:line, '\v(^\s*)(\*|-) [ \]', '\1\2 [x\]', "")
  call setline(a:lnum, new_line)
endfunction

function! s:md_checkbox_uncheck(lnum, line) abort
  let new_line = substitute(a:line, '\v(^\s*)(\*|-) [x\]', '\1\2 [ \]', "")
  call setline(a:lnum, new_line)
endfunction
