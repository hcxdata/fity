class FacebookUserPostWorker
  include FacebookClient

  def perform(user_id)
	facebook_user = FacebookUser.find(user_id)
	facebook_datas = facebook_client.get_connection(facebook_user.name, 'posts');
	facebook_datas.each do |data|
		post = facebook_user.posts.where(upcode: data["id"]).first_or_initialize
		post.sync(data)
    end
  end
end
