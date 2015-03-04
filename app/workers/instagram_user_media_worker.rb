class InstagramUserMediaWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(user_id)
    instagram_user = InstagramUser.find(user_id)

    with_proxy_env do
      medias = instagram_client.user_recent_media(instagram_user.upcode)
      medias.each do |data|
        instagram_media = instagram_user.medium.where(upcode: data.id).first_or_initialize
        instagram_media.sync!(data.as_json)
      end
    end
  end
end
