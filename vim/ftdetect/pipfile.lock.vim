augroup detect_pipfile_lock
  autocmd BufNewFile,BufRead Pipfile.lock	setf json
augroup END
