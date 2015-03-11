# == Schema Information
#
# Table name: instagram_medium_trackings
#
#  id             :integer          not null, primary key
#  medium_id      :integer
#  recording_at   :datetime
#  likes_count    :integer
#  comments_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InstagramMediumTracking < ActiveRecord::Base
  belongs_to :medium, class_name: InstagramMedium
end
