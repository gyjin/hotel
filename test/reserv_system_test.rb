require_relative 'test_helper'

describe "ReservSystem class" do
  describe "ReservSystem instantiation" do
    before do
      @reserv_system = Hotel::ReservSystem.new
    end
    
    it "is an instance of ReservSystem" do
      expect(@reserv_system).must_be_kind_of Hotel::ReservSystem
    end
  end
end