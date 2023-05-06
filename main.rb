require './app_mirna'
require './menu'
require './game'
require './author'
require './app'
class Main
  def initialize
    @app = App.new
    @app.load_data
    puts 'Welcome to our catalog!'
    @app = App.new
  end

  def run
    Menu.new
    selected = gets.chomp.to_i
    @app.run_option(selected)
    return if selected == 10

    run
  end
end

main = Main.new
main.run
