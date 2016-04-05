class Track
	attr_accessor :schedule, :name

	def initialize(name = "Track")
		@schedule = Array.new
		@name = name
	end

	def add_session(session)
		@schedule << session
	end

	def add_brake(brake)  
		@schedule << brake
	end

	def schedule
		#exibir as sessões e intervalos existentes
		@schedule.each do |sessions|
			sessions.each do |s|
				if s.is_a?(Session)
					puts s.talks
				elsif s.is_a?(Brake)
					puts s
			end
		end
	end

	def info
		puts "-" * 20
		puts "'#{name}' info: "
		puts "-" * 20
		puts "Session count: #{@schedule.size}"
		puts "Brake count: #{@schedule.size}"
		puts "Is valid?: #{Utils.new.is_track_valid?(self)}"
		puts ""
		puts ""
	end
end