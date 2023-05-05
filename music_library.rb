require 'json'
require_relative 'music_album'

class MusicLibrary
  def initialize
    @music_albums = load_music_albums_from_file
  end

  def all_genres
    @music_albums.map(&:genre).uniq
  end

  def add_music_album(album)
    @music_albums ||= []
    
    @music_albums << album 
    
    puts "Added album '#{album.title}' to the catalog"
    
    save_music_albums_to_file 
    
  end


  private

  def load_music_albums_from_file
    if File.exist?("music_albums.json")
      file = File.read("music_albums.json")
      music_albums_data = JSON.parse(file)
      @music_albums = music_albums_data.map do |album_data|
        MusicAlbum.new(
          id: album_data["id"],
          title: album_data["title"],
          artist: album_data["artist"],
          genre: album_data["genre"],
          publish_date: album_data["publish_date"],
          on_spotify: album_data["on_spotify"]
        )
      end
    else
      @music_albums = []
    end
  end
  
  
  def save_music_albums_to_file
    File.open('music_albums.json', 'w') do |file|
      json_data = @music_albums.map(&:to_json)
      file.write(json_data.to_json)
    end
  end
 
end
