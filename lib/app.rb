require_relative 'menu'

class App
  def initialize
    @menu = Menu.new
  end
  def user_input
    puts "What would you like to do?"
    puts "1. See the menu"
    puts "2. Place an order"
    input = gets.chomp
    controller(input)
  end

  def controller(input)
    case input
    when "1"
      @menu.show
    end
  end
end

menu = Menu.new
menu.create

interaction = App.new
interaction.user_input