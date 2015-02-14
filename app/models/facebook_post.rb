class FacebookPost < ActiveRecord::Base

  belongs_to :user, class_name: FacebookUser, foreign_key: "user_id"

    def sync(data)
      self.extra = data.to_h
      self.upcode = data.key?("upcode") ? data["upcode"] : data["id"]
      self.attributes = data.slice("message", "type", "created_time", "updated_time", "comment_count")
      save
    end

end
