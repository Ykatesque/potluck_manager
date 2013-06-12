get "/new_person" do

  erb  :"people/new_person"

end

post "/new_person" do
@person = Person.new(params[:person])

  if @person.save
    redirect "/admin"
  else
    erb :"people/new_person"
  end

end

get "/view_person/:person_id" do
  @person = Person.find_by_id(params[:person_id])
  @potlucks = Potluck.all

  erb :"people/view_person"
end