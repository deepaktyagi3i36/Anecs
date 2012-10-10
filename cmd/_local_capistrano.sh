# 
# script to deploy application
#

# set rails enviroment
# export RAILS_ENV=development
export RAILS_ENV=production

echo on
cd ..
cap production deploy
# cap production deploy:setup
# cap deploy
# cap deploy:setup
cd ./cmd/
