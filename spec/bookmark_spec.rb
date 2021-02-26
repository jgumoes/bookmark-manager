require 'bookmark'
require "database_helpers"

describe 'Bookmark' do
  it 'returns a list of bookmarks' do
  connection = PG.connect(dbname: 'bookmarks_manager_test')

   # Add the test data
   bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
   Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
   Bookmark.create(url: "http://www.google.com", title: "Google")

   bookmarks = Bookmark.all

   expect(bookmarks.length).to eq 3
   expect(bookmarks.first).to be_a Bookmark
  #  puts bookmarks.first
  #  expect(bookmarks.first.id).to eq bookmark.id
   expect(bookmarks.first.title).to eq 'Makers Academy'
   expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end

  context "#create" do
    it 'adds a new bookmark which is found in .all' do
      rand_url = "www.#{(1..8).map { ('a'..'z').map{|l| l}.sample }.join}.com"
      Bookmark.create(url: rand_url, title: 'lol wat')

      expect(Bookmark.all.map{ |b| b.url }).to include rand_url
    end

    it 'creates a new bookmark as object' do
      rand_url = "www.#{(1..8).map { ('a'..'z').map{|l| l}.sample }.join}.com"
      bookmark = Bookmark.create(url: rand_url, title: 'lol wat')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'lol wat'
      expect(bookmark.url).to eq rand_url
    end
  end

  # context '#delete' do

  #   it "deletes a bookmark" do
      
  #   end
  # end
end