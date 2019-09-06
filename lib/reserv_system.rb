# require_relative 'room'
# require_relative 'reservation'
# require_relative 'date_range'


RATE_OF_ROOM = 200
NUM_OF_ROOMS = 20

module Hotel
  class ReservSystem
    attr_reader :rooms, :reservations
    
    def initialize()
      @rooms = Hotel::Room.all
      @reservations = []
    end
    
    def make_reservation(start_time, end_time)
      room_assigned = nil
      @rooms.each do |curr_room|
        if curr_room.reservation.length == 0
          room_assigned = curr_room
          break
        end
      end
      
      if room_assigned == nil
        raise ArgumentError.new("No rooms are available.")
      end
      
      @reservations << Reservation.new(start_time, end_time, room_assigned)
    end
    
    def reservations_on_date(date)
      date = Date.parse(date)
      reservations_on_date = []
      @reservations.each do |curr_res|
        if date >= curr_res.date_range.start_time && date <= curr_res.date_range.end_time
          reservations_on_date << curr_res
        end
      end
      
      if reservations_on_date.length == 0
        raise ArgumentError.new("There are no reservations on this date.")
      end
      
      return reservations_on_date
    end
  end
end
