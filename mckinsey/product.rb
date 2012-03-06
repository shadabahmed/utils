class Product
  attr_reader :price

  def initialize(price, grocery_item)
    @price, @grocery_item = price, grocery_item
  end

  def grocery_item?
    @grocery_item
  end

end
