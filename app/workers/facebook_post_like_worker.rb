class FacebookPostLikeWorker
  include FacebookClient

  def perform(post_id)
    facebook_post = FacebookPost.find(post_id)
    comments_datas = facebook_client.get_object(facebook_post.upcode, :fields => "likes.summary(true)");
    facebook_post.like_count = comments_datas["likes"]["summary"]["total_count"] if comments_datas.key?("likes")
    facebook_post.sync(facebook_post.as_json)
  end
end
