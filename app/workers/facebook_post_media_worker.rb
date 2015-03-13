class FacebookPostMediaWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(post_id)
    post = FacebookPost.find(post_id)
    entities = (post.extra || {})
    data = entities["picture"]
    if data
      post.media = download_file(data)
      post.save!
    end
  end
end
