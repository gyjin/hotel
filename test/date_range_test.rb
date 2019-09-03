require_relative 'test_helper'

describe "DateRange class" do
  describe "DateRange instantiation" do
    before do
      @date = Hotel::DateRange.new(Date.parse('2019-4-16'), Date.parse('2019-4-18'))
    end
    
    it "is an instance of DateRange" do
      expect(@date).must_be_kind_of Hotel::DateRange
    end
    
    it "correctly saves the start time" do
      expect(@date.start_time).must_be_kind_of Date
      expect(@date.start_time.to_s).must_equal "2019-04-16"
    end
    
    it "correctly saves the end time" do
      expect(@date.end_time).must_be_kind_of Date
      expect(@date.end_time.to_s).must_equal "2019-04-18"
    end
  end
end