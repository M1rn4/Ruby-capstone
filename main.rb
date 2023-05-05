require './app_mirna'
require './menu'
class Main
  def initialize
    puts 'Welcome to our catalog!'
    @app = App.new
  end

  def run
    Menu.new
    selected = gets.chomp.to_i
    puts ''
    puts "You choose option #{selected}"
    if selected != 13
      @app.run_option(selected)
      run
    end
    
  end
end

main = Main.new
main.run
