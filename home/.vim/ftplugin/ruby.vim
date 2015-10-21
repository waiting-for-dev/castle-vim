"ruby 2 indent rule
set tabstop=2 shiftwidth=2 softtabstop=2
"autoclose end
imap <C-e> <CR><CR>end<Esc>-cc
"some abbreviation
abbreviate saop save_and_open_page
abbreviate bp binding.pry

"vimrails
if exists("b:rails_root")
   "run current test
   map <leader>r :.Runner<CR>
   "run current file tests
   map <leader>R :Rrunner<CR>
   "run all test suite in the background
   map <leader>A :Dispatch! :Runner spec<CR>
   "run current file rake
   map <leader>K :Rake<CR>
   "run current line rake
   map <leader>k :.Rake<CR>
   let g:rails_projections = {
            \ "db/seeds/*.seeds.rb": {"command": "seed"},
            \ "spec/views/*_spec.rb": {
            \   "command": "viewspec",
            \   "alternate": "app/views/%s",
            \   "template":
            \     ["require 'spec_helper'", "describe \"%s\" do", "end"],
            \ },
            \ "app/admin/*.rb": {
            \   "command": "admin",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "template":
            \     "ActiveAdmin.register %S do\n\n end"
            \ },
            \ "app/uploaders/*_uploader.rb": {
            \   "command": "uploader",
            \   "template":
            \     "class %SUploader < CarrierWave::Uploader::Base\n\nend"
            \ },
            \ "app/policies/*_policy.rb": {
            \   "command": "policy",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "alternate": "spec/policies/%s_policy_spec.rb",
            \   "template":
            \     "class %SPolicy < ApplicationPolicy \n\nend"
            \ },
            \ "spec/policies/*_policy_spec.rb": {
            \   "command": "policyspec",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "alternate": "app/policies/%s_policy.rb",
            \   "template":
            \     "require 'rails_helper'\n\ndescribe %SPolicy do\n  subject {open} %SPolicy.new(user, record) {close}\n\nend"
            \ },
            \ "app/validators/*_validator.rb": {
            \   "command": "validator",
            \   "alternate": "spec/validators/%s_validator_spec.rb",
            \   "template":
            \     "class  %SValidator < ActiveModel::Validator\n  def validate(record)\n  end\nend"
            \ },
            \ "spec/validators/*_validator_spec.rb": {
            \   "command": "validatorspec",
            \   "alternate": "app/validators/%s_validator.rb",
            \   "template":
            \     "require 'rails_helper'\n\nclass Validatable\n  include ActiveModel::Validations\nend\n\ndescribe %SValidator do\n  subject {open} Validatable.new {close}\nend"
            \ },
            \ "app/services/*.rb": {
            \   "command": "service",
            \   "alternate": "spec/services/%s_spec.rb",
            \   "template":
            \     "class  %S\n\nend"
            \ },
            \ "spec/services/*_spec.rb": {
            \   "command": "servicespec",
            \   "alternate": "app/services/%s.rb",
            \   "template":
            \     "require 'rails_helper'\n\ndescribe %S do\n\nend"
            \ },
            \ "app/queries/*_query.rb": {
            \   "command": "query",
            \   "affinity": "model",
            \   "related": "app/models/%s_query.rb",
            \   "alternate": "spec/queries/%s_query_spec.rb",
            \   "template":
            \     "class  %S\n\nend"
            \ },
            \ "spec/queries/*_query_spec.rb": {
            \   "command": "queryspec",
            \   "affinity": "model",
            \   "related": "app/models/%s_query.rb",
            \   "alternate": "app/queries/%s_query.rb",
            \   "template":
            \     "require 'rails_helper'\n\ndescribe %SQuery do\n\nend"
            \ },
            \ "app/serializers/*_serializer.rb": {
            \   "command": "serializer",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "alternate": "test/serializers/%s_serializer_test.rb",
            \   "template":
            \     "class  %SSerializer < Collectionable::Base \ndata :id\nend"
            \ },
            \ "test/serializers/*_serializer_test.rb": {
            \   "command": "serializertest",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "alternate": "app/serializers/%s_serializer.rb",
            \   "template":
            \     "require 'test_helper'\n\nclass  %SSerializerTest < ActiveSupport::TestCase\nend"
            \ },
            \ "app/representers/*_representer.rb": {
            \   "command": "representer",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "alternate": "spec/representers/%s_representer_spec.rb",
            \   "template":
            \     "module  %SRepresenter\ninclude Roar::JSON\nend"
            \ },
            \ "spec/representers/*_representer_spec.rb": {
            \   "command": "representerspec",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "alternate": "app/representers/%s_representer.rb",
            \   "template":
            \     "require 'rails_helper'\n\ndescribe  %SRepresenter\nend"
            \ },
            \ "app/requesters/*_requester.rb": {
            \   "command": "requester",
            \   "alternate": "spec/requesters/%s_requester_spec.rb",
            \   "template":
            \     "module  %SRequester\nend"
            \ },
            \ "spec/requesters/*_requester_spec.rb": {
            \   "command": "requesterspec",
            \   "alternate": "app/requesters/%s_requester.rb",
            \   "template":
            \     "require 'rails_helper'\n\ndescribe  %SRequester\nend"
            \ },
            \ "spec/jobs/*_job_spec.rb": {
            \   "command": "jobspec",
            \   "alternate": "app/jobs/%s_job.rb",
            \   "template":
            \     "require 'rails_helper'\n\ndescribe  %SJob\nend"
            \ },
            \ "spec/support/schemas/*.json": {
            \   "command": "jsonschema",
            \   "affinity": "model"
            \ },
            \ "spec/support/shared_examples/*.rb": {
            \   "command": "shared_example",
            \ },
            \ "spec/support/shared_contexts/*.rb": {
            \   "command": "shared_context",
            \ },
            \ "spec/support/helpers/*.rb": {
            \   "command": "rspec_helper",
            \ },
            \ "spec/support/matchers/*.rb": {
            \   "command": "matcher",
            \ },
            \ "app/pdfs/*_pdf.rb": {
            \   "command": "pdf",
            \   "template":
            \     "class %SPdf\n\nend"
            \ },
            \}
else
   " vim-spec-runner
   " use dispatch
   let g:spec_runner_dispatcher = 'Dispatch {command}'
   map <Leader>R <Plug>RunCurrentSpecFile
   map <Leader>r <Plug>RunFocusedSpec
   map <Leader>l <Plug>RunMostRecentSpec
endif


"https://github.com/majutsushi/tagbar/wiki#ruby
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
  let g:gutentags_ctags_executable_ruby = 'ripper-tags'
endif
"let g:tagbar_type_ruby = {
"      \ 'kinds' : [
"      \ 'm:modules',
"      \ 'c:classes',
"      \ 'd:describes',
"      \ 'C:contexts',
"      \ 'f:methods',
"      \ 'F:singleton methods'
"      \ ]
"      \ }
"let g:tabgbar_ctags_bin="ripper-tags" 

