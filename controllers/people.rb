
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