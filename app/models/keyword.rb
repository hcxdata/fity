class Keyword < ActiveRecord::Base


  def self.schedule_all
    Keyword.find_each do |keyword|
      TwitterKeywordSearchWorker.perform_async(keyword.id)
    end
  end
end
