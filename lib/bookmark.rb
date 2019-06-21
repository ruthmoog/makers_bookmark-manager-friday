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
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end

    result = conn.exec('SELECT * FROM bookmarks')
    result.map  { |bookmark| Bookmark.new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id']) }
  end

  def self.create(url:, title:)
    # return false unless is_url?(url) #this will stop the creation of a bookmark if not valid url
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end
    conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
   end
end
