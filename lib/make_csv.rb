require 'fileutils'
require 'date'

def make_csv(data, channel_name)
    today = Date.today

    file_name = today.to_s[0...-3] + channel_name
    file_path = '../csv_saves/' + file_name + '.csv'
    
    puts File.file?(file_path)
    
    unless File.file?(file_path)
        CSV.open(File.expand_path(file_path), 'a') do |csv|
            csv << [channel_name]
            csv << ['title', 'duration', 'view_count', 'like_count', 'dislike_count', 'comment_count']
            puts "i should only ever see this once"
        end 
    end
    CSV.open(File.expand_path(file_path), 'a') do |csv|
        csv << data
        puts "Outputted to #{channel_name} file"
    end
end
