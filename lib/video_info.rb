rendDateequire 'yaml'
require 'httparty'
require 'fileutils'
require_relative 'make_csv'

def video_info(urls, channel_name)
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
        title = item['snippet']['title']
        if title == nil
            title = 'N/A'
        end
        duration = item['contentDetails']['duration']
        if duration == nil
            duration = 'N/A'
        end
        viewCount = item['statistics']['viewCount']
        if viewCount == nil
            viewCount = 'N/A'
        end
        likeCount = item['statistics']['likeCount']
         if likeCount == nil
            likeCount = 'N/A'
        end
        dislikeCount = item['statistics']['dislikeCount']
         if dislikeCount == nil
            dislikeCount = 'N/A'
        end
        commentCount = item['statistics']['commentCount']
        if commentCount == nil
            commentCount = 'N/A'
        end
       data =  [title, duration, viewCount, likeCount, dislikeCount, commentCount]
       make_csv(data, channel_name)
    end
end
