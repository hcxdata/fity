require 'rails_helper'

RSpec.describe TwitterUserWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :twitter_user, screen_name: "zmt0516" }
    before { subject.perform(user.id) }
    it { expect(user.reload.upcode).to eq "117779821" }
  end
end
