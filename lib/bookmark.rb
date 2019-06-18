require 'pg'

class Bookmark
  def self.all
    conn = PG.connect(dbname: 'Papya')
    result = conn.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
    end
  end
