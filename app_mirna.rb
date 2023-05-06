require_relative 'music_library'
require_relative 'music_album'
class App
  def initialize
    @books = []
    @music_album = []
    @movie = []
    @games = []
    @music_library = MusicLibrary.new
  end

  def run_option(selected)
    options = {
      1 => :list_all_books,
      2 => :list_all_music,
      3 => :list_all_movies,
      4 => :list_all_games,
      5 => :list_all_genres,
      6 => :list_all_labels,
      7 => :list_all_authors,
      8 => :list_all_sources,
      9 => :add_book,
      10 => :add_music_album,
      11 => :add_movie,
      12 => :add_music_game
    }
    send(options[selected])
  end

  def list_all_music
    if @music_albums.nil? || @music_albums.empty?
      puts 'There are no music albums in the catalog yet.'
    else
      puts 'Music Albums:'
      @music_albums.each do |music_album|
        puts "Title: #{music_album.title}"
        puts "Genre: #{music_album.genre}"
        puts "Publish date: #{music_album.publish_date}"
        puts "On Spotify? #{music_album.on_spotify}"
        puts "Can be archived? #{music_album.can_be_archived?}"
        puts '-------------------------'
      end
    end
  end

  def list_all_genres
    genres = @music_library.all_genres
    if genres.empty?
      puts 'There are no genres in the catalog'
    else
      puts 'Genres:'
      genres.each do |genre|
        puts "- #{genre}"
      end
    end
  end

  def add_music_album
    print 'Enter ID: '
    id = gets.chomp
    print 'Enter title: '
    title = gets.chomp
    print 'Enter artist: '
    artist = gets.chomp
    print 'Enter genre: '
    genre = gets.chomp
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Is it available on Spotify? (y/n): '
    on_spotify = gets.chomp.downcase == 'y'

    album = MusicAlbum.new(id: id, title: title, artist: artist, genre: genre, publish_date: publish_date,
                           on_spotify: on_spotify)

    @music_library.add_music_album(album)
  end
end
