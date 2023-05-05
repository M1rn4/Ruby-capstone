require './item'
class Book < Item
  def initialize(publisher, cover_state, **options)
    super(**options)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived
    if super() || @cover_state == 'bad'
      true
    else
      false
    end
  end
end
