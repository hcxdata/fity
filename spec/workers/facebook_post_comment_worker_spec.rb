require 'rails_helper'

RSpec.describe FacebookPostCommentWorker, type: :worker do
  describe "#perform", :vcr do
    let(:post) { create :facebook_post, upcode: "228735667216_10152604361407217" , created_time: "2014-01-01", updated_time:  "2014-01-01"}
    before { subject.perform(post.id) }
    it { expect(post.upcode).to eq "228735667216_10152604361407217" }
  end
end
