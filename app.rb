require './author'
require 'json'

class App
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
      10 => :save_games
    }
    send(options[selected])
  end

  def list_all_games
    @games.each { |game | 
      puts "id: #{game.id}"
      puts "genre: #{game.genre}"
      puts "author first_name: #{game.author.first_name}"
      puts "author last_name: #{game.author.last_name}"
      puts "source: #{game.source}"
      puts "label:  #{game.label}"
      puts "publish_date: #{game.publish_date}"
      puts "archive:  #{game.archive}"
    }
  end

  def list_all_authors
    puts 'Authors'
    puts @authors
  end

  def add_game

    if false
    id = Random.rand(1..1000)
    print 'Enter Genre name'
    genre_name = gets.chomp
    genre =  Genre.new(id,genre_name)
    @genres.push(genre)

    print 'Enter author first name'
    first_name = gets.chomp
    
    print 'Enter author last name'
    last_name = gets.chomp
    
    author = Author.new(id, first_name, last_name)
    @authors.push(author)

    print 'Enter source'
    source = gets.chomp
    @sources.push(source)

    print 'Enter game title'
    title = gets.chomp

    print 'Enter label color'
    color = gets.chomp

    label = Label.new(id, title, color)
    @labels.push(source)

    print 'Enter publish_date'
    publish_date = gets.chomp
    end

    id = Random.rand(1..1000)
    
    genre = 'genre-1'
    @genres.push(genre)

    first_name = 'Alex'
    last_name = 'Smith'
    
    author = Author.new(id, first_name, last_name)
    @authors.push(author)

    source = 'source-1'
    @sources.push(source)

    
    title = 'title-1'
    color = 'red'

    label = 'label-1'
    @labels.push(label)

    publish_date = '2020/05/03'

    options = { 'id' => 1, 'genre' => genre,
                  'author' => :author, 'source' => source,
                  'label' => label, 'publish_date' => publish_date,
                  'archive' => false }    

    multiplayer = '4 players'
    last_played_at = '2020/05/03'

    game = Game.new(multiplayer, last_played_at, **options)

    @games.push(game)
    author.add_item(game)

    #puts game.id, game.genre, game.author.first_name, game.author.last_name, game.source, game.label, game.publish_date, game.archive

  end


  
  def save_games
    game_genre_name='game_genre_name-1'
    game_label_title='game_label_title-1'
    game_label_color='game_label_color-1'

    File.open("games.json", "w") { |f| 
     @games.each { |game| 
     f.write "{ \"multiplayer\": \"#{game.multiplayer}\", "+
     "\"last_played_at\": \"#{game.last_played_at}\", "+
     "\"id\": \"#{game.id}\", "+
     "\"genre\": \"#{game_genre_name}\", "+
     "\"author_first_name\": \"#{game.author.first_name}\", "+
     "\"author_last_name\": \"#{game.author.last_name}\", "+
     "\"source\": \"#{game.source}\", "+
     "\"label_title\": \"#{game_label_title}\", "+
     "\"label_color\": \"#{game_label_color}\", "+
     "\"publish_date\": \"#{game.publish_date}\", "+
     "\"archive\": \"#{game.archive}\""+
     "} \n" }
    }    
  end

  def load_game
    puts 'load game'
    return unless File.exist?('games.json')

    File.foreach('games.json') do |json|
      game = JSON.parse(json)
    
      author = Author.new(game['id'], game['author_first_name'], game['author_last_name'])
      
      options = { 'id' => game['id'], 'genre' => game['genre'],
      'author' => author, 'source' => game['source'],      
      'label' => game['label_title'], 'publish_date' => game['publish_date'],
      'archive' => game['archive'] } 

      gameB=Game.new( game['multiplayer'], game['last_played_at'], **options)

      #puts 'gameB.author.first_name ',gameB.author.first_name       
      #puts gameB.id, gameB.genre, gameB.source, gameB.label, gameB.publish_date, gameB.archive

      @games.push( gameB )
      
    end
  end


end
