class Game < Item
  attr_accessor  :multiplayer :last_played_at 

  def initialize (multiplayer,last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archive?
    
    now = Date.today
    before = Date.parse(@last_played_at)
    difference_in_days = (now - before).to_i
    years = (difference_in_days / 365.25).to_i

   if super && years >2 
    true
   else
    false
   end

  end

end