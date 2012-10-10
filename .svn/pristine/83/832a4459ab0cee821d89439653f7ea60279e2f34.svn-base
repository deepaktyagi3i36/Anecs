echo off
rem
rem script to start server
rem

Rem set rails enviroment
set RAILS_ENV=development
rem set RAILS_ENV=production

echo on
cd ..
bundle exec ruby script/delayed_job run
cd ./cmd/
