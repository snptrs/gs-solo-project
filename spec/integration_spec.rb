require 'app'
require 'menu'
require 'order'

RSpec.describe "takeaway" do
  context "when placing an order" do
    xit "something" do
      app = App.new
    end
  end
end

RSpec.describe do
  context "when sending an order confirmation" do
    let(:order) { double(:order, order_id: "1234") }
    it "sends an order confirmation" do
      confirmation = Confirmation.new
      expect(confirmation.send(order, "07700000000")).to be_a(String)
    end
    
    it "fails if no phone number provided" do
      confirmation = Confirmation.new
      expect { confirmation.send(order, "") }.to raise_error "No phone number provided"
    end
  end
end
