require 'rails_helper'

RSpec.describe TwitterKeywordSearchWorker, type: :worker do
  describe "#perform", :vcr do
    let(:keyword) { create :keyword, words: "两会" }
    before { subject.perform(keyword.id) }
    it { expect(TwitterTweet.count).to eq 15 }
  end
end
