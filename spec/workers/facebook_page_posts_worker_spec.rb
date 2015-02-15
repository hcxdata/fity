require 'rails_helper'

RSpec.describe FacebookPagePostsWorker, type: :worker do
  describe "#perform", :vcr do
    let(:page) { create :facebook_page, username: "leehom" }
    before { subject.perform(page.id) }
    it { expect(page.posts.count).to eq 25 }
  end
end
