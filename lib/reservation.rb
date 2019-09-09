module Hotel
  class Reservation
    attr_reader :start_time, :end_time, :room_assigned, :date_range, :cost
    
    def initialize(start_time, end_time, room_assigned)
      @room_assigned = room_assigned
      @start_time = Date.parse(start_time)
      @end_time = Date.parse(end_time)
      @cost = days_between * RATE_OF_ROOM 
    end
    
    def days_between
      return @end_time - @start_time
    end
  end
end