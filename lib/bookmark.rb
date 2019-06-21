# frozen_string_literal: true

require 'pg'

# List of bookmarks in the database
class Bookmark

  attr_reader :title, :id, :url

  def initialize(title: title, url: url, id: id)
    @title = title
    @url = url
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    result = conn.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| Bookmark.new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id']) }
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
       conn = PG.connect(dbname: 'bookmark_manager')
    end
     conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
   end 
end
