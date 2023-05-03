require './game'
describe Game do
  context 'Testing class Game' do
    it 'should create a Game class' do

      multiplayer = '4 persons'
      last_played_at = '2020/05/03'
      game = Game.new(multiplayer,last_played_at)
      
      expect(game.multiplayer).to eq('4 persons')
      expect(game.last_played_at).to eq('2020/05/03')
      expect(game.can_be_archive?).to eq(true)
    
    end
  end
end
