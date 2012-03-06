class Bill
  attr_accessor :products, :user

  def initialize(user, products = [])
    @user, @products = user, products
  end

  def add_product(product)
    @products << product if product.is_a? Product
  end
  
  def total
    @products.reduce(0){|sum,p| sum += p.price}
  end

  def calculate_total_after_discount
    p @products
    non_grocery_total = @products.reject{|p| p.grocery_item}.reduce(0){|sum,p| sum += p.price}
    grocery_total = @products.select{|p| p.grocery_item}.reduce(0){|sum,p| sum += p.price}
    percent_discount = case true
      when @user.store_employee then 0.3
      when @user.store_affiliate then 0.1
      when @user.membership_duration > 2 then 0.05
      else 0
    end
    total = (non_grocery_total - non_grocery_total*percent_discount) + grocery_total
    amount_discount = (total / 100).to_i * 5
    total -= amount_discount
  end
end
