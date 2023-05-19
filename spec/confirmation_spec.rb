require 'confirmation'

RSpec.describe do
  context "when sending an order confirmation" do
    let(:order) { double(:order, order_id: "1234") }
    it "sends an order confirmation" do
      confirmation = Confirmation.new
      confirmation.send(order, "07700000000")
    end
  end
end
