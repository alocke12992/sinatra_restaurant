require 'sinatra'

ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
require_relative './controllers/routes'
require_relative './controllers/item_routes'
require 'sinatra/base'
require 'sinatra'
require 'rubygems'
require 'sinatra/activerecord'
require './environments'
require './models/user'
require './models/item'

  class Menu < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :sessions
  set :views, Proc.new { File.join(root, "views") }
  register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
  end
  class Items < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :sessions
  set :views, Proc.new { File.join(root, "views") }
  register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
  end
