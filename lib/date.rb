require 'date'

def grab_dates(*date)
    if date.size == 1
        if date[0] == 'today'
            puts Date.today
        else
            puts date[0]
        end
    end
end

grab_dates('2017-05-30')
