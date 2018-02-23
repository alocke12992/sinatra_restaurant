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

 

  get "/users/items" do
    
    erb :'/users/items'
  end

# IMPORTED ROUTES 
  get "/users/items/new" do
    erb :'/users/new'
  end

  get "/users/items/:id/edit" do
    @items = Item.find(params[:id])
    erb :'/users/edit'
  end

  put "/users/items/:id" do
    @items = Item.find(params[:id])
    Item.update({title: params[:title], description: params[:description], image: params[:image]})
    redirect "/users/items"
  end


  post "/items" do
  @items = Item.new(
      title: params[:title],
      description: params[:description],
      image: params[:image]
    )
    .save
    session[:id] = @user.id
    redirect "/users/items"
  end
  
delete '/users/items/:id' do |id|
    @items = Item.find(params[:id]).destroy
    redirect "/users/items"
  end


end

