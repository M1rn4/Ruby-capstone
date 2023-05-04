class Label
  attr_accessor :title, :color, :items

  def initialize(id, title, color, items)
    @id = id
    @title = title
    @color = color
    @items = items
  end
end