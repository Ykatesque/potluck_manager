get "/new_keyword" do
  erb  :"keywords/new_keyword"
end

post "/new_keyword" do
@keyword = Keyword.new(params[:keyword])

  if @keyword.save
    redirect "/admin"
  else
    erb :"keywords/new_keyword"
  end
end