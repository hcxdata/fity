class FacebookUserWorker
  include FacebookClient

  def perform(user_id)
    facebook_user = FacebookUser.find(user_id)
    user_data = facebook_client.get_object(facebook_user.name)
    facebook_user.sync(user_data)
  end
end
