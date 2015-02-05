# Redo checksplitter class

require "pry"
require "sqlite3"

DATABASE = SQLite3::Database.new("checksplitter.db")

DATABASE.execute("CREATE TABLE checksplitter (id INTEGER PRIMARY KEY, 
group_number INTEGER, meal_cost INTEGER, tip DECIMAL(3,2))")

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