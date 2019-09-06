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
      
      it "can assign a room to a new reservation" do
        expect(@reserv_system.reservations[0]).must_be_kind_of Hotel::Reservation
        expect(@reserv_system.reservations[0].room_assigned).must_be_kind_of Hotel::Room
        expect(@reserv_system.reservations[0].room_assigned.id).must_equal 1
      end
      
      it "returns a 'no rooms are available on given date' if so" do
        @reserv_system.rooms.each do |curr_room|
          curr_room.reservation = ["full"]
        end
        expect(@reserv_system.make_reservation('2019-3-1', '2019-3-6')).must_equal "No rooms are available for that date range."
      end
    end
    
    describe "searching for reservations on a given date" do
      before do 
        @reserv_system = Hotel::ReservSystem.new
        @reserv_system.make_reservation('2019-3-1', '2019-3-6')
        @reserv_system.make_reservation('2019-3-4', '2019-3-6')
      end
      
      it "can return all reservations on a given date" do
        expect(@reserv_system.reservations_on_date('2019-3-4')).must_be_kind_of Array
        expect(@reserv_system.reservations_on_date('2019-3-4').length).must_equal 2
        expect(@reserv_system.reservations_on_date('2019-3-4')[0]).must_be_kind_of Hotel::Reservation
        expect(@reserv_system.reservations_on_date('2019-3-4')[0].date_range.start_time).must_be_kind_of Date
        expect(@reserv_system.reservations_on_date('2019-3-4')[0].date_range.start_time.to_s).must_equal '2019-03-01'
      end
      
      it "returns a 'no reservations are on a given date' message if so" do
        expect(@reserv_system.reservations_on_date('2019-2-16')).must_equal "There are no reservations on this date."
      end
    end
  end
end


