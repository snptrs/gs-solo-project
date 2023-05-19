require 'confirmation'

RSpec.describe "Confirmation unit test" do
  context "when sending an order confirmation" do
    let(:order) { double(:order, order_id: "1234") }
    it "sends an order confirmation" do
      confirmation = Confirmation.new
      expect(confirmation.send(order, ENV["MY_PHONE_NUMBER"])).to be_a(String)
    end
    
    it "fails if no phone number provided" do
      confirmation = Confirmation.new
      expect { confirmation.send(order, "") }.to raise_error "No phone number provided"
    end
  end
end
