# frozen_string_literal: true

require 'bookmark'

describe '.all' do
  it 'returns list of bookmarks' do
    conn = PG.connect(dbname: 'bookmark_manager_test')

    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makers.tech');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include 'http://www.google.com'
    expect(bookmarks).to include 'http://www.destroyallsoftware.com'
    expect(bookmarks).to include 'http://www.makers.tech'
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.facebook.com')
      expect(Bookmark.all).to include 'http://www.facebook.com'
    end
  end  
end
