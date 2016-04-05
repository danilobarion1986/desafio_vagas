class Track
	attr_accessor :schedule, :sessions, :brakes, :time, :name

	def initialize(time, name = "Track")
		@schedule = Array.new
		@sessions = Array.new
		@brakes 	=	Array.new
		@time 		= time
		@name 		= name
	end

	def add_session(session)
		@time.minutes_remaining = @time.minutes_remaining - session.duration
		#@time.start_time = @time.actual_time
		@time.update_actual_time(session.duration)
		@sessions << session
		@schedule << session
	end

	def add_brake(brake)  
		@time.minutes_remaining = @time.minutes_remaining - brake.duration
		brake.start_time = @time.actual_time unless brake.locked_start_time
		@time.update_actual_time(brake.duration)
		@brakes << brake
		@schedule << brake
	end

	def sessions
		@sessions.each do |s|
			puts s
		end
	end

	def brakes
		@brakes.each do |b|
			puts b
		end
	end

	def schedule
		puts "#{name}"
		@schedule.each do |obj|
			if obj.is_a?(Session)
				obj.talks
			elsif obj.is_a?(Brake)
			 	obj.brake
			end
		end
	end

	def info
		puts "-" * 20
		puts "'#{name}' info: "
		puts "-" * 20
		puts "Session count: #{@sessions.size}"
		puts "Brake count: #{@sessions.size}"
		puts "Is valid?: #{Utils.new.is_track_valid?(self)}"
		puts ""
		puts ""
	end
end