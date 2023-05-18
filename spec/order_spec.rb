require 'order'

RSpec.describe Order do
    it "creates a new order" do
      order = Order.new
      expect(order).to be_a_kind_of(Object)
    end
    
    it "has an order ID" do
      order = Order.new
      expect(order.order_id).to be_a_kind_of(Integer)
    end
    
    context "when adding an item to the order" do
      it "accepts and returns a menu item" do
        order = Order.new
        fake_item = double :menu_item
        order.add(fake_item)
        expect(order.list).to eq([fake_item])
      end
    end
end
