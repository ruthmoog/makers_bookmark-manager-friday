# frozen_string_literal: true

require 'bookmark'

describe '.all' do
  it 'returns list of bookmarks' do
    conn = PG.connect(dbname: 'bookmark_manager_test')

     bookmark = Bookmark.create(url: "http://www.makers.tech", title: "Makers")
     Bookmark.create(url: "http://www.google.com", title: "Google")
     Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All")

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    # expect(bookmarks.first.id).to eq bookmark[0].id
    expect(bookmarks[0].title).to eq 'Makers'
    expect(bookmarks[0].url).to eq 'http://www.makers.tech'
    expect(bookmarks[1].title).to eq 'Google'
    expect(bookmarks[1].url).to eq 'http://www.google.com'
    expect(bookmarks[2].title).to eq 'Destroy All'
    expect(bookmarks[2].url).to eq 'http://www.destroyallsoftware.com'
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook').first
      
      expect(bookmark['url']).to eq('http://www.facebook.com')
      expect(bookmark['title']).to eq('Facebook')
    end
  end  
end
