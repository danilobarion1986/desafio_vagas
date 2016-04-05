class Brake
	attr_accessor :title, :duration
	attr_accessor	:start_time

	def initialize(t, d)
		@title = t
		@duration = d
		@start_time = ""
	end

end