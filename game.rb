require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, **options)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(**options)
  end

  def can_be_archive?
    year_days = 365.25
    now = Date.today
    before = Date.parse(@last_played_at)
    difference_in_days = (now - before).to_i

    super && difference_in_days > 2 * year_days
  end
end
