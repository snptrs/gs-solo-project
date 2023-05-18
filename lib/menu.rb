require 'csv'
require_relative 'menu_item'

class Menu
  def initialize
    @menu = []
    load_file
  end

  def add_item(description, price)
    menu_item = MenuItem.new(description, price)
    @menu << menu_item
  end

  def load_file
    File.open('menu_items.csv', 'r') do |file|
      CSV.foreach(file) do |row|
        menu_item = add_item(row[0], row[1])
      end
    end
  end

  def show
    puts "\n===MENU==="
    @menu.each_with_index do |item, i|
      puts "#{i + 1}. #{item.description} – #{sprintf("£%.2f", item.price)}"
    end
    puts "\n"
  end

  def choose(item)
    @menu[item.to_i - 1]
  end

end
