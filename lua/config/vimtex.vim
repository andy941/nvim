" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_automatic = 0
let g:vimtex_view_forward_search_on_start = 1

" latexmk options
let g:vimtex_compiler_latexmk = {
			\ 'build_dir' : {-> expand("%:t:r_build")},
			\ 'callback' : 1,
			\ 'continuous' : 1,
			\ 'executable' : 'latexmk',
			\ 'hooks' : [],
			\ 'options' : [
				\   '-verbose',
				\   '-file-line-error',
				\   '-synctex=1',
				\   '-interaction=nonstopmode',
				\ ],
				\}

" Close viewers when VimTeX buffers are closed
  function! CloseViewers()
    if executable('xdotool')
          \ && exists('b:vimtex.viewer.xwin_id')
          \ && b:vimtex.viewer.xwin_id > 0
      call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
    endif
  endfunction
  augroup vimtex_event_2
    au!
    au User VimtexEventQuit call CloseViewers()
  augroup END
