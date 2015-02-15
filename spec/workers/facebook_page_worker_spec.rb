require 'rails_helper'

RSpec.describe FacebookPageWorker, type: :worker do
  describe "#perform", :vcr do
    let(:page) { create :facebook_page, username: "leehom" }
    before { subject.perform(page.id) }
    it { expect(page.reload.upcode).to eq "56712367053" }
  end
end
