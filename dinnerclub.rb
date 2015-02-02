# Redo DinnerClub class
# Each event will be a new instance of DinnerClub
require "pry"

# Public: #CheckSplitter
# A class to create a Dinner Club event that adds and lists
# members for each outing, stores the name of the restaurant
# for the event and the amount each who attended the event owes
# (by running the CheckSplitter class - WHICH I DO NOT HOW TO
# DO!). Should give total amount each member has paid 
# historically.
class DinnerClub
  
  attr_accessor :members, :restaurant
    
  # Public: initialize
  # Sets initial values for DinnerClub object.
  #
  # Params:
  # + members:                array, a collection of members
  #                           attending Dinner Club event.
  # + restaurant:             string, name of the restaurant.
  # + member_payment_history: float, initial value set to 0.0.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets the three primary attribute variables.
  def initialize(restaurant, *members)
    @members = members
    @restaurant = restaurant
    @member_payment_history = {}
  end

  # Public: add_member
  # Method that adds a new member with an initial value of 0.0
  # to the members array.
  #
  # Params:
  # name: string, new member name.
  # 0.0:  float, initial value of member payment history.
  #
  # Returns:
  # None.
  #
  # State Changes:
  # New member with a member payment history of 0.0 added to
  # members array.  
  def add_member(name)
    @members[name] = 0.0
  end

  # Public: show_member
  # Method that shows the collection of member names.
  #
  # Params:
  # None.
  #
  # Returns:
  # Returns an array of member names and the float value of
  # their member payment history.
  #
  # State Changes:
  # None.   
  def show_members
    @members
  end
  
  # I feel like I am violating the DRY principle with this
  # method. Not sure what I am trying to do.
  def new_split_amount_custom_tip(group_number, meal_cost, tip)
    check_split = CheckSplitter.new(group_number, meal_cost, tip)
    check_split.split_check_custom_tip
  end
  
  # Public: update_payment_history
  # Method that take the split amount and adds it to each 
  # member's member payment history.
  #
  # Params:
  # Unknown.
  #
  # Returns:
  # Returns an array of member names and the float value of
  # their new member payment history.
  #
  # State Changes:
  # Updates the total for each member's member payment history. 
  def update_payment_history
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