require_relative 'menu'
require_relative 'order'

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
    when "2"
      place_order
    end
  end
  
  def place_order
    order = Order.new
    loop do
      @menu.show
      puts "Choose an item from the menu. Just press enter when you're done."
      selection = gets.chomp
      binding.irb
      break if selection == ""
      order.add(@menu.choose(selection.to_i - 1))
    end
  end
end

interaction = App.new
interaction.user_input
