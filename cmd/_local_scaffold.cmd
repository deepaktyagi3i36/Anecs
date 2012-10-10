echo off
rem
rem script to generate scaffold
rem

Rem set rails enviroment
rem set RAILS_ENV=production
rem set RAILS_ENV=development

echo on
cd ../
ruby script/generate scaffold Backoffice::Orders --skip-migration

cd ./cmd/
