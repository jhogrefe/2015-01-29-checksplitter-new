# Redo DinnerClub class
require "pry"


class DinnerClub
  
  attr_accessor :member, :event
  
  def initialize(event, *member)
    @event = event
    @member = member
  end
  
  def add_member(member)
    @member << member
  end
  
  def show_members
    @member
  end
  
  def member_report_custom_tip_split
  end
  
  def show_event
    @event
  end
  
end

binding.pry