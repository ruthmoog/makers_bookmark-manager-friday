# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'setting up test database...'

  conn = PG.connect(dbname: 'bookmark_manager_test')

  # TRUNCATE TABLE clears the table data and leaves the table structure
  # for data set up within the test environment
  conn.exec('TRUNCATE bookmarks;')
end
