require_relative 'test_helper'

describe "Room class" do
  describe "Room instantiation" do
    before do
      @room = Hotel::Room.new(1)
    end
    
    it "is an instance of Room" do
      expect(@room).must_be_kind_of Hotel::Room
    end
    
    it "correctly saves instance variables" do
      expect(@room.id).must_equal 1
      expect(@room.reservation).must_be_kind_of Array
      expect(@room.reservation.length).must_equal 0
      expect(@room.rate).must_equal 200
    end
  end
end