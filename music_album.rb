require './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, id = Random.rand(1..1000), **options)
    super(**options)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    if super() || @on_spotify == true
      true
    else
      false
    end
  end
end
