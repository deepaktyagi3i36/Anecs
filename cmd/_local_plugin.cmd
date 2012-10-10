echo off
rem
rem script to install plugins
rem ruby script/plugin --help
rem

Rem set rails enviroment
set RAILS_ENV=development

echo on
cd ..
rem ruby script/plugin install ym4r
rem ruby script/plugin install javascript_test
rem ruby script/plugin install backgroundrb
rem ruby script/plugin install http://newrelic.rubyforge.org/svn/newrelic_rpm
rem ruby script/plugin install svn://rubyforge.org/var/svn/ym4r/Plugins/Mapstraction/trunk/ym4r_mapstraction
rem ruby script/plugin install acts_as_voteable
rem ruby script/generate plugin ChangeableContent --with-generator
rem ruby script/plugin install http://svn.techno-weenie.net/projects/plugins/acts_as_authenticated
rem ruby script/plugin install http://svn.techno-weenie.net/projects/plugins/restful_authentication/
rem ruby script/plugin install http://juixe.com/svn/acts_as_voteable/
ruby script/plugin install http://svn.globalize-rails.org/svn/globalize/branches/for-1.2
cd ./cmd/

