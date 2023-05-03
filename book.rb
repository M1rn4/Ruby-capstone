require './item'
class Book < Item
  def initialize(id, publisher, cover_state, **options)
    super(id, **options)
    @publisher = publisher
    @cover_state = cover_state
  end
end