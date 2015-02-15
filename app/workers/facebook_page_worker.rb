class FacebookPageWorker
  include FacebookClient

  def perform(page_id)
    facebook_page = FacebookPage.find(page_id)
    data = facebook_client.get_object(facebook_page.username)
    facebook_page.sync(data)
  end
end
