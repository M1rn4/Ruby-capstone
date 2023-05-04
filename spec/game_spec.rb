require './game'
describe Game do
  context 'Testing class Game' do
    it 'should create a Game class' do
      options = { 'id' => 1, 'genre' => 'action',
                  'author' => 'John', 'source' => 'source-1',
                  'label' => 'label-1', 'publish_date' => '2010/05/03',
                  'archive' => false }

      multiplayer = '4 persons'
      last_played_at = '2020/05/03'

      game = Game.new(multiplayer, last_played_at, **options)

      expect(game.last_played_at).to eq('2020/05/03')
      expect(game.multiplayer).to eq('4 persons')
      expect(game.can_be_archive?).to eq(true)

      last_played_at = '2022/05/03'
      game = Game.new(multiplayer, last_played_at, **options)
      expect(game.can_be_archive?).to eq(false)

      options = { 'id' => 1, 'genre' => 'action',
                  'author' => 'John', 'source' => 'source-1',
                  'label' => 'label-1', 'publish_date' => '2020/05/03',
                  'archive' => false }

      last_played_at = '2022/05/03'
      game = Game.new(multiplayer, last_played_at, **options)
      expect(game.can_be_archive?).to eq(false)

      last_played_at = '2020/05/03'
      game = Game.new(multiplayer, last_played_at, **options)
      expect(game.can_be_archive?).to eq(false)
    end
  end
end
