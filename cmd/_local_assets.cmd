echo off
rem
rem script to start server
rem

Rem set rails enviroment
set RAILS_ENV=development
rem set RAILS_ENV=production

echo off
cd ../
rem rake assets:precompile --trace
bundle exec rake assets:precompile --trace
cd ./cmd/
