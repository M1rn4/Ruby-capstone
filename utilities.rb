require './label'
require './author'
module Utilities
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
      puts "label:  #{game.label}"
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
