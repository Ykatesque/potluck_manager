
get "/new_potluck" do

  erb  :"potlucks/new_potluck"

end


get "/deets_potluck/:potluck_id" do
  #clean up these first lines
  @potluck = Potluck.find_by_id(params[:potluck_id])
  @potlucks = Potluck.all
  @potluck = Potluck.new(params[:potluck])

  @items = Item.new(params[:item])

  erb :"potlucks/deets_potluck"

end


post "/new_potluck" do
@potluck = Potluck.new(params[:potluck])

  if @potluck.save
    redirect "/deets_potluck/:potluck_id"

  else
    erb :"potlucks/new_potluck"
  end

end

get "/potlucks" do
  @potlucks = Potluck.all
  erb :"potlucks/potlucks"
end


get "/edit_potluck/:potluck_id" do
  @potluck = Potluck.find_by_id(params[:potluck_id])

  erb :"potlucks/edit_potluck"
end


post "/save_potluck/:potluck_id" do
  @potluck = Potluck.find_by_id(params[:potluck_id])

  if @potluck.update_attributes(params[:potluck])
    redirect back
  else
    erb :"potlucks/edit_potluck"
  end
end