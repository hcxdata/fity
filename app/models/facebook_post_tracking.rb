class FacebookPostTracking < ActiveRecord::Base
  belongs_to :post, class_name: FacebookPost, foreign_key: "post_id"
end
