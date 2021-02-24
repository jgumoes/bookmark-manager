require 'pg'

p "Setting up database..."

def setup_test_database
  connection = PG.connect(dbname: 'bookmarks_manager_test')

  connection.exec("TRUNCATE bookmarks;")
end