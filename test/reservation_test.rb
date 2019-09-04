require_relative 'test_helper'

describe "Reservation class" do
  describe "Reservation instantiation" do
    before do
      @reservation = Hotel::Reservation.new('2019-1-1', '2019-1-5')
    end
    
    it "is an instance of Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end
    
    it "correctly saves instance variables" do
      expect(@reservation.date_range).must_be_kind_of Hotel::DateRange
      expect(@reservation.cost).must_equal 800
      # expect(@reservation.room_assigned).must_be_kind_of Room
      
    end
  end
end