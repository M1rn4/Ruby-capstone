require './label'
require './author'
require './genre'
require './book'
require './game'
require './music_album'

module LoadUtil
  def load_game
    return unless File.exist?('games.json')

    File.foreach('games.json') do |json|
      game = JSON.parse(json)

      author = Author.new(game['id'], game['author_first_name'], game['author_last_name'])
      label = Label.new(game['label_title'], game['label_color'])
      genre = Genre.new(game['genre'])
      @authors.push(author)
      @labels.push(label)
      @genres.push(genre)

      options = { 'id' => game['id'], 'genre' => genre,
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
      genre = Genre.new(book['genre'])
      @authors.push(author)
      @labels.push(label)
      @genres.push(genre)
      options = { 'id' => book['id'], 'genre' => genre,
                  'author' => author, 'source' => book['source'],
                  'label' => label, 'publish_date' => book['publish_date'],
                  'archive' => book['archive'] }

      book_b = Book.new(book['publisher'], book['cover_state'], **options)

      @books.push(book_b)
    end
  end

  def load_music_albums
    return unless File.exist?('albums.json')

    File.foreach('albums.json') do |json|
      album = JSON.parse(json)
      author = Author.new(album['id'], album['author_first_name'], album['author_last_name'])
      label = Label.new(album['label_title'], album['label_color'])
      genre = Genre.new(album['genre'])
      @authors.push(author)
      @labels.push(label)
      @genres.push(genre)
      options = { 'id' => album['id'], 'genre' => genre,
                  'author' => author, 'source' => album['source'],
                  'label' => label, 'publish_date' => album['publish_date'],
                  'archive' => album['archive'] }

      music_album_b = MusicAlbum.new(album['on_spotify'], **options)
      @music_albums.push(music_album_b)
    end
  end
end
