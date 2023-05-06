require './label'
require './author'
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

  def list_games(games)
    puts 'Games'
    games.each do |game|
      puts "id: #{game.id}"
      puts "multiplayer: #{game.multiplayer}"
      puts "last played: #{game.last_played_at}"
      puts "genre: #{game.genre}"
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
      puts "genre: #{book.genre}"
      puts "author first_name: #{book.author.first_name}"
      puts "author last_name: #{book.author.last_name}"
      puts "source: #{book.source}"
      puts "label title:  #{book.label.title}"
      puts "label color:  #{book.label.color}"
      puts "publish_date: #{book.publish_date}"
      puts "archive:  #{book.archive}"
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
end
