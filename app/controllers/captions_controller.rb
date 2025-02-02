
class CaptionsController < ApplicationController
  def index
    puts "Hello World!"
    #puts $redis.llen("foo")
  end

  def caption_recording
    record_id = params[:record_id]
    caption_locale = params[:caption_locale]
    provider = params[:provider]

    # TODO: Need to find how to get the key from settings.yaml
    #props = YAML::load(File.open('settings.yaml'))
    #provider = props["default_provider"]
      
    #if(params[:provider].present?)
        #provider = params[:provider]
    #end
    #puts "REDIS HOST=#{redis_host} PORT=#{redis_port} PASS=#{redis_password}"

    #redis_namespace = props["redis_list_namespace"]
    #
      
    caption_job = {record_id: record_id,
      caption_locale: caption_locale,
      provider: provider}
    $redis.lpush("caption_recordings_job", caption_job.to_json)
  end

  def caption_status
    record_id = params[:record_id]
    caption_locale = params[:caption_locale]
    caption_job = {record_id: record_id,
      caption_locale: caption_locale}
    # TODO:
    # pass locale as param
    caption = Caption.where(record_id: record_id)
    tp caption
  end

  private
    def find_record_by_id
      @captionfile = Captions.find(params[:id])
    end
end
