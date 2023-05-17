require_relative 'menu'

class Order
  def initialize
    @items = []
    @menu = Menu.new
  end
end