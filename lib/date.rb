require 'date'

def grab_dates(*date)
    if date.size == 1
        if date[0] == 'today'
            puts Date.today
        end
    end
end

grab_dates('today')
