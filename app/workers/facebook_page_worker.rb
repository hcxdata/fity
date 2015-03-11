class FacebookPageWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(page_id)
    facebook_page = FacebookPage.find(page_id)
    data = facebook_client.get_object(facebook_page.username, {}, facebook_http_options)
    facebook_page.sync!(data)

    facebook_client.get_picture(facebook_page.username) do |url|
      facebook_page.picture = download_file(url)
      facebook_page.save!
    end
  end
end
