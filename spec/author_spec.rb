require './game'
require './author'

describe Author do
  context 'Testing class Author' do
    it 'should create a Author class' do


      genre = double('genre') 
      allow(genre).to receive(:name) { 'Action'} 

      author = double('author') 
      allow(author).to receive(:name) { 'John'} 

      source = double('source') 
      allow(source).to receive(:name) { 'source-1'} 

      label = double('label') 
      allow(label).to receive(:name) { 'label-1'} 


      options = { 'id' => 1, 'genre' => :genre,
                  'author' => :author, 'source' => :source,
                  'label' => :label, 'publish_date' => '2010/05/03',
                  'archive' => false }

      multiplayer = '4 persons'
      last_played_at = '2020/05/03'

      game = Game.new(multiplayer, last_played_at, **options)

      id = 1
      first_name = 'peter'
      last_name = 'smith'
      pet = Author.new(id, first_name, last_name)

      pet.add_item(game)

      expect(game.author.id).to eq(1)
      expect(game.author.first_name).to eq('peter')
      expect(game.author.last_name).to eq('smith')
    end
  end
end
