# 
# script to migrate database
#

# set rails enviroment
# export RAILS_ENV=development
export RAILS_ENV=production
# export RAILS_ENV=test

echo on
cd ..
rake db:migrate --trace
cd ./cmd/
