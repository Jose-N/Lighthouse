require_relative 'video_info'
require_relative 'get_videos'
require_relative 'grab_date'

# Channels to search
dspgaming = 'UCGAQFQoZNIFUnQQuA-Llu9A'
kogaming = 'UClFWgP2iZ7GElM8Db6NJ5-g'
kingofhatevlogs = 'UC3s6f_J5nB6kHXsta90N77Q'

# Time to add to dates
time = convert_time_url('T00:00:00Z')

puts 'are you playing catchup or autograbbing videos? (c/a)'
answer = gets.chomp

if answer == 'c'
    # Ask for the date/dates to pull videos from
    puts "What date do you want to get videos from? (year-month-date) \n For multiple dates use comma between them:"
    startDate = gets.chomp.split(',')

    date_to_start = []
    date_to_end = []

    grab_dates(startDate).each do |day1|
        date_to_start << day1.to_s + time
    end

    puts startDate
    get_tomorrow(grab_dates(startDate)).each do |day2|
        date_to_end << day2.to_s + time
    end

    date_to_start.each.with_index do |day, index|
        dspDaily = search_latest_video(dspgaming, day, date_to_end[index])
        video_info(dspDaily, 'DSPGAMING')
    end
end



# Pull DSPGaming
#dspDaily = search_latest_video(dspgaming, startHere, endHere)
#video_info(dspDaily, 'DSPGaming')

#koDaily = search_latest_video(kogaming, startHere, endHere)
#video_info(koDaily, 'KOGaming')

#kingDaily = search_latest_video(kingofhatevlogs, startHere, endHere)
#video_info(kingDaily, 'King of Hate')
