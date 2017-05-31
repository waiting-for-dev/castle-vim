"ruby 2 indent rule
set tabstop=2 shiftwidth=2 softtabstop=2

" Make rubocop happy
setlocal textwidth=80

"autoclose end
imap <C-e> <CR><CR>end<Esc>-cc

"some abbreviation
abbreviate saop save_and_open_page
abbreviate bp binding.pry

"vimrails
if exists("b:rails_root")
  let g:rails_projections = {
        \ "spec/views/*_spec.rb": {
        \   "command": "viewspec",
        \   "alternate": "app/views/%s"
        \ },
        \ "spec/jobs/*_job_spec.rb": {
        \   "command": "jobspec",
        \   "alternate": "app/jobs/%s_job.rb"
        \ }
        \}
endif

" https://github.com/majutsushi/tagbar/wiki#ruby
" use 'ripper-tags' (if available) to generate ruby ctags with tagbar
if executable('ripper-tags')
  " Configure Tagbar to user ripper-tags with ruby
  let g:tagbar_type_ruby = {
        \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'f:methods',
        \ 'F:singleton methods',
        \ 'C:constants',
        \ 'a:aliases',
        \ ],
        \ 'ctagsbin': 'ripper-tags',
        \ 'ctagsargs': ['-f', '-']
        \ }
  " Auto-generate tags with ripper-tags
  let g:gutentags_ctags_executable_ruby = 'ripper-tags'
endif
