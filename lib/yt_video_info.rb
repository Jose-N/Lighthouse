require 'yaml'
require 'httparty'
require 'fileutils'

def video_info(urls)
    config_yaml = YAML::load_file("../config/application.yml")

    base = 'https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&id='
    videos = urls + '&'
    finish = 'fields=items(contentDetails%2Fduration%2CfileDetails%2FdurationMs%2Csnippet%2Ftitle%2Cstatistics(commentCount%2CdislikeCount%2ClikeCount%2CviewCount))&key='
    key = config_yaml["data_key"]
    url = base + videos + finish + key 

    puts url
    response = HTTParty.get(url)
    response.parsed_response
    puts response
end
video = 'PHu14EgJd_A%2Cj-Tfwtd5x_s'

video_info(video)
