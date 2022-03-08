"Plugin for workflow use

function s:Jif(...)
  :exe "normal a{%%\<esc>i  \<esc>iif\<esc>l"
  if a:1 == "field"
    :exe "normal i case.get_field('\<esc>"
  endif
endfunction

function s:Jelif(...)
  :exe "normal a{%%\<esc>i  \<esc>ielif\<esc>l"
  if a:1 == "field"
    :exe "normal i case.get_field('\<esc>"
  endif
endfunction

function s:Jelse(...)
  :exe "normal a{%%\<esc>i  \<esc>ielse\<esc>f}"
endfunction

function s:Jendif(...)
  :exe "normal a{%%\<esc>i  \<esc>iendif\<esc>f}"
endfunction

function s:Jprecheck(...)
  if a:0 == 0
    :exe "normal o\"pre_checks\<esc>A: [\<CR>\<esc>A,\<esc>O{\<CR>\"\<esc>"
  elseif a:1 == "notin"
    :exe "normal o\"pre_checks\<esc>A: [\<CR>\<esc>A,\<esc>O{\<CR>\"field\<esc>A: \"\<esc>A,<CR>\"operation\<esc>A: \"not_in\<esc>A,<CR>\"value\<esc>A: [\<CR>\<esc>O\"\<esc>"
  elseif a:1 == "anyfieldset"
    :exe "normal o\"pre_checks\<esc>A: [\<CR>\<esc>A,\<esc>O{\<CR>\"field_names\<esc>A: [\<CR>\<esc>O\"\<esc>jA,\<CR>\"operation\<esc>A: \"any_field_set\<esc>"
  elseif a:1 == "anyfieldequals"
    :exe "normal o\"pre_checks\<esc>A: [\<CR>\<esc>A,\<esc>O{\<CR>\"field_names\<esc>A: [\<CR>\<esc>O\"\<esc>jA,\<CR>\"operation\<esc>A: \"any_field_equals\<esc>A,\<CR>\"value\<esc>A: \"\<esc>"
  elseif a:1 == "notset" 
    :exe "normal o\"pre_checks\<esc>A: [\<CR>\<esc>A,\<esc>O{\<CR>\"field\<esc>A: \"\<esc>A,<CR>\"operation\<esc>A: \"field_not_set\<esc>"
  endif 
endfunction

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
  let t:path = expand('%:p:h')
  let t:cwd = getcwd()
  :exe "botright vsplit" t:path."/".a:1.".json"
  :exe "normal i[\<CR>\<esc>ko{\<CR>\"identifier\<esc>A: \"".a:1."\<esc>A,\<CR>\"title\<esc>A: \"\<esc>A,\<CR>\"description\<esc>A: [\<CR>\<esc>O\"\<esc>A,\<CR>\"\<esc>jjA,"
  let t:match = matchstr(t:path, "buying")
  if t:match == "buying"
    let t:caseclonenew = findfile("new_property_new_mortgage_lender.json", "".t:path.";")
    :echo t:caseclonenew
  endif
endfunction

command -nargs=* Jstep :call s:Jstep(<f-args>)
command -nargs=* Jtask :call s:Jtask(<f-args>)
command -nargs=* Jprecheck :call s:Jprecheck(<f-args>)
command -nargs=* Jendif :call s:Jendif(<f-args>)
command -nargs=* Jif :call s:Jif(<f-args>)
command -nargs=* Jelif :call s:Jelif(<f-args>)
command -nargs=* Jelse :call s:Jelse(<f-args>)
"    :exe "botright vsplit" "/case_clone_definitions/new_property_same_mortgage_lender.json"
"    :exe "normal /tasks_not_to_copy\<CR>o\"".a:1."\<esc>A,\<esc>:w\<CR>"
