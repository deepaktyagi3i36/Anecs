# !!!Warning: Dont'use test as stage name, it will lead to error:
#
# ... Call stack here ...
# ... namespaces.rb:97:in `task': defining a task named `test' would shadow an existing method with that name (ArgumentError)
#
set :stages, %w(testing production)
set :default_stage, 'production'
require 'capistrano/ext/multistage'

# Common settings
set :use_sudo, false
set :keep_releases, 7
set :application, "anecs"
set :repository,  "https://majoron.com/svn/Products/ANECS/trunk/Website/#{application}"

# SVN configuration
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :subversion
set :scm_username, proc{Capistrano::CLI.ui.ask('SVN username:' )}
set :scm_password, proc{Capistrano::CLI.password_prompt('SVN password:' )}
# set :scm_command, "/usr/bin/svn"
# set :local_scm_command, "C:/Binutils/svn/svn"

# Deployment configuration
# See deployment strategy here: http://maksd.info/message/4
set :user, "anecs"
set :deploy_to, "/home/#{user}/public_html/#{application}"
set :deploy_via, :export
# set :deploy_via, :remote_cache

# Mongrel cluster configuration
set :djob_group, 'anecs_djob'
set :thin_group, 'anecs_thin'
set :clockwork_group, 'anecs_clockwork'
set :shared_symlinks, %w( config/database.yml config/thin_cluster.yml config/sphinx.yml config/proxy.yml config/remsport.yml config/cabelas.yml config/sportgora.yml)

namespace :deploy do
  desc <<-DESC
  Restart the server on the app server by calling restart all processes.
  DESC
  task :restart, :roles => :app do
    restart_thin_cluster
    restart_delayed_job
    restart_clockwork
  end

  desc <<-DESC
  Start thin processes on the app server.
  DESC
  task :start_thin_cluster , :roles => :app do
    sudo "/usr/bin/monit start all -g #{thin_group}", :pty => true
  end

  desc <<-DESC
  Restart the thin processes on the app server by
  starting and stopping the cluster.
  DESC
  task :restart_thin_cluster , :roles => :app do
    sudo "/usr/bin/monit restart all -g #{thin_group}", :pty => true
  end

  desc <<-DESC
  Stop the thin processes on the app server.
  DESC
  task :stop_thin_cluster , :roles => :app do
    sudo "/usr/bin/monit stop all -g #{thin_group}", :pty => true
  end

  desc <<-DESC
  Start delayed job processes on the app server.
  DESC
  task :start_delayed_job, :roles => :app do
    sudo "/usr/bin/monit start all -g #{djob_group}", :pty => true
  end

  desc <<-DESC
  Restart the delayed job processes on the app server by
  starting and stopping the cluster.
  DESC
  task :restart_delayed_job, :roles => :app do
    sudo "/usr/bin/monit restart all -g #{djob_group}", :pty => true
  end

  desc <<-DESC
  Stop the delayed job processes on the app server.
  DESC
  task :stop_delayed_job, :roles => :app do
    sudo "/usr/bin/monit stop all -g #{djob_group}", :pty => true
  end

  desc <<-DESC
  Start clockwork processes on the app server.
  DESC
  task :start_clockwork , :roles => :app do
    sudo "/usr/bin/monit start all -g #{clockwork_group}", :pty => true
  end

  desc <<-DESC
  Restart the clockwork processes on the app server by
  starting and stopping the cluster.
  DESC
  task :restart_clockwork , :roles => :app do
    sudo "/usr/bin/monit restart all -g #{clockwork_group}", :pty => true
  end

  desc <<-DESC
  Stop the clockwork processes on the app server.
  DESC
  task :stop_clockwork , :roles => :app do
    sudo "/usr/bin/monit stop all -g #{clockwork_group}", :pty => true
  end

  desc <<-DESC
  Make symbol link to shared folder
  DESC
  task :make_shared_symlinks , :roles => :app do
    shared_symlinks.each do |path|
      run "ln -nfs #{shared_path}/#{path} #{release_path}/#{path}", :pty => true
    end
  end

  desc <<-DESC
  Run db:seed task after migration
  DESC
  task :seed , :roles => :db do
    run "cd #{release_path}; rake RAILS_ENV=production db:seed"
  end
end

# Make callbacks
after "deploy:update_code", "deploy:make_shared_symlinks"
after "deploy:update_code", "deploy:assets:precompile"
after "deploy:update_code", "deploy:migrate"
after "deploy:update_code", "deploy:seed"
after "deploy", "deploy:cleanup"

