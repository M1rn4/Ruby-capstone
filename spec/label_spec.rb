require './label'
require './item'

describe Label do
  context 'Test Label class' do
    it 'should create a label' do
      label1 = Label.new('Books', 'Green')
      options = { 'id' => Random.rand(1..1000), 'genre' => 'action game', 'author' => 'author1', 'source' => 'France',
                  'label' => label1, 'publish_date' => '2000/02/22', 'archive' => false }
      item1 = Item.new(**options)
      expect(label1.title).to eq('Books')
      expect(item1.label.title).to eq('Books')
      label1.add_item(item1)
      expect(label1.items.class).to eq(Array)
    end
  end
end
