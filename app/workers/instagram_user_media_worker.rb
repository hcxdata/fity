class InstagramUserMediaWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(user_id)
    instagram_user = InstagramUser.find(user_id)

    media = instagram_client.user_recent_media(instagram_user.upcode)
    media.each do |data|
      instagram_medium = instagram_user.media.where(upcode: data.id).first_or_initialize
      instagram_medium.sync!(data.as_json)
    end
  end
end
