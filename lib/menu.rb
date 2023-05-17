class Menu
  def initialize
    @menu = []
    create
  end

  def create
    @menu << ["item1", 10]
    binding.irb
  end
end