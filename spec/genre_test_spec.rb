require_relative '../genre'
require_relative '../item'

RSpec.describe Genre do
  describe '#add_item' do
    let(:genre) { Genre.new('Action') }
    let(:item) { Item.new(id: 1, genre: genre) }

    it 'adds the item to the items array' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'sets the genre attribute of the item' do
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end
