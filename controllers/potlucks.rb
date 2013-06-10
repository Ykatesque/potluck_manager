get "/new_potluck" do
  erb  :"potlucks/new_potluck"
end


get "/deets_potluck/:potluck_id" do
  #clean up these first lines
  @potluck = Potluck.find_by_id(params[:potluck_id])
  @potlucks = Potluck.all
  @potlucks = Potluck.new(params[:potluck])
  # CLEAN UP
  @item = Item.find_by_id(params[:potluck_id])
  @items = Item.new(params[:item])
  @items = Item.all
  #clean up
  @person = Person.find_by_id(params[:person_id])
  @people = Person.all
  @people = Person.new(params[:person])

  erb :"potlucks/deets_potluck"
end

post "/new_potluck" do
@potluck = Potluck.new(params[:potluck])

  if @potluck.save
    @potluck = Potluck.find_by_id(params[:potluck_id])
    redirect "/deets_potluck/:potluck_id" # WHY YOU NO WORK
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
    @potluck = Potluck.find_by_id(params[:potluck_id])
    redirect "/potlucks"
  else
    erb :"potlucks/edit_potluck"
  end
end