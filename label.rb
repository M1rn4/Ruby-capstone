class Label
  attr_accessor :title
  attr_reader :items

  def initialize(title, color, id = Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end
end
