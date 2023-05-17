require 'menu_item'

RSpec.describe do
  context "having created a menu item" do
    it "returns the description" do
      menu_item = MenuItem.new("Ice cream", 6.50)
      expect(menu_item.description).to eq "Ice cream"
    end

    it "returns the price" do
      menu_item = MenuItem.new("Ice cream", 6.50)
      expect(menu_item.price).to eq 6.50
    end
  end
end