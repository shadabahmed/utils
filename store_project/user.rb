# User class for store. Has methods to identify store_employee, store_affilicate and how many years he has been a user
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

