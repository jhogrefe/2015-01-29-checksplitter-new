# Redo DinnerClub class
# Each event will be a new instance of DinnerClub
require "pry"


class DinnerClub
  
  attr_accessor :members, :restaurant
  
  def initialize(restaurant, *members)
    @members = members
    @restaurant = restaurant
    @member_payment_history = 0.0
  end
  
  def add_member(name)
    @members[name] = 0.0
  end
  
  def show_members
    @members
  end
  
  def number_in_group
    @members.length
  end
  
  def new_split_amount_custom_tip(amount)
    @member_payment_history += @split_check_standard_tip
  end
  
  def new_split_amount_custom_standard(split_check_standard_tip)
    @member_payment_history += @split_check_standard_custom
  end
  
end

class CheckSplitter
  
  attr_accessor :group_number, :meal_cost, :tip
  
  def initialize(group_number, meal_cost, tip)
    @group_number = group_number
    @meal_cost = meal_cost
    @tip = tip * 0.01
  end
  
  # Define a new split check method with a standard
  # tip of 15% that multiplies the meal cost by tip
  # and divides by the group number to return the
  # value of what each person owes, rounded up. 
  def split_check_standard_tip
    @split_check_standard_tip = ((@meal_cost * 1.15) / @group_number).ceil
  end
  
  # Define a new split check method with a custom
  # tip value entered when initialized that multiplies 
  # the meal cost by tip and divides by the group 
  # number to return the value of what each person owes,
  # rounded up.   
  def split_check_custom_tip
    @split_check_custom_tip = ((@meal_cost * (1 + @tip)) / @group_number).ceil
  end

end


binding.pry