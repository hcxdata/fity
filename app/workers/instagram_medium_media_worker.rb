class InstagramMediumMediaWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(medium_id)
    medium = InstagramMedium.find(medium_id)
    images = (medium.extra || {})
    data = images["thumbnail"]
    if data
      medium.media = download_file(data["url"])
      medium.save!
    end
  end
end
