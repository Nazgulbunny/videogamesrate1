# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "videogamesrate"
set :repo_url, "git@bitbucket.org:JavaScriptTeddy/videogamesrate.git"
set :deploy_to, '/home/deploy/videogamesrate'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
