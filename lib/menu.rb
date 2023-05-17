require 'csv'
require_relative 'menu_item.rb'

class Menu
  def initialize
    @menu = []
    create
  end

  def create
    File.open('menu_items.csv', 'r') do |file|
      CSV.foreach(file) do |row|
        menu_item = MenuItem.new(row[0], row[1])
        @menu << menu_item
      end
    end
  end

  def show
    @menu.each_with_index do |item, i|
      puts "#{i + 1}. #{item.description} – #{item.price}"
    end
  end

end

menu = Menu.new
menu.show