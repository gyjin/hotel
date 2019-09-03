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
end