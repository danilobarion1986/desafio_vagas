class TimeBlock
	attr_accessor :start_time, :min_end_time, :max_end_time, 
								:minutes_remaining, :max_advance, :max_late,
								:min_duration, :max_duration, :actual_time

	def initialize(start_time, min_end_time, max_end_time = min_end_time, max_advance = 0.0, max_late = 0.0)
		@start_time 			 = start_time	
		@min_end_time 		 = min_end_time
		@max_end_time 		 = max_end_time
		@max_advance 			 = max_advance
		@max_late 				 = max_late
		@minutes_remaining = (@max_end_time - @start_time) / 60.0
		@max_duration 		 = (@max_end_time - @start_time) / 60.0
		@min_duration 		 = (@min_end_time - @start_time) / 60.0
		@actual_time 			 = @start_time
	end

	def actual_time
		@actual_time.strftime("%I:%M%p")
	end
	
	def update_actual_time(minutes)	
		@actual_time = @actual_time + (minutes * 60)
	end
	
end