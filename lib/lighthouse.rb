require_relative 'video_info'
require_relative 'get_videos'
require_relative 'grab_date'

# Channels to search
dspgaming = 'UCGAQFQoZNIFUnQQuA-Llu9A'
kogaming = 'UClFWgP2iZ7GElM8Db6NJ5-g'
kingofhatevlogs = 'UC3s6f_J5nB6kHXsta90N77Q'

# Time to add to dates
time = 'T00:00:00Z'

# Ask for the date to pull videos from
puts "What date do you want to get videos from? (year-month-date)"
startDate = gets.chomp
date = startDate[8...10].to_i

# Logic to get what the next date will be and adds time to the date
tom = (date + 1).to_s
endDate = startDate[0...-2] + tom
startHere = convert_time_url(startDate + time)
endHere = convert_time_url(endDate + time)

# Pull DSPGaming
dspDaily = search_latest_video(dspgaming, startHere, endHere)
video_info(dspDaily, 'DSPGaming')

koDaily = search_latest_video(kogaming, startHere, endHere)
video_info(koDaily, 'KOGaming')

kingDaily = search_latest_video(kingofhatevlogs, startHere, endHere)
video_info(kingDaily, 'King of Hate')
