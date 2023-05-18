require_relative 'menu'
require_relative 'order'
require_relative 'receipt'

class App
  def initialize
    @menu = Menu.new
    @order = ""
  end
  def user_input
    loop do
      puts "What would you like to do?"
      puts "1. See the menu"
      puts "2. Place an order"
      puts "3. View receipt"
      input = gets.chomp
      break if input == ""
      controller(input)
    end
  end

  def controller(input)
    case input
    when "1"
      @menu.show
    when "2"
      place_order
    when "3"
      view_receipt
    end
  end
  
  def place_order
    @order = Order.new
    loop do
      @menu.show
      puts "Choose an item from the menu. Just press enter when you're done."
      selection = gets.chomp
      break if selection == ""
      @order.add(@menu.choose(selection.to_i - 1))
    end
    puts "🎉 Order ##{@order.order_id} placed!\n\n"
  end
  
  def view_receipt
    receipt = Receipt.new(@order)
    puts "\n===RECEIPT FOR ORDER ##{@order.order_id}===\n"
    receipt.itemise.each do |item|
      puts item
    end
    puts "GRAND TOTAL: #{sprintf("£%.2f", receipt.total)}"
    puts "\n"
  end
end

run = App.new
run.user_input
