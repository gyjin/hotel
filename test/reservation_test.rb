require_relative 'test_helper'

describe "Reservation class" do
  describe "Reservation instantiation" do
    before do
      @room = Hotel::Room.new(3)
      @reservation = Hotel::Reservation.new('2019-1-1', '2019-1-5', @room)
    end
    
    it "is an instance of Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end
    
    it "correctly saves instance variables" do
      expect(@reservation.start_time).must_be_kind_of Date
      expect(@reservation.cost).must_equal 800
      expect(@reservation.room_assigned).must_be_kind_of Hotel::Room
      expect(@reservation.room_assigned.id).must_equal 3
    end
  end
end