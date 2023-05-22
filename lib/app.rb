require_relative 'menu'
require_relative 'order'
require_relative 'receipt'
require_relative 'confirmation'
require_relative 'output'

class App
  def initialize
    @menu = Menu.new
    @output = Output.new
  end
  
  def user_input
    loop do
      @output.string("What would you like to do?")
      @output.string("1. See the menu")
      @output.string("2. Place an order")
      @output.string("3. View receipt")
      @output.string("4. Send order confirmation")
      @output.string("5. Exit")
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
    when "4"
      send_confirmation  
    when "5"
      exit
    end
  end
  
  def place_order
    @order = Order.new
    loop do
      @menu.show
      @output.string("Choose an item from the menu. Just press enter when you're done.")
      selection = gets.chomp
      break if selection == ""
      @order.add(@menu.choose(selection.to_i))
      @output.string("#{@menu.choose(selection.to_i).description} added to order", :green, :before)
    end
    @output.string("🎉 Order ##{@order.order_id} placed!", :blue, :after)
  end
  
  def view_receipt
    return @output.error("No order placed yet", :pad) if @order == nil
    receipt = Receipt.new(@order)
    @output.header("RECEIPT FOR ORDER ##{@order.order_id}")
    receipt.itemise.each do |item|
      @output.string(item)
    end
    @output.string("GRAND TOTAL: #{@output.currency(receipt.total)}", :blue, :after)
  end

  def send_confirmation
    @output.string("Enter your phone number:")
    phone_number = gets.chomp
    return @output.error("You need to enter a phone number", :after) if phone_number == ""
    confirmation = Confirmation.new
    confirmation.send(@order, phone_number)
    @output.string("✅ Order confirmation sent.", :light_green, :pad)
  end
end

run = App.new
run.user_input
