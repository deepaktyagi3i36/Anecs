echo off
rem
rem script to start server
rem
echo off

Rem set rails enviroment
set RAILS_ENV=development
rem set RAILS_ENV=production

echo on
cd ../
rem ruby script/rails server
bundle exec ruby script/rails server
rem thin start -p 3000 -e development
cd ./cmd/
