require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, options = {})
    super(options)
    @id = id
    @on_spotify = options[:on_spotify]
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(@publish_date)
    difference_in_days = (now - before).to_i

    years = (difference_in_days / 365.25).to_i
    years > 10 && !@on_spotify
  end
end
