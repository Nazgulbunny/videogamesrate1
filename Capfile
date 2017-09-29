# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

# Load ENV vars via Figaro
require 'figaro'
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

require 'capistrano/rails'
require 'capistrano/bundler'
# require 'capistrano/puma'
require 'capistrano/rbenv'
require 'capistrano/rails/console'

# install_plugin Capistrano::Puma # Fix "Don't know how to build task 'start'" error
# Configure rbenv
set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
