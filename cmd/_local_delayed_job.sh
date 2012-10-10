# 
# script to start server
# 

# set rails enviroment
# set RAILS_ENV=test
# set RAILS_ENV=development
export RAILS_ENV=production

echo on
cd ../
ruby script/delayed_job stop
# ruby script/delayed_job run
cd ./cmd/