# require_relative 'room'
# require_relative 'reservation'
# require_relative 'date_range'


RATE_OF_ROOM = 200
NUM_OF_ROOMS = 20

module Hotel
  class ReservSystem
    attr_reader :rooms
    
    def initialize()
      @rooms = []
      
      room_num = 1
      NUM_OF_ROOMS.times do
        rooms << Room.new(room_num)
        room_num +=1
      end
    end
  end
end