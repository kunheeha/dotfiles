"Plugin for workflow use

" Tabs for JSON
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab

" Automatic closing brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


function s:Jstep(...)
  if a:0 == 0
    :exe "normal o{\<CR>\"identifier\<esc>A: \"\<esc>A,\<CR>\"title\<esc>A: \"\<esc>A,\<CR>\"description\<esc>A: [\<CR>\<esc>O\"\<esc>A,\<CR>\"\<esc>jjA,"
  elseif a:0 == 1
    :exe "normal o{\<CR>\"identifier\<esc>A: \"".a:1."\<esc>A,\<CR>\"title\<esc>A: \"\<esc>A,\<CR>\"description\<esc>A: [\<CR>\<esc>O\"\<esc>A,\<CR>\"\<esc>jjA,"
  elseif a:0 == 2
    :exe "normal o{\<CR>\"identifier\<esc>A: \"".a:1."\<esc>A,\<CR>\"title\<esc>A: \"".a:2."\<esc>A,\<CR>\"description\<esc>A: [\<CR>\<esc>O\"\<esc>A,\<CR>\"\<esc>jjA,"
  endif
endfunction

function s:Jtask(...)
  let t:cwd = expand('%:p:h')
  :exe "botright vsplit" t:cwd."/".a:1.".json"
  :exe "normal i[\<CR>\<esc>ko{\<CR>\"identifier\<esc>A: \"".a:1."\<esc>A,\<CR>\"title\<esc>A: \"\<esc>A,\<CR>\"description\<esc>A: [\<CR>\<esc>O\"\<esc>A,\<CR>\"\<esc>jjA,"
endfunction

command -nargs=* Jstep :call s:Jstep(<f-args>)
command -nargs=* Jtask :call s:Jtask(<f-args>)
