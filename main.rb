require './menu'
require './game'
require './author'
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

    run
  end
end

main = Main.new
main.run
