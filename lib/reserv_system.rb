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
      not_reserved_rooms = not_reserved_on_date_range(start_time, end_time)
      
      if not_reserved_rooms.class == Array
        new_res = Reservation.new(start_time, end_time, not_reserved_rooms[0])
        @reservations << new_res
        not_reserved_rooms[0].reservation << new_res
      else
        return ("Cannot make a reservation for that date range. No rooms available.")
      end
    end
    
    
    def not_reserved_on_date_range(start_time, end_time)
      start_time = Date.parse(start_time)
      end_time = Date.parse(end_time)
      
      not_reserved_rooms = []
      
      @rooms.each do |curr_room|
        if curr_room.reservation.length == 0
          not_reserved_rooms << curr_room
        else
          curr_room.reservation.each do |each_res|
            if overlap?(start_time, end_time, 
              each_res.date_range.start_time, each_res.date_range.end_time) == true
              break
            else
              not_reserved_rooms << curr_room
            end
          end
        end
      end
      
      if not_reserved_rooms.length == 0
        return ("There are no rooms available for that date range.")
      else
        return not_reserved_rooms
      end
    end
    
    def overlap?(first_start, first_end, second_start, second_end)
      if first_start < second_end && second_start < first_end
        return true
      else
        return false
      end
    end
  end
end
