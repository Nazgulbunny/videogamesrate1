# stage settings
set :stage, :production
set :branch, 'master'
set :user, 'vgr'

server 'www.videogamesrate.net', user: 'vgr', roles: %w{web app db}

set :ssh_options, {
  keys: %w(~/.ssh/blank),
  forward_agent: true
}

# deploy location
set :full_app_name, "#{fetch(:application)}"
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:full_app_name)}"

# init service name
set :service, 'www.videogamesrate.net'

# rails settings
set :rails_env, 'production'

set :rbenv_path, "/home/#{fetch(:user)}/.rbenv"
set :rbenv_type, :user
set :rbenv_ruby, "2.3.1"

set :tmp_dir, "/home/#{fetch(:user)}/.capistrano-tmp"