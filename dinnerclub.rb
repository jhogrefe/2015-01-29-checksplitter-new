# Redo DinnerClub class

require_relative "checksplitter"
require "pry"

class DinnerClub
  
  attr_accessor :member, :event
  
  def initialize(event, member)
    if !member.is_a(Array)
      raise "ERROR! Enter an array for members."
    end
    @event = event
    @member = member
  end
  
  def add_member
  end
  
  def remove_member
  end
  
  def show_members
    @member
  end
  
  def member_report
  end
  
  def add_event
  end
  
  def show_event
    @event
  end
  
end