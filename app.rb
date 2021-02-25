require 'sinatra'
require_relative 'lib/bookmark.rb'

ENV['ENVIRONMENT'] = 'test'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    # @bookmarks.each { |b| puts "#{b.title}:\t#{b.url}"}
    erb :"bookmarks/index"
  end

  get "/new" do
    erb :"bookmarks/new"
  end

  post '/bookmarks/add' do
    p params["title"]
    Bookmark.create(url: params["url"], title: params["title"])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
