class YoutubeVideoMediaWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(video_id)
    video = YoutubeVideo.find(video_id)
    thumbnails = (video.thumbnails || {})
    data = thumbnails.find { |t| t["name"] == "default" }
    if data
      video.media = download_file(data["url"])
      video.save!
    end
  end
end
