source ../plugin/iObject.vim
edit test_numbers_002.in

" delete unsigned numbers
1
call search('\d', 'W')
normal dan
call search('\d', 'W')
normal dan
call search('\d', 'W')
normal dan
call search('\d', 'W')
normal dan
call search('\d', 'W')
normal dan
call search('\d', 'W')
normal dan
call search('\d', 'W')
normal dan

write test_numbers_002.out
quit!
