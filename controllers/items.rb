get "/new_item" do
  erb  :"items/new_item"
end

get "/edit_item/:item_id" do
  @item = Item.find_by_id(params[:item_id])

  erb :"items/edit_item"
end

#clean this up
post "/new_item/" do
  @potluck = Potluck.find_by_id(params[:potluck_id])
  @potlucks = Potluck.all
  @potluck = Potluck.new(params[:potluck])

  @item = Item.new(params[:item])
  @items = Item.all

  @person = Person.new(params[:person])
  @persons = Person.all

  @tag = Tag.new(params[:tag])
  @tags = Tag.all

  if
    @item.save
    redirect "/potlucks"
  else
    erb :"items/save_item"
  end
end

post "/save_item/:item_id" do
  @item = Item.find_by_id(params[:item_id])

  if @item.update_attributes(params[:item])
    redirect "/potlucks"
  else
    erb :"potlucks/:potluck_id"
  end
end
