require './author'
require './label'
require './book'
require './game'
require './music_album'
require './genre'
require './utilities'
require './save_util'
require './load_util'
require 'json'

class App
  include Utilities
  include SaveUtil
  include LoadUtil
  def initialize
    @books = []
    @music_albums = []
    @movie = []
    @games = []
    @genres = []
    @authors = []
    @sources = []
    @labels = []
  end

  def run_option(selected)
    options = {
      1 => :list_all_books,
      2 => :list_all_music,
      3 => :list_all_games,
      4 => :list_all_genres,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_book,
      8 => :add_music_album,
      9 => :add_game,
      10 => :save_data
    }
    send(options[selected])
  end

  def list_all_games
    list_games(@games)
  end

  def list_all_authors
    list_authors(@authors)
  end

  def list_all_books
    list_books(@books)
  end

  def list_all_labels
    list_labels(@labels)
  end

  def list_all_music
    list_music_albums(@music_albums)
  end

  def list_all_genres
    list_genres(@genres)
  end

  def add_game
    options = create_options
    print 'Enter multiplayer: '
    multiplayer = gets.chomp
    print 'Enter last played at: '
    last_played_at = gets.chomp
    game = Game.new(multiplayer, last_played_at, **options)
    @games.push(game)
    # author.add_item(game)
  end

  def add_book
    options = create_options
    print 'Enter publisher: '
    publisher = gets.chomp
    print 'Provide the cover state, enter 1 for "bad" and 2 for "good": '
    cover_state = gets.to_i
    if [1, 2].include? cover_state
      state = if cover_state == 1
                'bad'
              else
                'good'
              end
      @books.push(Book.new(publisher, state, **options))
    else
      puts 'Wrong input'
      add_book
    end
  end

  def add_music_album
    options = create_options
    print 'Is album on spotify? Enter 1 for "yes" and 2 for "no": '
    spotify = gets.to_i
    if [1, 2].include? spotify
      on_spotify = spotify == 1
      @music_albums.push(MusicAlbum.new(on_spotify, **options))
    else
      puts 'Wrong input'
      add_music_album
    end
  end

  def save_data
    save_games(@games)
    save_books(@books)
    save_albums(@music_albums)
  end

  def load_data
    puts 'Loading data ...'
    load_game
    load_book
    load_music_albums
  end

  def create_options
    id = Random.rand(1..1000)
    author = creat_author
    @authors.push(author)
    genre = creat_genre
    @genres.push(genre)
    print 'Enter source: '
    source = gets.chomp
    @sources.push(source)
    label = create_label
    @labels.push(label)
    print 'Enter publish_date: '
    publish_date = gets.chomp
    { 'id' => id, 'genre' => genre, 'author' => author, 'source' => source, 'label' => label,
      'publish_date' => publish_date, 'archive' => false }
  end
end
