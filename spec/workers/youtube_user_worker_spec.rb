require 'rails_helper'

RSpec.describe YoutubeUserWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :youtube_user, username: "bbcnews" }
    before { subject.perform(user.id) }
    it { expect(user.reload.user_id).to eq "16niRr50-MSBwiO3YDb3RA" }
  end
end
