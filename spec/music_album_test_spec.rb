require_relative '../music_album'

RSpec.describe MusicAlbum do
  describe "#can_be_archived?" do
    it "returns true when the album is over 10 years old and is not on Spotify" do
      album = MusicAlbum.new(1, { publish_date: '2000-01-01', on_spotify: false })
      expect(album.can_be_archived?).to eq(true)
    end

    it "returns false when the album is over 10 years old but is still on Spotify" do
      album = MusicAlbum.new(2, { publish_date: '2000-01-01', on_spotify: true })
      expect(album.can_be_archived?).to eq(false)
    end

    it "returns false when the album is less than 10 years old and is not on Spotify" do
      album = MusicAlbum.new(3, { publish_date: '2020-01-01', on_spotify: false })
      expect(album.can_be_archived?).to eq(false)
    end

    it "returns false when the album is less than 10 years old and is on Spotify" do
      album = MusicAlbum.new(4, { publish_date: '2020-01-01', on_spotify: true })
      expect(album.can_be_archived?).to eq(false)
    end
  end
end
