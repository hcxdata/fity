class UpdateExtraToFacebookPosts < ActiveRecord::Migration
  class FacebookPost < ActiveRecord::Base
  end

  def change
    FacebookPost.find_each do |p|
      p.extra = eval(p.extra).to_json
      p.save
    end
  end
end
