require 'rails_helper'

RSpec.describe InstagramUserMediaWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :instagram_user, upcode: "191197935" }
    before { subject.perform(user.id) }
    it { expect(user.media.count).to eq 20 }
  end
end
