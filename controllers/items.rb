get "/new_item" do
  erb  :"items/new_item"
end

post "/new_item" do
@item = Item.new(params[:item])

  if @item.save
    redirect "/"
  else
    erb :"items/new_item"
  end

end