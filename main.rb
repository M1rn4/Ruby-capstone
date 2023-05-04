require './menu'
require './game'
require './author'
require './app'
class Main
  def initialize
    @app = App.new
    puts 'Welcome to our catalog!'
  end

  def run
    Menu.new
    selected = gets.chomp.to_i
    puts ''
    puts "You choose option #{selected}"

    return unless selected != 10

    @app.run_option(selected)

    run
  end
end

main = Main.new
main.run
