require 'rails_helper'

RSpec.describe YoutubeUserVideoWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :youtube_user, username: "bbcnews" }
    before { subject.perform(user.id) }
    it { expect(user.videos.count).to eq 25 }
  end
end
