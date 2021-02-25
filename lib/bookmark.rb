require 'pg'

class Bookmark

  attr_reader :id, :title, :url
  
  def initialize id:, title:, url:
    @id = id
    @title = title
    @url = url
  end

  class << self

    def all
      connection = make_connection()
      result = connection.exec('SELECT * FROM bookmarks')
      result.map do |bookmark|
        Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      end
    end

    def create url:, title:
      connection = make_connection()
      result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end

    private

    def make_connection
      if ENV['ENVIRONMENT'] == 'test'
        return PG.connect(dbname: 'bookmarks_manager_test')
      else
        return PG.connect(dbname: 'bookmark_manager')
      end
    end
  end
end