require 'menu'

RSpec.describe Menu do
  it "creates a menu" do
    menu = Menu.new
    expect(menu).to be
  end

  context "when choosing a menu item" do
    it "returns the chosen menu item" do
      menu = Menu.new
      item = menu.choose("1")
      expect(item.description).to eq "Cake"
    end

    it "returns the chosen menu item" do
      menu = Menu.new
      item = menu.choose("2")
      expect(item.description).to eq "Pizza"
    end
  end
end
