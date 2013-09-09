require 'instagram'

CALLBACK_URL = "http://localhost:4567/oauth/callback"

Instagram.configure do |config|
  config.client_id = "7332fc7e51744686ba5b4788611dd482"
  config.client_secret = "9f3c18fe954d4d6d8b7199578c3510a7"
end

def get_pictures
  results = Instagram.tag_recent_media("potluck")
  results_array = []
  while results_array.length < 26
    results.each do |image|
      url = image.images.thumbnail.url
        results_array << url
    end

    max_id = results.last.id
    results = Instagram.tag_recent_media("potluck", options = {max_id:max_id})
  end
  return results_array
end