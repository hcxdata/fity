require 'rails_helper'

RSpec.describe FacebookUserPostWorker, type: :worker do
  describe "#perform", :vcr do
    let(:user) { create :facebook_user, name: "xhwcn", upcode: "1484558085142731" }
    before { subject.perform(user.id) }
    it { expect(user.posts.count).to eq 25 }
  end
end
