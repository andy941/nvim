let R_objbr_place = 'console,right'
let R_objbr_h = winheight(0) / 2
let R_objbr_w = winwidth(0) / 5
let R_objbr_opendf = 0
let Rout_more_colors = 1
let R_hi_fun = 0
let R_routnotab = 1
let R_notmuxconf = 1
let R_rconsole_width = winwidth(0) / 4
let R_rconsole_height = winheight(0) / 5
let R_clear_line = 1
let R_insert_mode_cmds = 1
let R_non_r_compl = 0
let R_nvimpager = 'vertical'
" let R_user_maps_only = 1
" let R_disable_cmds = ['RSetwd', 'RDputObj']
let R_assign_map = '__'
let rout_follow_colorscheme = 1

" keybindings
function! s:customNvimRMappings()
	nmap <buffer> <leader>rs <Plug>RStart
	imap <buffer> <leader>rs <Plug>RStart
	vmap <buffer> <leader>rs <Plug>RStart

	nmap <buffer> <C-c> :RStop<cr>
	imap <buffer> <C-c> :RStop<cr>
	vmap <buffer> <C-c> :RStop<cr>

	nmap <buffer> <Tab> <Plug>RDSendLine
	vmap <buffer> <Tab> <Plug>RDSendSelection
endfunction

augroup myNvimR
	au!
	autocmd filetype r call s:customNvimRMappings()
augroup end

