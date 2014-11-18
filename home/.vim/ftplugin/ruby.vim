"ruby 2 indent rule
set tabstop=2 shiftwidth=2 softtabstop=2
"autoclose end
imap <C-e> <CR><CR>end<Esc>-cc
"some abbreviation
abbreviate saop save_and_open_page

"vimrails
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
         \}
map <leader>sf :Eintegrationtest 
map <leader>sv :Eviewspec 
map <leader>sc :Efunctionaltest 
map <leader>sm :Eunittest 
map <leader>fc :Econtroller  
map <leader>fv :Eview  
map <leader>fm :Emodel  
map <leader>fh :Ehelper  
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

