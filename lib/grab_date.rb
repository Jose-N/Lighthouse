require 'date'

def grab_dates(date)
    list = []

    if date.size == 1
        if date[0] == 'today'
             list << Date.today
        else
            list << Date.parse(date[0])
        end
    elsif date.size > 1
        date.each do |day|
            list << Date.parse(day)
        end
        list
    else 
        puts 'please enter a date or dates'
    end
end

def get_yesterday(first_day)
    yesterday = []
    first_day.each do |day|
        unless day.kind_of?(String)
            yesterday << day.prev_day
        else
            puts "One of these things isnt a date"
        end
    end
    yesterday
end

def get_tomorrow(first_day)
    tomorrow = []
    first_day.each do |day|
        unless day.kind_of?(String)
            tomorrow << day.next_day
        else
            puts "One of these things isnt a date"
        end
    end
    tomorrow
end
