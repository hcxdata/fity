class InstagramMediumTracking < ActiveRecord::Base
  belongs_to :medium, class_name: InstagramMedium
end
