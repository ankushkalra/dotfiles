vim.cmd([[
function! GStatusGetFilenameUnderCursor()
    return matchstr(getline('.'), '^[A-Z?] \zs.*')
endfunction

command! GdiffsplitTab call GdiffsplitTab(expand("%"))
function! GdiffsplitTab(filename)
    exe 'tabedit ' . a:filename
    Gvdiffsplit
endfunction

" custom mapping in fugitive window (:Git)
augroup custom_fugitive_mappings
    au!
    au User FugitiveIndex nnoremap <buffer> dt :call GdiffsplitTab(GStatusGetFilenameUnderCursor())<cr>
augroup END
]])
