source ../plugin/iObject.vim
edit test_numbers_001.in

" change unsigned numbers
1
call search('\d', 'W')
normal cani
normal j
normal canj
normal w
normal cank
call search('\d', 'W')
normal canl
call search('\d', 'W')
normal canm
call search('\d', 'We')
normal cann

write test_numbers_001.out
quit!
