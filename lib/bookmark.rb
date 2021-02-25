require 'pg'

class Bookmark
  class << self
    def all
      connection = make_connection()
      result = connection.exec('SELECT * FROM bookmarks')
      result.map { |bookmark| bookmark["url"] }
    end

    def create bookmark
      connection = make_connection()
      connection.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}');")
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