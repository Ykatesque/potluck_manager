get "/new_item" do
  erb  :"items/new_item"
end

post "/new_item" do
  @potluck = Potluck.find_by_id(params[:potluck_id])
  @potlucks = Potluck.all
  @potluck = Potluck.new(params[:potluck])

  @item = Item.new(params[:item])
  @items = Item.all

  @person = Person.new(params[:person])
  @persons = Person.all

  @tag = Tag.new(params[:tag])
  @tags = Tag.all

  if @item.save
    redirect back
  else
    erb :"items/new_item"
  end

end
