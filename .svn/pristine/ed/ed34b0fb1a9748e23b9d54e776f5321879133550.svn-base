echo off
rem
rem script to migrate database
rem

Rem set rails enviroment
set RAILS_ENV=development
rem set RAILS_ENV=production
rem set RAILS_ENV=test

echo on
cd ../
bundle exec rake db:seed --trace
cd ./cmd/

