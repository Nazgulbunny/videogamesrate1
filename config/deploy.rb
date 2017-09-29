# config valid only for Capistrano 3.1
lock '3.8.0'

# switches that affect where to get the code
set :application, 'vgr'
set :repo_url, 'git@github.com:Nazgulbunny/videogamesrate1.git'
set :keep_releases, 5
set :pty, true

# switches that affect bundler
# remove capistrano-bundler settings that do gem isolation
# since bundle config and rbenv-binstubs already do that
set :bundle_binstubs, nil # do not use shared bundle path between releases
set :bundle_path,     nil # trust bundle config to set the path
set :bundle_flags,    nil # be verbose, don't use deployment mode

# files / directories that are just symlinks to entries in shared
set :linked_files, %w{config/database.yml config/application.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets system public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :db do
  task :seed do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end
end

namespace :service do
  task :restart do
    on roles(:app) do
      execute :sudo, "service #{fetch :service} stop"
      execute :sudo, "service #{fetch :service} start"
    end
  end

  task :start do
    on roles(:app) do
      execute :sudo, "service #{fetch :service} start"
    end
  end

  task :stop do
    on roles(:app) do
      execute :sudo, "service #{fetch :service} stop"
    end
  end
end

task :test do
  on roles(:app) do
    within release_path do
      execute :ruby, "-v"
      # execute :export
    end
  end
end
