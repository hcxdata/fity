class UpdateExtraToInstagramMedia < ActiveRecord::Migration
  class InstagramMedium < ActiveRecord::Base
    self.inheritance_column = "_type"
  end

  def change
    InstagramMedium.find_each do |medium|
      medium.extra = eval(medium.extra).to_json
      medium.save
    end
  end
end
