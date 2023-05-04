require './menu'
require './game'
class Main
  def initialize
    puts 'Welcome to our catalog!'
  end

  def run
    Menu.new
    selected = gets.chomp.to_i
    puts ''
    puts "You choose option #{selected}"
    return unless selected != 13

    #run

    multiplayer = '4 persons'
    last_played_at = '2020/05/03'

    options = { 'id' => 1, 'genre' => 'action',
     'author' => 'John', 'source' => 'source-1',
     'label' => 'label-1','publish_date'=> '2010/05/03',
     'archive' => false
     }
    game = Game.new(multiplayer,last_played_at,**options)
    
    puts 'here ok ',game.can_be_archive?
    
  
  end
end

main = Main.new
main.run
