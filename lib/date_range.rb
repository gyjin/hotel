module Hotel
  class DateRange
    attr_reader :start_time, :end_time
    
    def initialize(start_time, end_time)
      if start_time.class != Date 
        start_time = Date.parse(start_time)
      end
      
      if end_time.class != Date
        end_time = Date.parse(end_time)
      end
      
      if end_time < start_time
        raise ArgumentError.new("The end time cannot be before the start time.")
      else
        @start_time = start_time
        @end_time = end_time
      end
    end
    
    def days_between
      return @end_time - @start_time
    end
  end
end