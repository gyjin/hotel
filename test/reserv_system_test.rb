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
      
      it "raises an exception if no rooms are available" do
        @reserv_system.rooms.each do |curr_room|
          curr_room.reservation = ["full"]
        end
        expect{
          @reserv_system.make_reservation('2019-3-1', '2019-3-6')
        }.must_raise ArgumentError
      end
    end
  end
end

