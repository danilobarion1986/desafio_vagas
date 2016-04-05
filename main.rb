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

#Ordena e copia o estado inicial das palestras válidas 
valid_talks.sort!{ |t1, t2| t2.duration <=> t1.duration } 
copy = valid_talks.slice(0..-1)

#Inicializa as informações de tempo da sessão da manhã
morning_start = Time.new(2016,03,04,9,0,0)
morning_end = Time.new(2016,03,04,12,0,0)
morning_time = SessionTime.new(morning_start, morning_end)
morning_session1 = Session.new(morning_time)

#Distribui as palestras na sessão
valid_talks.each do |talk|
	if talk.duration <= morning_session1.time.minutes_remaining
		morning_session1.add_talk(talk)
		valid_talks.delete(talk)
	end
end

morning_session1.info
morning_session1.talks

#Inicializa as informações de tempo da sessão da tarde
afternoon_start = Time.new(2016,03,04,13,0,0)
afternoon_end = Time.new(2016,03,04,16,0,0)
afternoon_max_end = Time.new(2016,03,04,17,0,0)
afternoon_time = SessionTime.new(afternoon_start, afternoon_end, afternoon_max_end)
afternoon_session1 = Session.new(afternoon_time)

#Distribui as palestras na sessão
valid_talks.each do |talk|
	if talk.duration <= afternoon_session1.time.minutes_remaining
		afternoon_session1.add_talk(talk)
		valid_talks.delete(talk)
	end
end

afternoon_session1.info
afternoon_session1.talks

#Cria o track com as sessões
track = Track.new
track.add_session(morning_session1) #unless !u.is_session_valid?(morning_session1)
track.add_brake(Brake.new("Lunch", 60))
track.add_session(afternoon_session1) #unless !u.is_session_valid?(afternoon_session1)
track.add_brake(Brake.new("Networking Event", 60))

track.info
track.schedule