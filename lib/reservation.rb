module Hotel
  class Reservation
    attr_reader :start_time, :end_time, :room_assigned, :date_range, :cost
    
    def initialize(start_time, end_time, room_assigned: nil)
      
      # @room_assigned = (method to assign a room)
      @date_range = DateRange.new(start_time, end_time)
      @cost = @date_range.days_between * RATE_OF_ROOM 
    end
  end
end