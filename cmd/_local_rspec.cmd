echo off
rem examples of usage
rem

Rem set rails enviroment
rem set RAILS_ENV=development
rem set RAILS_ENV=production
rem set RAILS_ENV=test

echo off
cd ../
bundle exec rspec ./spec
rem bundle exec rspec ./spec/controllers
rem bundle exec rspec ./spec/filters
rem bundle exec rspec ./spec/helpers
rem bundle exec rspec ./spec/lib
rem bundle exec rspec ./spec/jobs
rem bundle exec rspec ./spec/models
rem bundle exec rspec ./spec/sweepers
rem bundle exec rspec ./spec/views
rem bundle exec rspec ./spec/models/address_spec.rb
rem bundle exec rspec ./spec/filters/address_filter_spec.rb
rem bundle exec rspec ./spec/controllers/callmebacks_controller_spec.rb
rem bundle exec rspec ./spec/views/aboutus/overview.html.erb_spec.rb
cd ./cmd/
