# == Schema Information
#
# Table name: facebook_post_trackings
#
#  id             :integer          not null, primary key
#  post_id        :integer
#  recording_at   :datetime
#  comments_count :integer
#  likes_count    :integer
#  shares_count   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FacebookPostTracking < ActiveRecord::Base
  belongs_to :post, class_name: FacebookPost, foreign_key: "post_id"
end
