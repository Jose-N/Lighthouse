require 'yaml'
require 'httparty'
require 'fileutils'

def convert_time_url(time)
    time.gsub!(':', '%3A')
end

def search_latest_video(channelId, publishedAfter, publishedBefore)
    config_yaml = YAML::load_file("../config/application.yml")
    video_list = []

    base = 'https://www.googleapis.com/youtube/v3/search?part=snippet&'    
    channel = 'channelId=' + channelId + '&'
    middle = 'maxResults=50&order=date&'
    startDate = 'publishedAfter=' + convert_time_url(publishedAfter) + '&'
    endDate = 'publishedBefore=' + convert_time_url(publishedBefore) + '&'
    finish = 'type=vodep&fields=items(id%2FvideoId%2Csnippet(publishedAt%2Ctitle))%2CpageInfo%2FtotalResults&key='
    key = config_yaml["data_key"]
    url = base + channel + middle + startDate + endDate + finish + key

    response = HTTParty.get(url)
    responseTwo = response.parsed_response["items"]
    responseTwo.each do |item|
        id = item['id']
        video_list << id['videoId']
    end
   video_list 
end
