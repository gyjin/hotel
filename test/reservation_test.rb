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
  
  describe "determining date overlap" do
    before do
      @reserv_system = Hotel::ReservSystem.new
      @room = Hotel::Room.new(1)
      @date_1 = '2019-4-06'
      @date_2 = '2019-4-10'
      @date_3 = '2019-4-14'
      @date_4 = '2019-4-18'
    end
    
    it "returns true if the end of one date range overlaps the beginning of another" do
      new_res = Hotel::Reservation.new(@date_1, @date_3, @room)
      new_res2 = Hotel::Reservation.new(@date_2, @date_4, @room)
      expect(new_res.overlap?(@date_2, @date_4)).must_equal true
      expect(new_res2.overlap?(@date_1, @date_3)).must_equal true
    end
    
    
    it "returns true if a date range is inside the other" do
      new_res = Hotel::Reservation.new(@date_1, @date_4, @room)
      new_res2 = Hotel::Reservation.new(@date_2, @date_3, @room)
      expect(new_res.overlap?(@date_2, @date_3)).must_equal true
      expect(new_res2.overlap?(@date_1, @date_4)).must_equal true
    end
    
    it "returns false if the end of one date range is on the same day as the start of another" do
      new_res = Hotel::Reservation.new(@date_1, @date_2, @room)
      new_res2 = Hotel::Reservation.new(@date_2, @date_3, @room)
      expect(new_res.overlap?(@date_2, @date_3)).must_equal false
      expect(new_res2.overlap?(@date_1, @date_2)).must_equal false
    end
    
    it "returns false if the date ranges do not overlap" do
      new_res = Hotel::Reservation.new(@date_1, @date_2, @room)
      expect(new_res.overlap?(@date_3, @date_4)).must_equal false
    end
  end
end

