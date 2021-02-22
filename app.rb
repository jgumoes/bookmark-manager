require 'sinatra'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get "/bookmarks" do
    @bookmarks = ["https://www.pictureofhotdog.com/about"]
    
    erb :"bookmarks/index"
  end

  run! if app_file == $0
end
