RATE_OF_ROOM = 200
NUM_OF_ROOMS = 20
require 'pry'

module Hotel
  class ReservSystem
    attr_reader :rooms, :reservations
    
    def initialize()
      @rooms = Hotel::Room.all
      @reservations = []
    end
    
    def make_reservation(start_time, end_time)
      not_reserved_rooms = not_reserved_on_date_range(start_time, end_time)
      
      if not_reserved_rooms.length == 0
        raise ArgumentError.new("Cannot make a reservation for that date range. No rooms available.")
      else
        new_res = Reservation.new(start_time, end_time, not_reserved_rooms[0])
        @reservations << new_res
        not_reserved_rooms[0].reservation << new_res
      end
    end
    
    def not_reserved_on_date_range(start_time, end_time)
      not_reserved_rooms = []
      
      @rooms.each do |curr_room|
        if curr_room.reservation.length == 0
          not_reserved_rooms << curr_room
        else
          curr_room.reservation.each do |each_res|
            if each_res.overlap?(start_time, end_time) == false
              not_reserved_rooms << curr_room
            end
          end
        end
      end
      
      return not_reserved_rooms
    end
  end
end
