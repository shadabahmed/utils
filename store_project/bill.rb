# Bill class. Takes user and products list as parameters in initializer. Has methods to calculate discount amount
class Bill
  attr_reader :products, :user

  def initialize(user, products)
    @user, @products = user, products
  end
  
  # Adds a product in current product list
  def add_product(product)
    @products << product if product.is_a? Product
  end
  
  # Calculates total without discounts
  def total
    @products.empty? ? 0 : @products.reduce(0){|sum,p| sum += p.price}
  end
  
  # Calculates the discounted amount
  def discounted_total
    return 0 if @products.empty?
    # get total for only grocery items
    non_grocery_total = @products.reject{|p| p.grocery_item?}.reduce(0){|sum,p| sum += p.price}
    # get total for non grocery items
    grocery_total = @products.select{|p| p.grocery_item?}.reduce(0){|sum,p| sum += p.price}
    # calculate applicable discount for the current user
    percent_discount = case true
      when @user.store_employee? then 0.3
      when @user.store_affiliate? then 0.1
      when @user.membership_duration >= 2 then 0.05
      else 0
    end
    # apply percentage discount on non grocery items and add the totals
    total = (non_grocery_total - non_grocery_total*percent_discount) + grocery_total
    # calculate discount on total if it is greater than 100
    amount_discount = (total / 100).to_i * 5
    total -= amount_discount
  end
end
