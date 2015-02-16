# == Schema Information
#
# Table name: keywords
#
#  id         :integer          not null, primary key
#  words      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Keyword < ActiveRecord::Base
  def self.schedule_all
    Keyword.find_each do |keyword|
      TwitterKeywordSearchWorker.perform_in(rand(60), keyword.id)
      YoutubeKeywordSearchWorker.perform_in(rand(60), keyword.id)
    end
  end
end
