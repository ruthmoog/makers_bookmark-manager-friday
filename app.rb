# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

# This app allows the user to control bookmarked websites
class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
    erb :'index'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks'
  end

post '/bookmarks' do
  url = params['url']
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}') ")
  redirect '/bookmarks'
end

  run! if app_file == $PROGRAM_NAME
end
