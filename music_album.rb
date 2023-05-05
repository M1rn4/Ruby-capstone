require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, options = {})
    super(id, options)
    @on_spotify = options[:on_spotify] || false
  end

  def can_be_archived?
    super && @on_spotify
  end
end
