let R_objbr_place = 'script,right'
let R_objbr_w = 30
" let R_objbr_h = 30
let Rout_more_colors = 1
let R_hi_fun = 0
let R_routnotab = 1
let R_notmuxconf = 1
let R_rconsole_width = 0
let R_rconsole_height = 10
let R_clear_line = 1
let R_insert_mode_cmds = 1
let R_non_r_compl = 0
" let R_user_maps_only = 1
"let R_disable_cmds = ['RSetwd', 'RDputObj']
let rout_follow_colorscheme = 1

" keybindings
"
function! s:customNvimRMappings()
	nmap <buffer> <leader>rs <Plug>RStart
	imap <buffer> <leader>rs <Plug>RStart
	vmap <buffer> <leader>rs <Plug>RStart

	nmap <buffer> <C-c> <Plug>RStop
	imap <buffer> <C-c> <Plug>RStop
	vmap <buffer> <C-c> <Plug>RStop

	nmap <buffer> <Tab> <Plug>RDSendLine
	vmap <buffer> <Tab> <Plug>RDSendSelection

	nmap <buffer> <leader>sf <Plug>RSendFile

endfunction
augroup myNvimR
	au!
	autocmd filetype r call s:customNvimRMappings()
augroup end

