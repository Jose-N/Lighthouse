require 'yaml'
require 'httparty'
require 'fileutils'


dspgaming = 'UCGAQFQoZNIFUnQQuA-Llu9A'
startD = '2017-05-26T00:00:00Z'
endD = '2017-05-27T00:00:00Z'

def convert_time_url(time)
    time.gsub!(':', '%3A')
end

def search_latest_video(channelId, publishedAfter, publishedBefore)
    config_yaml = YAML::load_file("../config/application.yml")

    base = 'https://www.googleapis.com/youtube/v3/search?part=snippet&'    
    channel = 'channelId=' + channelId + '&'
    middle = 'maxResults=50&order=date&'
    startDate = 'publishedAfter=' + convert_time_url(publishedAfter) + '&'
    endDate = 'publishedBefore=' + convert_time_url(publishedBefore) + '&'
    finish = 'type=vodep&fields=items(id%2FvideoId%2Csnippet(publishedAt%2Ctitle))%2CpageInfo%2FtotalResults&key='
    key = config_yaml["data_key"]
    url = base + channel + middle + startDate + endDate + finish + key

    puts url
    response = HTTParty.get(url)
    response.parsed_response
    puts response
end

search_latest_video(dspgaming, startD, endD)
