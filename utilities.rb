require './label'
require './author'
require './genre'
module Utilities
  def create_label
    print 'Enter a title for the label: '
    title = gets.chomp
    print 'Enter a color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def creat_author
    id = Random.rand(1..1000)
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp
    Author.new(id, first_name, last_name)
  end

  def creat_genre
    print 'Enter genre name: '
    name = gets.chomp
    Genre.new(name)
  end

  def list_games(games)
    p games
    puts 'Games'
    games.each do |game|
      puts "id: #{game.id}"
      puts "multiplayer: #{game.multiplayer}"
      puts "last played: #{game.last_played_at}"
      puts "genre: #{game.genre.name}"
      puts "author first_name: #{game.author.first_name}"
      puts "author last_name: #{game.author.last_name}"
      puts "source: #{game.source}"
      puts "label title:  #{game.label.title}"
      puts "label color:  #{game.label.color}"
      puts "publish_date: #{game.publish_date}"
      puts "archive:  #{game.archive}"
    end
  end

  def list_books(books)
    puts 'Books'
    books.each do |book|
      puts "id: #{book.id}"
      puts "publisher: #{book.publisher}"
      puts "cover state: #{book.cover_state}"
      puts "genre: #{book.genre.name}"
      puts "author first_name: #{book.author.first_name}"
      puts "author last_name: #{book.author.last_name}"
      puts "source: #{book.source}"
      puts "label title:  #{book.label.title}"
      puts "label color:  #{book.label.color}"
      puts "publish_date: #{book.publish_date}"
      puts "archive:  #{book.archive}"
    end
  end

  def list_music_albums(albums)
    puts 'Music Albums'
    albums.each do |album|
      puts "id: #{album.id}"
      puts "On spotify: #{album.on_spotify}"
      puts "genre: #{album.genre.name}"
      puts "author first_name: #{album.author.first_name}"
      puts "author last_name: #{album.author.last_name}"
      puts "source: #{album.source}"
      puts "label title:  #{album.label.title}"
      puts "label color:  #{album.label.color}"
      puts "publish_date: #{album.publish_date}"
      puts "archive:  #{album.archive}"
    end
  end

  def list_labels(labels)
    puts 'Labels'
    labels.each do |label|
      puts "id: #{label.id}"
      puts "title: #{label.title}"
      puts "color: #{label.color}"
    end
  end

  def list_authors(authors)
    puts 'Authors'
    authors.each do |author|
      puts "id: #{author.id}"
      puts "first name: #{author.first_name}"
      puts "last name: #{author.last_name}"
    end
  end

  def list_genres(genres)
    puts 'Genres'
    genres.each do |genre|
      puts "id: #{genre.id}"
      puts "name: #{genre.name}"
    end
  end
end
