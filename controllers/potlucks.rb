
get "/new_potluck" do

  erb  :"potlucks/new_potluck"

end


get "/deets_potluck/:potluck_id" do
  @potluck = Potluck.find_by_id(params[:potluck_id])
  @potlucks = Potluck.all

  @items = Item.new(params[:item])

  erb :"potlucks/deets_potluck"

end


post "/new_potluck" do
@potluck = Potluck.new(params[:potluck])

  if @potluck.save
    erb :"potlucks/deets_potluck/:potluck_id"
  else
    erb :"potlucks/new_potluck"
  end

end