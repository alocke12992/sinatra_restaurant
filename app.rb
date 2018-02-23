require 'sinatra'

ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
require './controllers/routes' 
require 'sinatra/base'
require 'sinatra'
require 'rubygems'
require 'sinatra/activerecord'
require './environments'
require './models/user'

  class Menu < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :sessions 
  set :view, Proc.new { File.join(root, "/views") }
  register Sinatra::ActiveRecordExtension
  end 