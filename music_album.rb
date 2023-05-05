require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :genre, :publish_date, :on_spotify, :artist

  def initialize(id: nil, title: nil, genre: nil, publish_date: nil, on_spotify: nil, artist: nil)
    super(id: id, title: title, genre: genre, publish_date: publish_date, on_spotify: on_spotify, artist: artist)
    
    @id = id
    @title = title
    @genre = genre
    @publish_date = publish_date
    @on_spotify = on_spotify
    @artist = artist
  end

  def to_json(*args)
    {
      title: @title,
      artist: @artist,
      genre: @genre,
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }.to_json(*args)
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(@publish_date)
    difference_in_days = (now - before).to_i

    years = (difference_in_days / 365.25).to_i
    years > 10 && !@on_spotify
  end
end
