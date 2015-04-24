"ruby 2 indent rule
set tabstop=2 shiftwidth=2 softtabstop=2
"autoclose end
imap <C-e> <CR><CR>end<Esc>-cc
"some abbreviation
abbreviate saop save_and_open_page

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
            \     "class  %SPolicy < ApplicationPolicy \n\nend"
            \ },
            \ "spec/policies/*_policy_spec.rb": {
            \   "command": "policyspec",
            \   "affinity": "model",
            \   "related": "app/models/%s.rb",
            \   "alternate": "app/policies/%s_policy.rb",
            \   "template":
            \     "require 'rails_helper'\n\ndescribe %SPolicy do\n  subject {open} %SPolicy.new(user, record) {close}\n\nend"
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
            \ "spec/support/schemas/*.json": {
            \   "command": "jsonschema",
            \   "affinity": "model"
            \ },
            \ "spec/support/shared_examples/*.rb": {
            \   "command": "shared_example",
            \ },
            \ "spec/support/shared_context/*.rb": {
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
            \     "class  %SPdf\n\nend"
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
