# Include Sinatra and ActiveRecord functionality.
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'instagram'

# 1. Establish a connection to the specific database we're using.


# For each set of steps, make sure you include the ruby file that contains
# the class (which inherits from ActiveRecord).
require_relative "models/potluck"
require_relative "models/item"
require_relative "models/tag"
require_relative "models/person"
require_relative "models/keyword"
#require_relative "helpers/form_helpers"
require_relative "db_info"
require_relative "test.rb"

CALLBACK_URL = "http://localhost:4567/oauth/callback"

Instagram.configure do |config|
  config.client_id = "7332fc7e51744686ba5b4788611dd482"
  config.client_secret = "9f3c18fe954d4d6d8b7199578c3510a7"
end

# The index page just shows all the books/movies/actors.
# After each set of steps, we added a new variable for books/movies/actors.
get "/" do
  @people = Person.all
  @tags = Tag.all
  @potlucks = Potluck.all
  @items = Item.all
  erb :index
end

get "/admin" do
  @people = Person.all
  @tags = Tag.all
  @potlucks = Potluck.all
  @items = Item.all
  @keywords = Keyword.all

  erb :"tags/admin"
end


require_relative "controllers/items"
require_relative "controllers/potlucks"
require_relative "controllers/people"
require_relative "controllers/tags"
require_relative "controllers/keywords"

