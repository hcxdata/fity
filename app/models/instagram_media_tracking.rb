class InstagramMediaTracking < ActiveRecord::Base
  belongs_to :media, class_name: InstagramMedium, foreign_key: "media_id"
end
