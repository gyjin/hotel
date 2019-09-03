require_relative 'room'
require_relative 'reservation'
require_relative 'date_range'

module Hotel
  class ReservSystem
    def initialize()
      @rooms = []
      
      counter = 1
      NUM_OF_ROOMS.times do
        Room.new(counter)
      end
    end
  end
end