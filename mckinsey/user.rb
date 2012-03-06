class User
  attr_reader :membership_duration
  def initialize(store_employee, store_affiliate, membership_duration)
    @store_employee, @store_affiliate, @membership_duration = store_employee, store_affiliate, membership_duration
  end

  def store_employee?
    @store_employee
  end

  def store_affiliate?
    @store_affiliate
  end

end
=begin
users = [[true,false,1]]
products = [[200, false],[400, true], [300, true]]
users.each do |user|
  product_objects = products.collect{|p| Store::Product.new(p)}
  user_object = Store::User.new(user)  
  bill = Store::Bill.new(user_object, product_objects)
  puts bill.total
  puts bill.calculate_total_after_discount
end
=end
