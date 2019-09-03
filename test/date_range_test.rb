require_relative 'test_helper'

describe "DateRange class" do
  describe "DateRange instantiation" do
    before do
      @date = Hotel::DateRange.new(Date.new(2019, 4, 16), Date.new(2019, 4, 18))
    end
    
    it "is an instance of DateRange" do
      expect(@date).must_be_kind_of Hotel::DateRange
    end
  end
end