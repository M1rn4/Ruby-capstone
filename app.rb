require './author'
require './label'
require './book'
require './game'
require './utilities'
require 'json'

class App
  include Utilities
  def initialize
    @books = []
    @music_album = []
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

  def add_game
    options = create_options
    print 'Enter Genre name: '
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

  def save_data
    save_games(@games)
    save_books(@books)
  end

  def load_data
    puts 'Loading data ...'
    load_game
    load_book
  end

  def load_game
    return unless File.exist?('games.json')

    File.foreach('games.json') do |json|
      game = JSON.parse(json)

      author = Author.new(game['id'], game['author_first_name'], game['author_last_name'])
      label = Label.new(game['label_title'], game['label_color'])
      @authors.push(author)
      @labels.push(label)

      options = { 'id' => game['id'], 'genre' => game['genre'],
                  'author' => author, 'source' => game['source'],
                  'label' => label, 'publish_date' => game['publish_date'],
                  'archive' => game['archive'] }

      game_b = Game.new(game['multiplayer'], game['last_played_at'], **options)
      @games.push(game_b)
    end
  end

  def load_book
    return unless File.exist?('books.json')

    File.foreach('books.json') do |json|
      book = JSON.parse(json)

      author = Author.new(book['id'], book['author_first_name'], book['author_last_name'])
      label = Label.new(book['label_title'], book['label_color'])
      @authors.push(author)
      @labels.push(label)
      options = { 'id' => book['id'], 'genre' => book['genre'],
                  'author' => author, 'source' => book['source'],
                  'label' => label, 'publish_date' => book['publish_date'],
                  'archive' => book['archive'] }

      book_b = Book.new(book['publisher'], book['cover_state'], **options)

      @books.push(book_b)
    end
  end

  def create_options
    id = Random.rand(1..1000)
    print 'Enter genre: '
    genre_name = gets.chomp
    # genre =  Genre.new(id,genre_name)
    genre = genre_name
    @genres.push(genre)

    author = creat_author
    @authors.push(author)

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
