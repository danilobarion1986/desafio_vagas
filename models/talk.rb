class Talk
	attr_reader 	:title, :duration
	attr_accessor	:start_time
		
	def initialize(talk_string)
		@title 			= title_of(talk_string)
		@duration 	= duration_of(talk_string)
		@start_time = ""
	end

	private
		def title_of(talk)
			talk
		end

		def duration_of(talk)
			return talk[-5..-4].to_i unless talk.include?("lightning")
			return 5
		end
end