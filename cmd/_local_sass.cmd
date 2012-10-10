echo off
rem
rem script to start server
rem

Rem set rails enviroment
set RAILS_ENV=development
rem set RAILS_ENV=production

echo off
cd ../
rem sass --help
sass --watch public/stylesheets/sass:public/stylesheets
rem sass --watch themes/wellness/stylesheets/sass:themes/wellness/stylesheets
cd ./cmd/
