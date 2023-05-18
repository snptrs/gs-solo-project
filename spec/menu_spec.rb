require 'menu'

RSpec.describe Menu do
  it "creates a menu" do
    menu = Menu.new
    expect(menu).to be
  end
  
  context "when adding a menu item" do
    it "adds the item" do
      menu = Menu.new
      menu.add_item("Sushi", 13.75)
      expect((menu.instance_variable_get(:@menu)).length).to eq 1
    end
  end

  context "when loading a CSV file" do
    it "loads the contents" do
      menu = Menu.new
      menu.load_file
      expect((menu.instance_variable_get(:@menu)).length).to be > 0
    end
  end
  
  context "when choosing a menu item" do
    it "returns the chosen menu item" do
      menu = Menu.new
      menu.add_item("Cake", 2.50)
      item = menu.choose("1")
      expect(item.description).to eq "Cake"
    end

    it "returns the chosen menu item" do
      menu = Menu.new
      menu.add_item("Cake", 2.50)
      menu.add_item("Pizza", 12.50)
      item = menu.choose("2")
      expect(item.description).to eq "Pizza"
    end
  end

end
