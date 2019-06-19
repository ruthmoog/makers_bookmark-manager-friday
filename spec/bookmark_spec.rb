# frozen_string_literal: true

require 'bookmark'

describe '.all' do
  it 'returns list of bookmarks' do
    bookmarks = Bookmark.all

    expect(bookmarks).to include 'http://www.google.com'
    expect(bookmarks).to include 'http://www.destroyallsoftware.com'
    expect(bookmarks).to include 'http://www.makers.tech'
  end
end
