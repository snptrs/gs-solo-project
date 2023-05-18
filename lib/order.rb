require_relative 'menu'

class Order
  def initialize
    @items = []
    @order_id = generate_order_id
  end
  
  def generate_order_id
    return rand(1000...9999)
  end
  
  def order_id
    @order_id
  end
  
  def add(item)
    @items << item
  end
  
  def list
    @items
  end
end
