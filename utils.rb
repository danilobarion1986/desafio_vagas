class Utils
	def read(input) 
		if File.file?(input)
			read_file_by_line(input) 
		else 
			puts "Argument is not a valid file!"
		end
	end

	def read_file_by_line(input)
		array = Array.new			
		File.open(input, 'r') do |lines|
			while line = lines.gets
				array << line.chomp
			end
			array
		end
	end

	def is_talk_valid?(talk)
		talk.is_a?(String) && !talk.empty? && ( /[0-9]min/.match(talk) || talk.include?("lightning") )
	end

	def is_session_valid?(session)
		st = session.time
		(st.start_time < st.min_end_time) && 
		(st.start_time < st.max_end_time) &&
		(st.min_end_time <= st.max_end_time) &&
		(st.minutes_remaining == 0.0) && 
		(session.talks.is_a?(Array))
	end

	def is_track_valid?(track)
		true
	end

	def is_period_and_track_valids?(period, track)
		(period == :morning || period == :afternoon) && (track == :one || track == :two)
	end

	
end
