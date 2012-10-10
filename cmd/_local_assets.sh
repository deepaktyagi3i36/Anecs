# 
# script to start server
# 

# set rails enviroment
# set RAILS_ENV=test
# set RAILS_ENV=development
export RAILS_ENV=production

echo on
cd ..
bundle exec rake assets:precompile
cd ./cmd/
