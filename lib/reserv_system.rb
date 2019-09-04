# require_relative 'room'
# require_relative 'reservation'
# require_relative 'date_range'


RATE_OF_ROOM = 200
NUM_OF_ROOMS = 20

module Hotel
  class ReservSystem
    attr_reader :rooms, :reservations
    
    def initialize()
      @rooms = []
      
      room_num = 1
      NUM_OF_ROOMS.times do
        rooms << Room.new(room_num)
        room_num +=1
      end
      
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
  end
end
