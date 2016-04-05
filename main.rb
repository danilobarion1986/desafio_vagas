require 'date'
require_relative "utils"
Dir[__dir__ + '/models/*.rb'].each {|file| require file }

u = Utils.new
all_talks = u.read(ARGV.first.to_s)
valid_talks = Array.new

all_talks.each do |talk|
	if u.is_talk_valid?(talk)
		valid_talks << Talk.new(talk)
	end
end

puts "Após a 1ª validação das Talks: #{valid_talks.size}"

#Ordena e copia o estado inicial das palestras válidas 
valid_talks.sort!{ |t1, t2| t2.duration <=> t1.duration } 
copy = valid_talks.slice(0..-1)

#Inicializa as informações de tempo da sessão da manhã
morning_start 		= Time.new(2016,03,04,9,0,0)
morning_end 			= Time.new(2016,03,04,12,0,0)
morning_time 			= TimeBlock.new(morning_start, morning_end)
morning_session1 	= Session.new(morning_time)

#Distribui as palestras na sessão
valid_talks.each_with_index do |talk, i|
	if talk.duration <= morning_session1.time.minutes_remaining
		morning_session1.add_talk(talk)
		valid_talks.delete_at(i)
	end
end

#puts "Após 1ª distribuição: #{valid_talks.size}"
#puts valid_talks
#puts "---------------------------------"

#Inicializa as informações de tempo da sessão da tarde
afternoon_start 		= Time.new(2016,03,04,13,0,0)
afternoon_end 			= Time.new(2016,03,04,16,0,0)
afternoon_max_end 	= Time.new(2016,03,04,17,0,0)
afternoon_time 			= TimeBlock.new(afternoon_start, afternoon_end, afternoon_max_end)
afternoon_session1 	= Session.new(afternoon_time)

#Distribui as palestras na sessão
valid_talks.each_with_index do |talk, i|
	if talk.duration <= afternoon_session1.time.minutes_remaining
		afternoon_session1.add_talk(talk)
		valid_talks.delete(i)
	end
end

#puts "Após 2ª distribuição: #{valid_talks.size}"
#puts valid_talks
#puts "---------------------------------"

#Define os horários do Track
track_start = Time.new(2016,03,04,9,0,0)
track_end 	= Time.new(2016,03,04,17,0,0)
track_time 	= TimeBlock.new(track_start, track_end)

#Define os brakes, com os horários fixados
b1 							 = Brake.new("Lunch", 60)
lunch_brake_time = Time.new(2016,03,04,12,0,0)
b1.lock_start_time_at(lunch_brake_time)

b2 							 = Brake.new("Networking Event", 60)
event_brake_time = Time.new(2016,03,04,17,0,0)
b2.lock_start_time_at(event_brake_time)

#Cria o track com as sessões
track = Track.new(track_time, "Track 1")
track.add_session(morning_session1)
track.add_brake(b1)
track.add_session(afternoon_session1)
track.add_brake(b2)
track.schedule

#---------------------------------------------------------------------------------
#---------------------------------------------------------------------------------
#---------------------------------------------------------------------------------

#Inicializa as informações de tempo da sessão da manhã
morning_start2 		= Time.new(2016,03,05,9,0,0)
morning_end2			= Time.new(2016,03,05,12,0,0)
morning_time2			= TimeBlock.new(morning_start2, morning_end2)
morning_session2 	= Session.new(morning_time2)

#Distribui as palestras na sessão
valid_talks.each_with_index do |talk, i|
	if talk.duration <= morning_session2.time.minutes_remaining
		morning_session2.add_talk(talk)
		valid_talks.delete_at(i)
	end
end

#puts "Após 3ª distribuição: #{valid_talks.size}"
#puts valid_talks
#puts "---------------------------------"

#Inicializa as informações de tempo da sessão da tarde
afternoon_start2 		= Time.new(2016,03,05,13,0,0)
afternoon_end2			= Time.new(2016,03,05,16,0,0)
afternoon_max_end2 	= Time.new(2016,03,05,17,0,0)
afternoon_time2			= TimeBlock.new(afternoon_start2, afternoon_end2, afternoon_max_end2)
afternoon_session2 	= Session.new(afternoon_time2)

#Distribui as palestras na sessão
valid_talks.each_with_index do |talk, i|
	if talk.duration <= afternoon_session2.time.minutes_remaining
		afternoon_session2.add_talk(talk)
		valid_talks.delete_at(i)
	end
end

#puts "Após 4ª distribuição: #{valid_talks.size}"
#puts valid_talks
#puts "---------------------------------"

#Define os horários do Track
track_start2 	= Time.new(2016,03,05,9,0,0)
track_end2 		= Time.new(2016,03,05,17,0,0)
track_time2 	= TimeBlock.new(track_start2, track_end2)

#Define os brakes, com os horários fixados
b3 							 	= Brake.new("Lunch", 60)
lunch_brake_time2 = Time.new(2016,03,04,12,0,0)
b3.lock_start_time_at(lunch_brake_time2)

b4 							 	= Brake.new("Networking Event", 60)
event_brake_time2 = Time.new(2016,03,04,17,0,0)
b4.lock_start_time_at(event_brake_time2)

#Cria o track com as sessões
track2 = Track.new(track_time, "Track 2")
track2.add_session(morning_session2)
track2.add_brake(b3)
track2.add_session(afternoon_session2)
track2.add_brake(b4)

track2.schedule