require 'date'

def grab_dates(*date)
    if date.size == 1
        if date[0] == 'today'
            puts Date.today
        else
            puts date[0]
        end
    elsif date.size > 1
        date.each do |day|
            puts day
        end
    else 
        puts 'please enter a date or dates'
    end
end

grab_dates()
