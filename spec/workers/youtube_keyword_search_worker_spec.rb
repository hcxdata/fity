require 'rails_helper'

RSpec.describe YoutubeKeywordSearchWorker, type: :worker do
  describe "#perform", :vcr do
    let(:keyword) { create :keyword, words: "cppcc" }
    before { subject.perform(keyword.id) }
    it { expect(YoutubeVideo.count).to eq 25 }
  end
end
