set :application, "TNW Hackathon"
set :repository,  ".git"

set :scm, :git
set :branch, "master"

set :use_sudo, false
set :deploy_via, :copy
set :copy_cache, false

set :copy_exclude, [".git/*", "log/*.log"]
set :copy_compression, :gzip


for argument in ARGV
  if argument =~ /^servers=/
    servers = argument.gsub(/^servers=/, '').scan(/([^,]+),?/).flatten
  end
end

if servers
  for host in servers
    server(host, :web)
  end
else
  role :web, "test1", "test2", "live1", "live2"
end

set :deploy_to, "/var/www/"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart do ; end
  # task :restart, :roles => :app, :except => { :no_release => true } do
  #   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  # end
end