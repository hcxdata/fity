class FacebookPostCommentWorker
  include FacebookClient

  def perform(post_id)
    facebook_post = FacebookPost.find(post_id)
    comments_datas = facebook_client.get_object(facebook_post.upcode, fields: "comments.summary(true)")
    facebook_post.comment_count = comments_datas["comments"]["summary"]["total_count"] if comments_datas.key?("comments")
    facebook_post.sync(facebook_post.as_json)
  end
end
