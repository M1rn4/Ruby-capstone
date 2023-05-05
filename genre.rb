require_relative 'item'

class Genre
  attr_reader :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    if item.is_a?(Item)
      @items << item
      item.genre = self
    end
  end
end
