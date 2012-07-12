require "bundler/capistrano"

set :application, "danhoerr.com"
set :domain, "danhoerr.com"
set :repository, "https://github.com/dan-hoerr/danhoerr.com.git"
set :use_sudo, false
set :deploy_to, "/home/dhoerr/public/#{application}"
# set :branch, $1 if `git branch` =~ /\* (\S+)\s/m # from jake, copies current branch
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
    run "ln -sf #{shared_path}/database.yml #{latest_release}/config/database.yml"
  end
end