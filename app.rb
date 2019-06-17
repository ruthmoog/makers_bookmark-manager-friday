require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'index page'
  end

  run! if app_file == $0
end
