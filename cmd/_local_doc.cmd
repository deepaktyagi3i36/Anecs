echo off
rem
rem script to generate doc
rem

Rem set rails enviroment
set RAILS_ENV=development
rem set RAILS_ENV=production
rem set RAILS_ENV=test

echo on
cd ..
call rake doc:app --trace
call rake doc:plugins --trace
cd ./cmd/
