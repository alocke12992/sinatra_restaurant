class Items < Sinatra::Base

  get "/users/items/new" do
    erb :'/users/new'
  end

  get "/users/items/:id/edit" do
    @item = Item.find(params[:id])
    erb :'/users/edit'
  end

  put "/users/items/:id" do
    item = Item.find(params[:id])
    item.update({title: params[:title], description: params[:description], image: params[:image]})
    redirect "/users/items"
  end

  get "/users/items" do
    @items = Item.where(:id => session[:id]).all
    erb :'/users/items'
  end

  get "/users/home" do
    @allItems = Item.all
    erb :'/users/home'
  end

  post "/users/items" do
    Item.create(
      id: session[:id],
      title: params[:title],
      description: params[:description],
      image: params[:image]
    )
    redirect "/users/items"
  end
  delete '/users/items/:id' do |id|
    Item.find(params[:id]).destroy
    redirect "/users/items"
  end

end
