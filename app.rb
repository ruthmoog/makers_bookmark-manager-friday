# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

# This app allows the user to control bookmarked websites
class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
