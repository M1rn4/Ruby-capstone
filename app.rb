class App
  def initialize
    @books = []
    @music_album = []
    @movie = []
    @games = []
  end

  def run_option(selected)
    options = {
      1 => :list_all_books,
      2 => :list__all_music,
      3 => :list_all_games,
      4 => :List_all_genres,
      5 => :List_all_labels,
      6 => :List_all_authors,
      7 => :Add_book,
      8 => :Add_music_album,
      9 => :Add_game
    }
    send(options[selected])
  end

  def list_all_games
    puts 'call list_all_games'
  end
end
