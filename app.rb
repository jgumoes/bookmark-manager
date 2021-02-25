require 'sinatra'
require_relative 'lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get "/new" do
    erb :"bookmarks/new"
  end

  post '/bookmarks/add' do
    # p params["url"]
    Bookmark.create(params["url"])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
