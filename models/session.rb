require_relative '../utils.rb'

class Session
	attr_accessor :time, :talks, :name 

	def initialize(time, talks = [], name = "Session")
		@time = time
		@talks = talks
		@name = name
	end

	def add_talk(talk)
		if talk.duration <= @time.minutes_remaining 
			@time.minutes_remaining = @time.minutes_remaining - talk.duration
			talk.start_time = @time.actual_time
			@time.update_actual_time(talk.duration)
			@talks << talk
		end
	end

	def talks
		@talks.each do |t|
			puts "#{t.start_time} #{t.title}"
		end
	end

	def info
		puts "-" * 20
		puts "'#{name}' info: "
		puts "-" * 20
		puts "minutes_remaining: #{@time.minutes_remaining}"
		puts "start_time: #{@time.start_time}"
		puts "min_end_time: #{@time.min_end_time}"
		puts "max_end_time: #{@time.max_end_time}"
		puts "Is valid?: #{Utils.new.is_session_valid?(self)}"
		puts ""
		puts ""
	end

end









