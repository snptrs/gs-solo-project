require 'menu'

RSpec.describe Menu do
  it "creates a menu" do
    menu = Menu.new
    expect(menu).to be
  end
end