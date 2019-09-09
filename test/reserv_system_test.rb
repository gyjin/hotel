require_relative 'test_helper'

describe "ReservSystem class" do
  describe "ReservSystem instantiation" do
    before do
      @reserv_system = Hotel::ReservSystem.new
    end
    
    it "is an instance of ReservSystem" do
      expect(@reserv_system).must_be_kind_of Hotel::ReservSystem
    end
    
    it "correctly saves all instances of Room" do
      expect(@reserv_system.rooms).must_be_kind_of Array
      expect(@reserv_system.rooms.length).must_equal 20
      expect(@reserv_system.rooms.first.id).must_equal 1
      expect(@reserv_system.rooms.last.id).must_equal 20
      expect(@reserv_system.rooms[10].id).must_equal 11
    end
  end
  
  describe "ReservSystem methods" do
    describe "making a new reservation" do
      before do
        @reserv_system = Hotel::ReservSystem.new
        @reserv_system.make_reservation('2019-3-1', '2019-3-6')
      end
      
      it "can make a new reservation" do
        expect(@reserv_system.reservations).must_be_kind_of Array
        expect(@reserv_system.reservations.length).must_equal 1
      end
      
      it "can correctly assign a room to a new reservation" do
        expect(@reserv_system.reservations[0]).must_be_kind_of Hotel::Reservation
        expect(@reserv_system.reservations[0].room_assigned).must_be_kind_of Hotel::Room
        expect(@reserv_system.reservations[0].room_assigned.id).must_equal 1
        
        @reserv_system.make_reservation('2019-3-4', '2019-3-8')
        expect(@reserv_system.reservations.length).must_equal 2
        expect(@reserv_system.reservations[1].room_assigned.id).must_equal 2
      end
      
      it "raises an error if a reservation is made when all rooms are booked" do
        @reserv_system.rooms.each do |curr_room|
          curr_room.reservation = [Hotel::Reservation.new('2019-1-1', '2019-1-5', curr_room)]
        end
        expect{@reserv_system.make_reservation('2019-1-1', '2019-1-5')}.must_raise ArgumentError
      end
    end
    
    describe "determining date overlap" do
      before do
        @reserv_system = Hotel::ReservSystem.new
        @date_1 = Date.parse('2019-4-06')
        @date_2 = Date.parse('2019-4-10')
        @date_3 = Date.parse('2019-4-14')
        @date_4 = Date.parse('2019-4-18')
      end
      
      it "returns false if the end of one date range overlaps the beginning of another" do
        expect(@reserv_system.overlap?(@date_1, @date_3, @date_2, @date_4)).must_equal true
        expect(@reserv_system.overlap?(@date_2, @date_4, @date_1, @date_3)).must_equal true
      end
      
      it "returns false if a date range is inside the other" do
        expect(@reserv_system.overlap?(@date_1, @date_4, @date_2, @date_3)).must_equal true
        expect(@reserv_system.overlap?(@date_2, @date_3, @date_1, @date_4)).must_equal true
      end
      
      it "returns true if the end of one date range is on the same day as the start of another" do
        expect(@reserv_system.overlap?(@date_1, @date_2, @date_2, @date_3)).must_equal false
        expect(@reserv_system.overlap?(@date_2, @date_3, @date_1, @date_2)).must_equal false
      end
      
      it "returns true if the date ranges do not overlap" do
        expect(@reserv_system.overlap?(@date_1, @date_2, @date_3, @date_4)).must_equal false
      end
    end
    
    describe "listing all available rooms for a date range" do
      before do
        @reserv_system = Hotel::ReservSystem.new
      end
      
      it "can correctly return all available rooms" do
        @reserv_system.make_reservation('2019-3-1', '2019-3-6')
        @reserv_system.make_reservation('2019-3-5', '2019-3-8')
        @reserv_system.make_reservation('2019-4-1', '2019-4-5')
        
        @all_rooms = @reserv_system.not_reserved_on_date_range('2019-3-2', '2019-4-3')
        expect(@all_rooms).must_be_kind_of Array
        expect(@all_rooms.length).must_equal 18
      end
      
      it "returns a 'no rooms are available on given date' if so" do
        20.times do 
          @reserv_system.make_reservation('2019-3-1', '2019-3-6')
        end
        expect(@reserv_system.not_reserved_on_date_range('2019-3-1', '2019-3-6')).must_equal "There are no rooms available for that date range."
      end
    end
  end
end

