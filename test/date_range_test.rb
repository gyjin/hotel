require_relative 'test_helper'

describe "DateRange class" do
  describe "DateRange instantiation" do
    before do
      @date = Hotel::DateRange.new('2019-4-16', '2019-4-18')
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
    
    it "raises an exception if start&end times are invalid" do
      expect {
        Hotel::DateRange.new('2019-4-20', '2019-4-18')
      }.must_raise ArgumentError
    end
  end
  
  
  describe "DateRange methods" do
    before do
      @date = Hotel::DateRange.new('2019-4-16', '2019-4-20')
    end
    
    it "correctly calculates the number of days between start&end times" do
      expect(@date.days_between).must_equal 4
    end
  end
end
