" ============================================================================
" File:        iObject - Extra Text Objects for Vim
" Description: A set of text objects to extend this already useful Vim feature
" Author:      Barry Arthur <barry dot arthur at gmail dot com>
" Last Change: 7 August, 2010
" Website:     http://github.com/dahu/iObject
"
" See iObject.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help iObject
"
" Licensed under the same terms as Vim itself.
" ============================================================================
let s:iObject_version = '0.0.0'  " alpha, unreleased

""""""""""""""""""""
" Numbers (Integers)
""""""""""""""""""""

function! s:VAN(...)
  let inside = (a:0 == 1) ? 1 : 0
  let [lcol, rcol] = [0,0]
  if search('\m[-+]\?\d\+\%#', 'bnc', line('.'))
        \ || search('\m\%#[-+0-9]', 'nc', line('.'))
    if inside
      " select just the digits (ignoring possible leading [-+])
      " move the cursor right if on [-+]
      call search('\m\%#[-+].', 'ce', line('.'))
      " abort if [-+] didn't start a number
      if search('\m\%#[^0-9]', 'cn', line('.'))
        return "\<C-\>\<C-n>\<Esc>"
      endif
      let [lnum, lcol] = searchpos('\m\d*\%#\d*', 'bnc', line('.'))
      let [lnum, rcol] = searchpos('\m\%#\d\+', 'nce', line('.'))
    else
      " select the whole number (including possible leading [-+])
      let [lnum, lcol] = searchpos('\m[-+]\?\d*\%#\d*', 'bnc', line('.'))
      let [lnum, rcol] = searchpos('\m\%(\%#[-+0-9]\d\+\)\|\%(\%#\d\+\)', 'nce', line('.'))
      if rcol == 0
        return "\<C-\>\<C-n>\<Esc>"
      endif
    endif
  else
    return "\<C-\>\<C-n>\<Esc>"
  endif
  exe "return '" . lcol . "|o" . rcol . "|'"
endfunction

" The only sensible interpretation of being 'inside' a number I could think of...
" taking only 12345 from -12345 / +12345
function! s:VIN()
  let vin = s:VAN(1)
  return vin
endfunction

vnoremap <expr> an <SID>VAN()
vnoremap <expr> in <SID>VIN()
onoremap an :normal van<CR>
onoremap in :normal vin<CR>
