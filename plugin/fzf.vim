let g:fzf_action = {
	\ 't': 'tab split',
	\ 'i': 'tab vsplit',
	\ 's': 'split' }

function s:is_git_folder_repo()
	let git_dir = system('if [ -d .git   ]; then echo 1; else echo 2; fi')
	if git_dir == 1
		execute 'GFiles --cached --others --exclude-standard'
	else
		execute 'Files'
	endif
endfunction

command! FindInProject execute s:is_git_folder_repo()

map <Leader>f :FindInProject<CR>
map <Leader><Tab> :Buffers<CR>
