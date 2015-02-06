require 'rails_helper'

RSpec.describe TwitterUserTimelineWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :twitter_user, screen_name: "zmt0516" }
    before { subject.perform(user.id) }
    it { expect(user.tweets.count).to eq 20 }
  end
end
