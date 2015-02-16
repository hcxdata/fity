class FacebookPageWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(page_id)
    facebook_page = FacebookPage.find(page_id)
    data = facebook_client.get_object(facebook_page.username, {}, facebook_http_options)
    facebook_page.sync(data)
  end
end
