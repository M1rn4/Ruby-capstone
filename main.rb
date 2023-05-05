require './menu'
require './game'
require './author'
require './app'
class Main
  def initialize
    @app = App.new
    @app.load_game
    puts 'Welcome to our catalog!'
  end

  def run
    Menu.new
    selected = gets.chomp.to_i
    puts ''
    puts "You choose option #{selected}"

    @app.run_option(selected)
    return if selected == 10

    run
  end
end

main = Main.new
main.run
