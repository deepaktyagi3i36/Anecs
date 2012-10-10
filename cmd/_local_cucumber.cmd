echo off
rem examples of usage
rem

Rem set rails enviroment
rem set RAILS_ENV=development
rem set RAILS_ENV=production
set RAILS_ENV=test

echo off
cd ../
bundle exec cucumber
rem cucumber features/aboutus.feature
rem cucumber features/home.feature
rem cucumber features/login.feature
rem cucumber features/logout.feature
rem cucumber features/signup.feature
rem cucumber features/welcome.feature
rem ruby script/rails generate cucumber:install
cd ./cmd/
