require_relative 'item_routes'

class Menu < Sinatra::Base
  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(
      username: params["username"],
      email: params["email"],
      password: params["password"])
      @user.save
      session[:id] = @user.id
      redirect '/users/home'
    end



    get '/sessions/login' do
      erb :'/sessions/login'
    end


    post '/sessions' do
      @user = User.find_by(
        email: params["email"],
        password: params["password"])
        session[:id] = @user.id
        redirect '/users/home'
      end

      get '/sessions/logout' do
        session.clear
        redirect '/'
      end

      get '/users/home' do
        @user = User.find(session[:id])
        erb :'/users/home'
      end


    end
