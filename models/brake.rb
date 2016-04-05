class Brake
	attr_reader 	:title, :duration, :locked_start_time
	attr_accessor	:start_time

	def initialize(title, duration)
		@title 						 = title
		@duration 				 = duration
		@start_time 			 = ""
		@locked_start_time = false
	end

	def brake
		puts "#{self.start_time} #{self.title}"
	end

	def lock_start_time_at(t)
		if t.is_a?(Time)
			@start_time = t.strftime("%I:%M%p")
			@locked_start_time = true
		end
	end

	def unlock_start_time
		@locked_start_time = false
	end

end