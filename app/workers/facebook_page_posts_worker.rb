class FacebookPagePostsWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(page_id)
    facebook_page = FacebookPage.find(page_id)
    facebook_datas = facebook_client.get_connection(facebook_page.username, 'posts', { fields: FacebookPost::API_FIELDS.join(",") }, facebook_http_options)
    facebook_datas.each do |data|
      post = facebook_page.posts.where(upcode: data["id"]).first_or_initialize
      post.sync!(data)
    end
  end
end
