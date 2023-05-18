class MenuItem
  def initialize(description, price)
    @description = description
    @price = price.to_f
  end

  def description
    @description
  end

  def price
    @price
  end
end
