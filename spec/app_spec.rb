require 'app'

RSpec.describe Interaction do
  xit "accepts input" do
    # Figure out how to test for input
  end
  
  it "shows the current order" do
    app = App.new
    expect(app.view_order).to eq 
  end
end
