require_relative 'menu'

class Order
  def initialize
    @items = []
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

order = Order.new
order.user_input