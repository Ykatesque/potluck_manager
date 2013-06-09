get "/new_tag" do
  erb  :"tags/new_tag"
end

post "/new_tag" do
@tag = Tag.new(params[:tag])

  if @tag.save
    redirect "/admin"
  else
    erb :"tags/new_tag"
  end

end

get "/edit_tag/:tag_id" do

  @tag = Tag.find_by_id(params[:tag_id])
  erb :"tags/edit_tag"
end


post "/save_tag/:tag_id" do
  @tag = Tag.find_by_id(params[:tag_id])


  if @tag.update_attributes(params[:tag])
    redirect "/admin"
  else
    erb :"tags/edit_tag"
  end
end