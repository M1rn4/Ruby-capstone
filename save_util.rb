module SaveUtil
  def save_games(games)
    game_genre_name = 'game_genre_name-1'
    File.open('games.json', 'w') do |f|
      games.each do |game|
        f.write "{ \"multiplayer\": \"#{game.multiplayer}\", " \
                "\"last_played_at\": \"#{game.last_played_at}\", " \
                "\"id\": \"#{game.id}\", " \
                "\"genre\": \"#{game_genre_name}\", " \
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
    book_genre_name = 'book_genre_name-1'

    File.open('books.json', 'w') do |f|
      books.each do |book|
        f.write "{ \"publisher\": \"#{book.publisher}\", " \
                "\"cover_state\": \"#{book.cover_state}\", " \
                "\"id\": \"#{book.id}\", " \
                "\"genre\": \"#{book_genre_name}\", " \
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
end
