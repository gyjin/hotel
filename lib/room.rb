module Hotel
  class Room
    attr_reader :id
    attr_accessor :reservation, :rate
    
    def initialize(id, reservation: nil, rate: nil)
      @id = id
      @reservation = []
      @rate = RATE_OF_ROOM
    end
    
    def self.all
      all_rooms = []
      room_num = 1
      NUM_OF_ROOMS.times do
        all_rooms << Room.new(room_num)
        room_num +=1
      end
      return all_rooms
    end
  end
end