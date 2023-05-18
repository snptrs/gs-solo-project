# Takeaway Project Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
https://www.icloud.com/freeform/0bb4KGvWwF8hJIhvWCe27Skpg#GS4_-_Solo_project_diagram
```

_Also design the interface of each class in more detail._

```ruby
class Interaction
  def initialize

  end
end

class Menu
  def initialize
    @menu = create
  end

  def create
    # load menu from file and assign to @menu
  end

  def show
    # returns a list of menu items and prices
  end

end

class MenuItem
  def initialize
    @menu_items = {} # {description: price} – imported from a menu CSV file
  end

  def description
    # returns item description as a string
  end

  def price
    # returns price as a float
  end


end

class Order
  def initialize
     # ...
   end

  def display_menu
    # Returns a list of menu items and prices
  end

  def receipt
    Receipt.print(@order_items)
  end


end

class Receipt

  def print_receipt
    @order_items.each { |item| Menu.item_price(item) }


end

class Confirmation

end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Creates menu
menu = Menu.new
expect(menu).to be

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._