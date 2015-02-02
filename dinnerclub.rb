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

# Public: #CheckSplitter
# A class to determine how much each person in a group
# owes based on the meal cost, and the amount of the split 
# check based on tip (both standard 15% and a custom tip amount).

class CheckSplitter
  
  attr_accessor :group_number, :meal_cost, :tip
  
  # Public: initialize
  # Sets initial values for CheckSplitter object.
  #
  # Params:
  # + meal_cost:    integer, total price (in dollars,
  #                 rounded up)
  # + group_number: integer, the number of people in group (not sure 
  #                 how to pull in value from DinnerClub class when 
  #                 getting an array count of the members).
  # + tip:          integer, percentage to tip, e.g. 15% => 15
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets the three primary attribute variables.
  
  def initialize(group_number, meal_cost, tip)
    @group_number = group_number
    @meal_cost = meal_cost
    @tip = tip * 0.01
  end
  
  # Public: split_check_standard_tip
  # Method that gives how much each person owes based 
  # on standard tip.
  #
  # Params:
  # @meal_cost:    integer, total cost of bill.
  # 1.15:          float, 15 percent standard tip.
  # @group-number: integer, number of people in the group.
  # .ceil:         method to round up float to integer.
  #
  # Returns:
  # @split_check_standard_tip: integer, created from a rounded up
  #                            float. Made split_check_standard_tip an
  #                            an instance variable to use in DinnerClub
  #                            class.
  #
  # State Changes:
  # None.
  def split_check_standard_tip
    @split_check_standard_tip = ((@meal_cost * 1.15) / @group_number).ceil
  end
  
  # Public: split_check_custom_tip
  # Method that gives how much each person owes based 
  # on custom tip entered in initialize method parameters.
  #
  # Params:
  # @meal_cost:    integer, total cost of bill.
  # @tip:          float, tip percent entered in initialize params.
  # @group-number: integer, number of people in the group.
  # .ceil:         method to round up float to integer.
  #
  # Returns:
  # @split_check_custom_tip:   integer, created from a rounded up
  #                            float. Made split_check_custom_tip an
  #                            an instance variable to use in DinnerClub
  #                            class.
  #
  # State Changes:
  # None.  
  def split_check_custom_tip
    @split_check_custom_tip = ((@meal_cost * (1 + @tip)) / @group_number).ceil
  end

end


binding.pry