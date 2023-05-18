# require_relative 'order'

class Receipt
  def initialize(order)
    @order = order
  end
  
  def itemise
    receipt = []
    @order.list.each do |item|
      receipt << "#{item.description} – #{sprintf("£%.2f", item.price)}"
    end
    return receipt
  end
  
  def total
    return @order.list.each.sum {|item| item.price }
  end
end
