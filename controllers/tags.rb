get "/new_tag" do
  erb  :"tags/new_tag"
end

post "/new_tag" do
@tag = Tag.new(params[:tag])

  if @tag.save
    redirect "/"
  else
    erb :"tags/new_tag"
  end

end