# Redo DinnerClub class
# Each event will be a new instance of DinnerClub
require "pry"


class DinnerClub
  
  attr_accessor :member, :event
  
  def initialize
    @member = {}
    @event = []
  end
  
  def add_member(name)
    @member[name] = 0.0
  end
  
  def show_members
    @member
  end
  
  def number_in_group
    @member.length
  end
  
  def add_event(new)
    new = @member  
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
    ((@meal_cost * 1.15) / @group_number).ceil
  end
  
  # Define a new split check method with a custom
  # tip value entered when initialized that multiplies 
  # the meal cost by tip and divides by the group 
  # number to return the value of what each person owes,
  # rounded up.   
  def split_check_custom_tip
    ((@meal_cost * (1 + @tip)) / @group_number).ceil
  end

end


binding.pry