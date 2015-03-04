require 'rails_helper'

RSpec.describe InstagramUserWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :instagram_user, username: "kathunter_" }
    before { subject.perform(user.id) }
    it { expect(user.reload.upcode).to eq "191197935" }
  end
end
