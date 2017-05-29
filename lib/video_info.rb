require 'yaml'
require 'httparty'
require 'fileutils'

def video_info(urls)
    config_yaml = YAML::load_file("../config/application.yml")
    videos = ""

    base = 'https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&id='
    if urls.kind_of?(Array)
        urls.each do |item|
            videos << item + '%2C'
        end
        videos = videos[0...-3]
        videos << '&'
    else
        videos = urls + '&'
    end
    finish = 'fields=items(contentDetails%2Fduration%2CfileDetails%2FdurationMs%2Csnippet%2Ftitle%2Cstatistics(commentCount%2CdislikeCount%2ClikeCount%2CviewCount))&key='
    key = config_yaml["data_key"]
    url = base + videos + finish + key 

    response = HTTParty.get(url)
    responseTwo = response.parsed_response['items']
    responseTwo.each do |item|
        puts item['snippet']['title'] #+ ' ' + item['contentDetails']['duration'] + ' ' + item['statistics']['viewCount'] + ' ' + item['statistics']['likeCount'] + ' ' + item['statistics']['dislikeCount'] + ' ' + item['statistics']['commentCount']
    end
end
