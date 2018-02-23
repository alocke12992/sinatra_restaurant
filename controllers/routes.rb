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

  # get '/sessions/login' do 
  #   erb :login
  # end 

  # post '/sessions' do 
  # end 

  # get '/sessions/logout' do 
  #   erb :session
  # end 

  get '/users/home' do 
    @user = User.find(session[:id]) 
    @items = Item.all
    erb :'/users/uhome'
  end 


# IMPORTED ROUTES 
# get "/items/new" do
#     erb :new
#   end

#   get "/items/:id/edit" do
#     @item = Item.find(params[:id])
#     erb :edit
#   end

#   put "/items/:id" do
#     item = Item.find(params[:id])
#     Item.update({title: params[:title], description: params[:description], image: params[:image]})
#     redirect "/items"
#   end

#   get "/items" do
#     @items = Item.all
#     erb :items
#   end

#   post "/items" do
#     Item.create(
#       title: params[:title],
#       description: params[:description],
#       image: params[:image]
#     )
#     redirect "/items"
#   end
#   delete '/items/:id' do |id|
#     Item.find(params[:id]).destroy
#     redirect "/items"
#   end


end

