require 'rails_helper'

RSpec.describe FacebookUserWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :facebook_user, name: "leehom" }
    before { subject.perform(user.id) }
    it { expect(user.reload.upcode).to eq "40796308305" }
  end
end
