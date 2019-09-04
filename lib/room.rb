module Hotel
  class Room
    attr_reader :id
    attr_accessor :reservation, :rate
    
    def initialize(id, reservation: nil, rate: nil)
      @id = id
      @reservation = []
      @rate = RATE_OF_ROOM
    end
  end
end