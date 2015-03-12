class UpdateExtraToInstagramMedia < ActiveRecord::Migration
  class InstagramMedium < ActiveRecord::Base
  end

  def change
    InstagramMedium.find_each do |medium|
      medium.extra = eval(medium.extra).to_json
      medium.save
    end
  end
end
