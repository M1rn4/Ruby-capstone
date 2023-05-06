require './genre'
require './item'

describe Genre do
  context 'Test Genre class' do
    it 'should create a genre' do
      genre1 = Genre.new('Fantasy')
      options = { 'genre' => genre1, 'author' => 'author1', 'source' => 'France',
                  'label' => 'label1', 'publish_date' => '2000/02/22', 'archive' => false }
      item1 = Item.new(**options)
      expect(genre1.name).to eq('Fantasy')
      expect(item1.genre.name).to eq('Fantasy')
      genre1.add_item(item1)
      expect(genre1.items.class).to eq(Array)
    end
  end
end
