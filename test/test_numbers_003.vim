source ../plugin/iObject.vim
edit test_numbers_003.in

" delete unsigned numbers
1
" move to leading -/+ sign character
call search('-', 'W')
normal cini
call search('-', 'W')
normal canj
call search('+', 'W')
normal cini
call search('+', 'W')
normal canj

" move to start of numbers
call search('\d', 'W')
normal canj
call search('\d', 'W')
normal cank
call search('\d', 'W')
normal cinj
call search('\d', 'W')
normal cink

" move inside a number or to the end of a number
call search('\d\d', 'We')
normal cinj
call search('\d\+', 'We')
normal cank
call search('\d\d', 'We')
normal canj
call search('\d\+', 'We')
normal cink

write test_numbers_003.out
quit!
