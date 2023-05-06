module SaveUtil
  def save_games(games)
    File.open('games.json', 'w') do |f|
      games.each do |game|
        f.write "{ \"multiplayer\": \"#{game.multiplayer}\", " \
                "\"last_played_at\": \"#{game.last_played_at}\", " \
                "\"id\": \"#{game.id}\", " \
                "\"genre\": \"#{game.genre.name}\", " \
                "\"author_first_name\": \"#{game.author.first_name}\", " \
                "\"author_last_name\": \"#{game.author.last_name}\", " \
                "\"source\": \"#{game.source}\", " \
                "\"label_title\": \"#{game.label.title}\", " \
                "\"label_color\": \"#{game.label.color}\", " \
                "\"publish_date\": \"#{game.publish_date}\", " \
                "\"archive\": \"#{game.archive}\"" \
                "} \n"
      end
    end
  end

  def save_books(books)
    File.open('books.json', 'w') do |f|
      books.each do |book|
        f.write "{ \"publisher\": \"#{book.publisher}\", " \
                "\"cover_state\": \"#{book.cover_state}\", " \
                "\"id\": \"#{book.id}\", " \
                "\"genre\": \"#{book.genre.name}\", " \
                "\"author_first_name\": \"#{book.author.first_name}\", " \
                "\"author_last_name\": \"#{book.author.last_name}\", " \
                "\"source\": \"#{book.source}\", " \
                "\"label_title\": \"#{book.label.title}\", " \
                "\"label_color\": \"#{book.label.color}\", " \
                "\"publish_date\": \"#{book.publish_date}\", " \
                "\"archive\": \"#{book.archive}\"" \
                "} \n"
      end
    end
  end

  def save_albums(albums)
    File.open('albums.json', 'w') do |f|
      albums.each do |album|
        f.write "{ \"On spotify\": \"#{album.on_spotify}\", " \
                "\"id\": \"#{album.id}\", " \
                "\"genre\": \"#{album.genre.name}\", " \
                "\"author_first_name\": \"#{album.author.first_name}\", " \
                "\"author_last_name\": \"#{album.author.last_name}\", " \
                "\"source\": \"#{album.source}\", " \
                "\"label_title\": \"#{album.label.title}\", " \
                "\"label_color\": \"#{album.label.color}\", " \
                "\"publish_date\": \"#{album.publish_date}\", " \
                "\"archive\": \"#{album.archive}\"" \
                "} \n"
      end
    end
  end
end
