function! s:CRefresh()
    let paths = substitute(escape(&runtimepath, ' '), '\(,\|$\)', '/**\1', 'g')
    let cmd = findfile('cssrefresh.sh', paths)

    let fn = expand("%:t:r")
    let cmdline = cmd . ' ' . fn
    exec '!' . cmdline . ' 2>&1 >/dev/null'
endfunction

com! CRefresh call s:CRefresh()
autocmd! bufwritepost *.less,*.css CRefresh
